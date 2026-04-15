#requires -Modules Az.Accounts, Az.Resources

<#
.SYNOPSIS
    Genera un inventario de recursos de Azure con etiquetas principales.

.DESCRIPTION
    Se conecta a Azure, selecciona una suscripción y obtiene los recursos existentes.
    Luego construye un inventario simple con nombre, tipo, grupo de recursos, ubicación
    y algunas etiquetas comunes para exportarlo a CSV.

.NOTES
    Script de ejemplo anonimizado para fines didácticos.
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
