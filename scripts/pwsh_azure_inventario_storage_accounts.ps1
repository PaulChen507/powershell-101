#requires -Modules Az.Accounts, Az.Storage

<#
.SYNOPSIS
    Genera un inventario básico de cuentas de almacenamiento en Azure.

.DESCRIPTION
    Se conecta a una suscripción de Azure, obtiene las cuentas de almacenamiento
    y construye un reporte con propiedades útiles para revisión administrativa.

.NOTES
    Script de ejemplo anonimizado para fines didácticos.
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
