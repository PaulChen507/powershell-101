# Ejemplos de scripts para Microsoft 365

Estos ejemplos están pensados para una audiencia que está aprendiendo PowerShell aplicado a **Microsoft 365**.

Todos los dominios, nombres de usuarios, grupos, buzones, licencias y rutas fueron **anonimizados** para eliminar referencias reales de ambientes productivos. Puedes adaptarlos a tu propio laboratorio o entorno de prueba.

> **Importante:** prueba siempre estos scripts en un ambiente controlado antes de utilizarlos en producción.

---

## Convenciones usadas en estos ejemplos

Para mantener los ejemplos limpios y reutilizables, usaremos valores ficticios como estos:

- Dominio principal: `contoso.com`
- Dominio tenant: `contoso.onmicrosoft.com`
- Buzón de ejemplo: `shared.finance@contoso.com`
- Grupo de ejemplo: `dl-finance@contoso.com`
- Ruta de salida: `C:\Reportes\M365`

---

## Ejemplo1:  Inventario básico de buzones en Exchange Online

## Qué problema resuelve este script

En muchos entornos de Microsoft 365, una necesidad frecuente es obtener un inventario rápido de buzones para documentación, revisión operativa o validación administrativa.

Este ejemplo muestra cómo conectarse a Exchange Online y exportar un listado básico de buzones con propiedades útiles.

## Qué módulo necesita

- `ExchangeOnlineManagement`

## Qué variables se deben adaptar

- `$RutaSalida`
- Si deseas filtrar por tipo de buzón o dominio, deberás ajustar la consulta.

## Qué salida genera

- Un archivo CSV con información básica de los buzones.

## Qué precauciones tomar antes de ejecutarlo

- Verifica que tu cuenta tenga permisos para consultar buzones.
- Confirma que el módulo `ExchangeOnlineManagement` esté instalado.
- Ejecuta primero una prueba en un entorno controlado.

## Script

```powershell
#requires -Modules ExchangeOnlineManagement

<#
.SYNOPSIS
    Genera un inventario básico de buzones en Exchange Online.

.DESCRIPTION
    Se conecta a Exchange Online, consulta los buzones existentes y exporta
    propiedades administrativas útiles para revisión o documentación.
#>

#region Variables
$RutaSalida  = 'C:\Reportes\M365'
$Fecha       = Get-Date -Format 'yyyyMMdd-HHmmss'
$ArchivoCsv  = Join-Path $RutaSalida "M365-Inventario-Buzones-$Fecha.csv"
#endregion

#region Preparar salida
if (-not (Test-Path -Path $RutaSalida)) {
    New-Item -Path $RutaSalida -ItemType Directory -Force | Out-Null
}
#endregion

#region Conexion
Connect-ExchangeOnline
#endregion

#region Consulta
$Buzones = Get-EXOMailbox -ResultSize Unlimited |
    Select-Object DisplayName,
                  PrimarySmtpAddress,
                  RecipientTypeDetails,
                  UserPrincipalName,
                  HiddenFromAddressListsEnabled
#endregion

#region Exportar
$Buzones | Export-Csv -Path $ArchivoCsv -NoTypeInformation -Encoding UTF8
#endregion

#region Cierre
Disconnect-ExchangeOnline -Confirm:$false
#endregion

Write-Output "Buzones exportados: $($Buzones.Count)"
Write-Output "Archivo generado en: $ArchivoCsv"
```

---

## Ejemplo 2: Auditoría de licencias asignadas a usuarios en Microsoft 365

## Qué problema resuelve este script 2

En Microsoft 365 es muy común necesitar una vista simple de qué usuarios tienen licencias asignadas y cuántas licencias tiene cada cuenta.

Este ejemplo sirve para explicar cómo consultar usuarios desde Microsoft Graph y construir un reporte básico de licenciamiento.

## Qué módulo necesita 2

- `Microsoft.Graph.Users`

## Qué variables se deben adaptar 2

- `$RutaSalida`
- Los permisos del tenant deben permitir lectura de usuarios y licencias.

## Qué salida genera 2

- Un archivo CSV con usuarios y cantidad de licencias asignadas.

## Qué precauciones tomar antes de ejecutarlo 2

- Verifica que tienes permisos adecuados en Microsoft Graph.
- Asegúrate de conectarte con los scopes correctos.
- Ten presente que el reporte es administrativo y no reemplaza reportes oficiales de facturación.

