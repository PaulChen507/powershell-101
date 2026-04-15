#requires -Modules ExchangeOnlineManagement

<#
.SYNOPSIS
    Genera un inventario básico de buzones en Exchange Online.

.DESCRIPTION
    Se conecta a Exchange Online, consulta los buzones existentes y exporta
    propiedades administrativas útiles para revisión o documentación.

.NOTES
    Script de ejemplo anonimizado para fines didácticos.
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
