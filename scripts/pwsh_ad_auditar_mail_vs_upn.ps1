#requires -Modules ActiveDirectory

<#
.SYNOPSIS
    Audita discrepancias entre los atributos mail y UserPrincipalName en Active Directory.

.DESCRIPTION
    Consulta usuarios dentro de una OU específica y compara los atributos mail y UserPrincipalName.
    La comparación se realiza en minúsculas para evitar falsos positivos por diferencias de mayúsculas/minúsculas.
    Exporta el resultado a un archivo CSV para revisión.

.NOTES
    Script de ejemplo anonimizado para fines didácticos.
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
