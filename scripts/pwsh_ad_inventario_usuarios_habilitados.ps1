#requires -Modules ActiveDirectory

<#
.SYNOPSIS
    Genera un inventario de usuarios habilitados en una OU.

.DESCRIPTION
    Consulta usuarios en una OU determinada, filtra solo cuentas habilitadas,
    selecciona atributos relevantes y exporta el resultado a un archivo CSV.

.NOTES
    Script de ejemplo anonimizado para fines didácticos.
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
