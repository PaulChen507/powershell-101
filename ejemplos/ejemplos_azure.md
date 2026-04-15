# Ejemplos de scripts para Azure

Estos ejemplos están pensados para una audiencia que está aprendiendo PowerShell aplicado a **Azure**.

Todos los nombres de suscripciones, grupos de recursos, etiquetas, regiones, nombres de máquinas y rutas fueron **anonimizados** para eliminar referencias reales de ambientes productivos. Puedes adaptarlos a tu propio laboratorio o entorno de prueba.

> **Importante:** prueba siempre estos scripts en un ambiente controlado antes de utilizarlos en producción.

---

## Convenciones usadas en estos ejemplos

Para mantener los ejemplos limpios y reutilizables, usaremos valores ficticios como estos:

- Suscripción: `Contoso-Production`
- Grupo de recursos: `rg-app-production`
- Región: `East US 2`
- Ruta de salida: `C:\Reportes\Azure`
- Etiquetas de ejemplo: `ambiente`, `owner`, `apagado`, `encendido`

---

# Ejemplo 1: Inventario de recursos de Azure con etiquetas

## Qué problema resuelve este script

En muchos entornos de Azure, una de las primeras necesidades es generar un inventario de recursos para saber:

- qué recursos existen
- en qué grupo de recursos están
- en qué región se encuentran
- qué etiquetas tienen configuradas

Este ejemplo muestra cómo consultar recursos de Azure y exportar la información a un archivo para revisión.

## Qué módulo necesita

- `Az.Accounts`
- `Az.Resources`

## Qué variables se deben adaptar

- `$SubscriptionName`
- `$RutaSalida`

## Qué salida genera

- Un archivo CSV con el inventario de recursos y sus etiquetas principales.

## Qué precauciones tomar antes de ejecutarlo

- Verifica que tienes permisos para leer recursos en la suscripción.
- Confirma que el módulo `Az` está instalado.
- Ajusta la ruta de salida si vas a ejecutar el script en otro equipo.

## Script

```powershell
#requires -Modules Az.Accounts, Az.Resources

<#
.SYNOPSIS
    Genera un inventario de recursos de Azure con etiquetas principales.

.DESCRIPTION
    Se conecta a Azure, selecciona una suscripción y obtiene los recursos existentes.
    Luego construye un inventario simple con nombre, tipo, grupo de recursos, ubicación
    y algunas etiquetas comunes para exportarlo a CSV.
#>

#region Variables
$SubscriptionName = 'Contoso-Production'
$RutaSalida       = 'C:\Reportes\Azure'
$Fecha            = Get-Date -Format 'yyyyMMdd-HHmmss'
$ArchivoCsv       = Join-Path $RutaSalida "Azure-Inventario-Recursos-$Fecha.csv"
#endregion

#region Preparar salida
if (-not (Test-Path -Path $RutaSalida)) {
    New-Item -Path $RutaSalida -ItemType Directory -Force | Out-Null
}
#endregion

#region Conexion
Connect-AzAccount
Set-AzContext -Subscription $SubscriptionName | Out-Null
#endregion

#region Inventario
$Recursos = Get-AzResource | ForEach-Object {
    [pscustomobject]@{
        Name              = $_.Name
        ResourceType      = $_.ResourceType
        ResourceGroupName = $_.ResourceGroupName
        Location          = $_.Location
        Ambiente          = $_.Tags['ambiente']
        Owner             = $_.Tags['owner']
    }
}
#endregion

#region Exportar
$Recursos | Export-Csv -Path $ArchivoCsv -NoTypeInformation -Encoding UTF8
#endregion

Write-Output "Recursos exportados: $($Recursos.Count)"
Write-Output "Archivo generado en: $ArchivoCsv"
```

---

# Ejemplo 2: Auditoría de máquinas virtuales según etiquetas de encendido y apagado

## Qué problema resuelve este script

En Azure es muy común usar etiquetas para gobernar horarios operativos de máquinas virtuales, por ejemplo:

- `encendido = 0700`
- `apagado = 2000`

Este ejemplo no enciende ni apaga máquinas. Su objetivo es **auditar** cuáles VMs tienen o no tienen esas etiquetas, para ayudar a preparar procesos de automatización más adelante.

## Qué módulo necesita

- `Az.Accounts`
- `Az.Compute`

## Qué variables se deben adaptar

- `$SubscriptionName`
- `$RutaSalida`

## Qué salida genera

- Un archivo CSV indicando qué máquinas cumplen y cuáles tienen etiquetas faltantes.

## Qué precauciones tomar antes de ejecutarlo

- Este script es solo de lectura.
- Aun así, valida que estés apuntando a la suscripción correcta.
- Revisa los nombres reales de las etiquetas si tu organización usa otro estándar.

## Script

