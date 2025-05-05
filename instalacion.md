Para instalar Powershell en Windows y macOS, todavia no tengo la experencia con Linux.

Windows 10/11
winget install --id Microsoft.Powershell --source winget

Despues pwsh

Para actualizar la version

macOs

Instalar Powershell

brew install --cask powershell

Para actualizar Powershell

Invocar Powershell 
mymac ~ % pwsh
PowerShell 7.5.0
Revisar la versioninstalada

mymac ~ % pwsh --version
PowerShell 7.5.0

En el repositorio de GitHub indicar cual es la version actual

https://github.com/PowerShell/PowerShell/releases

Actualizar 7.5.1

A new PowerShell stable release is available: v7.5.1 
   Upgrade now, or check out the release page at:       
     https://aka.ms/PowerShell-Release?tag=v7.5.1      


mymac ~ % brew update
mymac ~ % brew upgrade --cask powershell

==> Running installer for powershell with sudo; the password may be necessary.
installer: Package name is PowerShell - 7.5.1
installer: Installing at base path /
installer: The install was successful.
==> Purging files for version 7.5.0 of Cask powershell
powershell was successfully upgraded!

Para revisar la version actualizada

mymac ~ % pwsh --version
PowerShell 7.5.1


VSCode

Mi recomendación personal:
No importa si estás utilizando Windows o macOS, yo utilizo VSCode para programar con Powershell.
Después de mucho tiempo usando Powershell ISE en Windows y otros IDE, con VSCode se me ha facilitado la vida

Descarga desde: https://code.visualstudio.com/

Extensiones recomendadas:

PowerShell
Path Intellisense

Algunas mejores prácticas (voy modificando a medida que voy aprendiendo)

Usa Write-Output en lugar de Write-Host para scripts reutilizables.
Comenta tu código con # para explicar lo que haces.
Usa Set-StrictMode -Version Latest para evitar errores comunes.
Guarda tus scripts en carpetas organizadas por proyecto.

** Después vemos el tema de Git que me ha sido muy útil


