#requires -Modules ActiveDirectory

<#
.SYNOPSIS
    Actualiza el atributo mail con el valor de UserPrincipalName.

.DESCRIPTION
    Busca usuarios dentro de una OU y, cuando el atributo mail está vacío o no coincide con UserPrincipalName,
    lo corrige usando el valor del UPN.
    Antes de modificar, genera un respaldo CSV con el estado actual.

.NOTES
    Script de ejemplo anonimizado para fines didácticos.
#>

#region Variables
$OuBusqueda   = 'OU=Usuarios,DC=corp,DC=contoso,DC=local'
$RutaSalida   = 'C:\Reportes\ActiveDirectory'
$Fecha        = Get-Date -Format 'yyyyMMdd-HHmmss'
$ArchivoBkp   = Join-Path $RutaSalida "AD-Respaldo-Mail-$Fecha.csv"
$ModoWhatIf   = $true
#endregion

#region Preparar salida
if (-not (Test-Path -Path $RutaSalida)) {
    New-Item -Path $RutaSalida -ItemType Directory -Force | Out-Null
}
#endregion

#region Consulta usuarios
$Usuarios = Get-ADUser -SearchBase $OuBusqueda -Filter * -Properties mail, UserPrincipalName, DisplayName, SamAccountName |
    Select-Object DisplayName, SamAccountName, DistinguishedName, UserPrincipalName, mail
#endregion

#region Respaldo
$Usuarios | Export-Csv -Path $ArchivoBkp -NoTypeInformation -Encoding UTF8
Write-Output "Respaldo generado en: $ArchivoBkp"
#endregion

#region Correccion
foreach ($Usuario in $Usuarios) {
    $UPN  = if ($null -ne $Usuario.UserPrincipalName) { $Usuario.UserPrincipalName.Trim() } else { '' }
    $Mail = if ($null -ne $Usuario.mail) { $Usuario.mail.Trim() } else { '' }

    if (-not [string]::IsNullOrWhiteSpace($UPN) -and $Mail.ToLower() -ne $UPN.ToLower()) {
        Write-Output "Actualizando mail para $($Usuario.SamAccountName): $Mail -> $UPN"

        if ($ModoWhatIf) {
            Set-ADUser -Identity $Usuario.SamAccountName -EmailAddress $UPN -WhatIf
        }
        else {
            Set-ADUser -Identity $Usuario.SamAccountName -EmailAddress $UPN
        }
    }
}
#endregion