```powershell
#requires -Modules Az.Accounts, Az.Compute

<#
.SYNOPSIS
    Audita etiquetas de horario en máquinas virtuales de Azure.

.DESCRIPTION
    Consulta máquinas virtuales de una suscripción y revisa si tienen configuradas
    las etiquetas esperadas para horarios de encendido y apagado.
    Exporta el resultado para análisis posterior.
#>

#region Variables
$SubscriptionName = 'Contoso-Production'
$RutaSalida       = 'C:\Reportes\Azure'
$Fecha            = Get-Date -Format 'yyyyMMdd-HHmmss'
$ArchivoCsv       = Join-Path $RutaSalida "Azure-Auditoria-Tags-VMs-$Fecha.csv"
#endregion

#region Preparar salida
if (-not (Test-Path -Path $RutaSalida)) {
    New-Item -Path $RutaSalida -ItemType Directory -Force | Out-Null
}
#endregion

#region Conexion
Connect-AzAccount
Set-AzContext -Subscription $SubscriptionName | Out-Null
#endregion

#region Auditoria
$VMs = Get-AzVM

$Reporte = foreach ($VM in $VMs) {
    $Tags = $VM.Tags

    [pscustomobject]@{
        VMName              = $VM.Name
        ResourceGroupName   = $VM.ResourceGroupName
        Location            = $VM.Location
        TagEncendido        = $Tags['encendido']
        TagApagado          = $Tags['apagado']
        TieneTagEncendido   = [string]::IsNullOrWhiteSpace($Tags['encendido']) -eq $false
        TieneTagApagado     = [string]::IsNullOrWhiteSpace($Tags['apagado']) -eq $false
        EstadoRevision      = if ([string]::IsNullOrWhiteSpace($Tags['encendido']) -or [string]::IsNullOrWhiteSpace($Tags['apagado'])) { 'Revisar etiquetas' } else { 'OK' }
    }
}
#endregion

#region Exportar
$Reporte | Export-Csv -Path $ArchivoCsv -NoTypeInformation -Encoding UTF8
#endregion

Write-Output "VMs auditadas: $($Reporte.Count)"
Write-Output "Archivo generado en: $ArchivoCsv"
```

---

# Ejemplo 3: Inventario de cuentas de almacenamiento con configuración básica

## Qué problema resuelve este script

Las cuentas de almacenamiento son componentes fundamentales en Azure. En muchos casos se necesita una vista rápida para revisar:

- nombre de la cuenta
n- grupo de recursos
- región
- tipo de SKU
- tipo de redundancia
- acceso público habilitado o no

Este ejemplo genera un inventario sencillo que puede servir para documentación, auditoría o revisión inicial.

## Qué módulo necesita

- `Az.Accounts`
- `Az.Storage`

## Qué variables se deben adaptar

- `$SubscriptionName`
- `$RutaSalida`

## Qué salida genera

- Un archivo CSV con información básica de las cuentas de almacenamiento.

## Qué precauciones tomar antes de ejecutarlo

- Verifica que tu cuenta tenga permisos de lectura sobre los recursos.
- En algunos entornos, ciertas propiedades pueden variar según la versión del módulo.

## Script

```powershell
#requires -Modules Az.Accounts, Az.Storage

<#
.SYNOPSIS
    Genera un inventario básico de cuentas de almacenamiento en Azure.

.DESCRIPTION
    Se conecta a una suscripción de Azure, obtiene las cuentas de almacenamiento
    y construye un reporte con propiedades útiles para revisión administrativa.
#>

#region Variables
$SubscriptionName = 'Contoso-Production'
$RutaSalida       = 'C:\Reportes\Azure'
$Fecha            = Get-Date -Format 'yyyyMMdd-HHmmss'
$ArchivoCsv       = Join-Path $RutaSalida "Azure-Inventario-StorageAccounts-$Fecha.csv"
#endregion

#region Preparar salida
if (-not (Test-Path -Path $RutaSalida)) {
    New-Item -Path $RutaSalida -ItemType Directory -Force | Out-Null
}
#endregion

#region Conexion
Connect-AzAccount
Set-AzContext -Subscription $SubscriptionName | Out-Null
#endregion

#region Inventario
$StorageAccounts = Get-AzStorageAccount | ForEach-Object {
    [pscustomobject]@{
        StorageAccountName = $_.StorageAccountName
        ResourceGroupName  = $_.ResourceGroupName
        Location           = $_.Location
        SkuName            = $_.Sku.Name
        Kind               = $_.Kind
        AccessTier         = $_.AccessTier
        AllowBlobPublic    = $_.AllowBlobPublicAccess
    }
}
#endregion

#region Exportar
$StorageAccounts | Export-Csv -Path $ArchivoCsv -NoTypeInformation -Encoding UTF8
#endregion

Write-Output "Storage Accounts exportadas: $($StorageAccounts.Count)"
Write-Output "Archivo generado en: $ArchivoCsv"
```

---

# Recomendaciones didácticas para el blog

Al publicar estos scripts en el blog, puedes acompañarlos con una explicación sencilla como esta:

1. **Qué problema resuelve el script**
2. **Qué módulo necesita**
3. **Qué variables se deben adaptar**
4. **Qué salida genera**
5. **Qué precauciones tomar antes de ejecutarlo**

Eso ayuda mucho a que una persona principiante no solo copie el script, sino que también entienda su propósito.

---

# Próximo paso sugerido

Después de estos ejemplos de Azure, la siguiente tanda natural sería:

- **3 scripts para Microsoft 365**

Así el repositorio queda balanceado y muestra cómo PowerShell puede usarse en identidad local, nube e integración con servicios empresariales.

