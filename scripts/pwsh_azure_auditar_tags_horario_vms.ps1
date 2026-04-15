#requires -Modules Az.Accounts, Az.Compute

<#
.SYNOPSIS
    Audita etiquetas de horario en máquinas virtuales de Azure.

.DESCRIPTION
    Consulta máquinas virtuales de una suscripción y revisa si tienen configuradas
    las etiquetas esperadas para horarios de encendido y apagado.
    Exporta el resultado para análisis posterior.

.NOTES
    Script de ejemplo anonimizado para fines didácticos.
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
        VMName            = $VM.Name
        ResourceGroupName = $VM.ResourceGroupName
        Location          = $VM.Location
        TagEncendido      = $Tags['encendido']
        TagApagado        = $Tags['apagado']
        TieneTagEncendido = [string]::IsNullOrWhiteSpace($Tags['encendido']) -eq $false
        TieneTagApagado   = [string]::IsNullOrWhiteSpace($Tags['apagado']) -eq $false
        EstadoRevision    = if ([string]::IsNullOrWhiteSpace($Tags['encendido']) -or [string]::IsNullOrWhiteSpace($Tags['apagado'])) { 'Revisar etiquetas' } else { 'OK' }
    }
}
#endregion

#region Exportar
$Reporte | Export-Csv -Path $ArchivoCsv -NoTypeInformation -Encoding UTF8
#endregion

Write-Output "VMs auditadas: $($Reporte.Count)"
Write-Output "Archivo generado en: $ArchivoCsv"
