# Ejemplos de scripts para Active Directory

Estos ejemplos están pensados para una audiencia que está aprendiendo PowerShell aplicado a **Active Directory**.

Todos los nombres, dominios, rutas y valores fueron **anonimizados** para eliminar referencias reales de ambientes productivos. Puedes adaptarlos a tu propio laboratorio o entorno de prueba.

> **Importante:** prueba siempre estos scripts en un ambiente controlado antes de utilizarlos en producción.

---

## Convenciones usadas en estos ejemplos

Para mantener los ejemplos limpios y reutilizables, usaremos valores ficticios como estos:

- Dominio AD: `corp.contoso.local`
- Dominio de correo: `contoso.com`
- OU de ejemplo: `OU=Usuarios,DC=corp,DC=contoso,DC=local`
- Ruta de salida: `C:\Reportes\ActiveDirectory`

---

## Ejemplo 1: Auditoría de discrepancias entre mail y UserPrincipalName

Este script busca usuarios en Active Directory donde el atributo `mail` no coincide con `UserPrincipalName`.

Es un ejemplo muy útil para explicar:

- lectura de usuarios desde AD
- comparación de atributos
- normalización a minúsculas
- generación de reportes

## Script 1

```powershell
#requires -Modules ActiveDirectory

<#
.SYNOPSIS
    Audita discrepancias entre los atributos mail y UserPrincipalName en Active Directory.

.DESCRIPTION
    Consulta usuarios dentro de una OU específica y compara los atributos mail y UserPrincipalName.
    La comparación se realiza en minúsculas para evitar falsos positivos por diferencias de mayúsculas/minúsculas.
    Exporta el resultado a un archivo CSV para revisión.
#>

#region Variables
$OuBusqueda  = 'OU=Usuarios,DC=corp,DC=contoso,DC=local'
$RutaSalida  = 'C:\Reportes\ActiveDirectory'
$Fecha       = Get-Date -Format 'yyyyMMdd-HHmmss'
$ArchivoCsv  = Join-Path $RutaSalida "AD-Auditoria-Mail-vs-UPN-$Fecha.csv"
#endregion

#region Preparar salida
if (-not (Test-Path -Path $RutaSalida)) {
    New-Item -Path $RutaSalida -ItemType Directory -Force | Out-Null
}
#endregion

#region Consulta AD
$Usuarios = Get-ADUser -SearchBase $OuBusqueda -Filter * -Properties mail, UserPrincipalName, Enabled, DisplayName, SamAccountName |
    Select-Object DisplayName, SamAccountName, UserPrincipalName, mail, Enabled
#endregion

#region Analisis
$Anomalias = foreach ($Usuario in $Usuarios) {
    $Mail = if ($null -ne $Usuario.mail) { $Usuario.mail.ToLower() } else { '' }
    $UPN  = if ($null -ne $Usuario.UserPrincipalName) { $Usuario.UserPrincipalName.ToLower() } else { '' }

    if ($Mail -ne $UPN) {
        [pscustomobject]@{
            DisplayName       = $Usuario.DisplayName
            SamAccountName    = $Usuario.SamAccountName
            UserPrincipalName = $Usuario.UserPrincipalName
            Mail              = $Usuario.mail
            Enabled           = $Usuario.Enabled
            Estado            = 'Discrepancia detectada'
        }
    }
}
#endregion

#region Exportar
$Anomalias | Export-Csv -Path $ArchivoCsv -NoTypeInformation -Encoding UTF8
#endregion

Write-Output "Se encontraron $($Anomalias.Count) discrepancias."
Write-Output "Reporte generado en: $ArchivoCsv"
```

## Qué enseña este ejemplo 1

- Cómo consultar usuarios con `Get-ADUser`
- Cómo pedir propiedades adicionales con `-Properties`
- Cómo comparar atributos de forma segura
- Cómo exportar resultados para revisión

---

## Ejemplo 2: Actualizar el atributo `mail` usando `UserPrincipalName`

Este ejemplo toma una lista de usuarios desde Active Directory y actualiza el atributo `mail` con el valor de `UserPrincipalName`.

Es ideal para explicar:

- automatización controlada
- uso de respaldo previo
- uso de `-WhatIf`
- cambios masivos con validación previa

## Script 2

