#requires -Modules Microsoft.Graph.Users

<#
.SYNOPSIS
    Genera un reporte básico de usuarios y licencias asignadas en Microsoft 365.

.DESCRIPTION
    Se conecta a Microsoft Graph, consulta usuarios y construye un inventario
    simple con el número de licencias asignadas a cada cuenta.

.NOTES
    Script de ejemplo anonimizado para fines didácticos.
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