## Script 2

```powershell
#requires -Modules Microsoft.Graph.Users

<#
.SYNOPSIS
    Genera un reporte básico de usuarios y licencias asignadas en Microsoft 365.

.DESCRIPTION
    Se conecta a Microsoft Graph, consulta usuarios y construye un inventario
    simple con el número de licencias asignadas a cada cuenta.
#>

#region Variables
$RutaSalida  = 'C:\Reportes\M365'
$Fecha       = Get-Date -Format 'yyyyMMdd-HHmmss'
$ArchivoCsv  = Join-Path $RutaSalida "M365-Auditoria-Licencias-$Fecha.csv"
#endregion

#region Preparar salida
if (-not (Test-Path -Path $RutaSalida)) {
    New-Item -Path $RutaSalida -ItemType Directory -Force | Out-Null
}
#endregion

#region Conexion
Connect-MgGraph -Scopes 'User.Read.All','Organization.Read.All'
#endregion

#region Consulta
$Usuarios = Get-MgUser -All -Property DisplayName,UserPrincipalName,AssignedLicenses,AccountEnabled |
    ForEach-Object {
        [pscustomobject]@{
            DisplayName       = $_.DisplayName
            UserPrincipalName = $_.UserPrincipalName
            AccountEnabled    = $_.AccountEnabled
            LicensesAssigned  = ($_.AssignedLicenses | Measure-Object).Count
        }
    }
#endregion

#region Exportar
$Usuarios | Export-Csv -Path $ArchivoCsv -NoTypeInformation -Encoding UTF8
#endregion

#region Cierre
Disconnect-MgGraph
#endregion

Write-Output "Usuarios exportados: $($Usuarios.Count)"
Write-Output "Archivo generado en: $ArchivoCsv"
```

---

## Ejemplo 3: Inventario de grupos de distribución en Exchange Online

## Qué problema resuelve este script 3

Los grupos de distribución siguen siendo muy utilizados en Microsoft 365 para comunicación interna y externa. Muchas veces se necesita un inventario rápido para revisar:

- nombre del grupo
- dirección principal SMTP
- si acepta remitentes externos
- si está oculto de la libreta de direcciones

Este ejemplo permite construir ese inventario de forma sencilla.

## Qué módulo necesita 3

- `ExchangeOnlineManagement`

## Qué variables se deben adaptar 3

- `$RutaSalida`
- Si necesitas limitar resultados por dominio o prefijo, debes ajustar la consulta.

## Qué salida genera 3

- Un archivo CSV con información básica de grupos de distribución.

## Qué precauciones tomar antes de ejecutarlo 3

- Verifica que tu cuenta tenga permisos para consultar grupos.
- En algunos entornos puede haber grupos sincronizados desde Active Directory; este ejemplo es solo de inventario.

## Script 3

```powershell
#requires -Modules ExchangeOnlineManagement

<#
.SYNOPSIS
    Genera un inventario básico de grupos de distribución en Exchange Online.

.DESCRIPTION
    Se conecta a Exchange Online, consulta grupos de distribución y exporta
    propiedades administrativas útiles para inventario y revisión.
#>

#region Variables
$RutaSalida  = 'C:\Reportes\M365'
$Fecha       = Get-Date -Format 'yyyyMMdd-HHmmss'
$ArchivoCsv  = Join-Path $RutaSalida "M365-Inventario-GruposDistribucion-$Fecha.csv"
#endregion

#region Preparar salida
if (-not (Test-Path -Path $RutaSalida)) {
    New-Item -Path $RutaSalida -ItemType Directory -Force | Out-Null
}
#endregion

#region Conexion
Connect-ExchangeOnline
#endregion

#region Consulta
$Grupos = Get-DistributionGroup -ResultSize Unlimited |
    Select-Object DisplayName,
                  PrimarySmtpAddress,
                  HiddenFromAddressListsEnabled,
                  RequireSenderAuthenticationEnabled,
                  ManagedBy
#endregion

#region Exportar
$Grupos | Export-Csv -Path $ArchivoCsv -NoTypeInformation -Encoding UTF8
#endregion

#region Cierre
Disconnect-ExchangeOnline -Confirm:$false
#endregion

Write-Output "Grupos exportados: $($Grupos.Count)"
Write-Output "Archivo generado en: $ArchivoCsv"
```