```powershell
#requires -Modules ActiveDirectory

<#
.SYNOPSIS
    Actualiza el atributo mail con el valor de UserPrincipalName.

.DESCRIPTION
    Busca usuarios dentro de una OU y, cuando el atributo mail está vacío o no coincide con UserPrincipalName,
    lo corrige usando el valor del UPN.
    Antes de modificar, genera un respaldo CSV con el estado actual.
#>

#region Variables
$OuBusqueda   = 'OU=Usuarios,DC=corp,DC=contoso,DC=local'
$RutaSalida   = 'C:\Reportes\ActiveDirectory'
$Fecha        = Get-Date -Format 'yyyyMMdd-HHmmss'
$ArchivoBkp   = Join-Path $RutaSalida "AD-Respaldo-Mail-$Fecha.csv"
$ModoWhatIf   = $true
#endregion

#region Preparar salida
if (-not (Test-Path -Path $RutaSalida)) {
    New-Item -Path $RutaSalida -ItemType Directory -Force | Out-Null
}
#endregion

#region Consulta usuarios
$Usuarios = Get-ADUser -SearchBase $OuBusqueda -Filter * -Properties mail, UserPrincipalName, DisplayName, SamAccountName |
    Select-Object DisplayName, SamAccountName, DistinguishedName, UserPrincipalName, mail
#endregion

#region Respaldo
$Usuarios | Export-Csv -Path $ArchivoBkp -NoTypeInformation -Encoding UTF8
Write-Output "Respaldo generado en: $ArchivoBkp"
#endregion

#region Correccion
foreach ($Usuario in $Usuarios) {
    $UPN  = if ($null -ne $Usuario.UserPrincipalName) { $Usuario.UserPrincipalName.Trim() } else { '' }
    $Mail = if ($null -ne $Usuario.mail) { $Usuario.mail.Trim() } else { '' }

    if (-not [string]::IsNullOrWhiteSpace($UPN) -and $Mail.ToLower() -ne $UPN.ToLower()) {
        Write-Output "Actualizando mail para $($Usuario.SamAccountName): $Mail -> $UPN"

        if ($ModoWhatIf) {
            Set-ADUser -Identity $Usuario.SamAccountName -EmailAddress $UPN -WhatIf
        }
        else {
            Set-ADUser -Identity $Usuario.SamAccountName -EmailAddress $UPN
        }
    }
}
#endregion
```

## Qué enseña este ejemplo 2

- Cómo preparar un cambio masivo de forma responsable
- La importancia de respaldar antes de modificar
- Cómo usar una variable tipo “modo simulación”
- Cómo aplicar cambios solo cuando realmente hacen falta

---

## Ejemplo 3: Inventario básico de usuarios habilitados en una OU

Este script genera un inventario básico de usuarios activos dentro de una OU específica.

Es un excelente ejemplo de entrada para personas que están comenzando porque combina:

- búsqueda en AD
- filtrado
- selección de atributos
- exportación de resultados

## Script 3

```powershell
#requires -Modules ActiveDirectory

<#
.SYNOPSIS
    Genera un inventario de usuarios habilitados en una OU.

.DESCRIPTION
    Consulta usuarios en una OU determinada, filtra solo cuentas habilitadas,
    selecciona atributos relevantes y exporta el resultado a un archivo CSV.
#>

#region Variables
$OuBusqueda  = 'OU=Usuarios,DC=corp,DC=contoso,DC=local'
$RutaSalida  = 'C:\Reportes\ActiveDirectory'
$Fecha       = Get-Date -Format 'yyyyMMdd-HHmmss'
$ArchivoCsv  = Join-Path $RutaSalida "AD-Inventario-Usuarios-Habilitados-$Fecha.csv"
#endregion

#region Preparar salida
if (-not (Test-Path -Path $RutaSalida)) {
    New-Item -Path $RutaSalida -ItemType Directory -Force | Out-Null
}
#endregion

#region Consulta y exportacion
$Usuarios = Get-ADUser -SearchBase $OuBusqueda -Filter * -Properties DisplayName, SamAccountName, UserPrincipalName, mail, Department, Title, Enabled |
    Where-Object { $_.Enabled -eq $true } |
    Select-Object DisplayName, SamAccountName, UserPrincipalName, mail, Department, Title

$Usuarios | Export-Csv -Path $ArchivoCsv -NoTypeInformation -Encoding UTF8
#endregion

Write-Output "Usuarios habilitados exportados: $($Usuarios.Count)"
Write-Output "Archivo generado en: $ArchivoCsv"
```

## Qué enseña este ejemplo 3

- Cómo construir un inventario simple y útil
- Cómo filtrar solo cuentas habilitadas
- Cómo seleccionar solo los campos que interesan
- Cómo generar una salida fácil de compartir
