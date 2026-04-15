#requires -Modules ExchangeOnlineManagement

<#
.SYNOPSIS
    Genera un inventario básico de grupos de distribución en Exchange Online.

.DESCRIPTION
    Se conecta a Exchange Online, consulta grupos de distribución y exporta
    propiedades administrativas útiles para inventario y revisión.

.NOTES
    Script de ejemplo anonimizado para fines didácticos.
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
