# Instalación de PowerShell

En esta sección veremos cómo instalar PowerShell en **Windows** y **macOS**, cómo validar la versión instalada y cómo preparar un entorno cómodo para empezar a trabajar.

> **Nota:** En este material estamos usando **PowerShell Core** (normalmente invocado con `pwsh`), que es la versión moderna y multiplataforma de PowerShell.

---

## Antes de empezar

Conviene conocer estas dos ideas:

- **Windows PowerShell** es la versión clásica que venía integrada en Windows.
- **PowerShell Core / PowerShell** es la versión moderna, multiplataforma y la recomendada para aprender hoy.

Cuando termines la instalación, normalmente abrirás PowerShell con este comando:

```powershell
pwsh
```

---

## Instalación en Windows 10 y Windows 11

Una forma sencilla de instalar PowerShell en Windows es usando **winget**.

### Instalar PowerShell

Abre una terminal, PowerShell o Símbolo del sistema y ejecuta:

```powershell
winget install --id Microsoft.PowerShell --source winget
```

### Abrir PowerShell

Una vez instalada, puedes iniciarla con:

```powershell
pwsh
```

### Verificar la versión instalada

Para confirmar que la instalación fue exitosa:

```powershell
pwsh --version
```

Ejemplo de salida:

```text
PowerShell 7.5.0
```

### Actualizar PowerShell en Windows

Cuando quieras actualizar a una versión más reciente, puedes ejecutar nuevamente:

```powershell
winget upgrade --id Microsoft.PowerShell --source winget
```

Luego valida la versión actual:

```powershell
pwsh --version
```

---

## Instalación en macOS

En macOS, una de las formas más prácticas de instalar PowerShell es utilizando **Homebrew**.

### Instalar PowerShell

```powershell
brew install --cask powershell
```

### Abrir PowerShell

```powershell
pwsh
```

Ejemplo de salida:

```text
PowerShell 7.5.0
```

### Verificar la versión instalada

```powershell
pwsh --version
```

Ejemplo:

```text
PowerShell 7.5.0
```

### Actualizar PowerShell en macOS

Primero actualiza la información de Homebrew:

```powershell
brew update
```

Luego actualiza PowerShell:

```powershell
brew upgrade --cask powershell
```

Después puedes confirmar la nueva versión:

```powershell
pwsh --version
```

Ejemplo:

```text
PowerShell 7.5.1
```

---

## Verificar la versión más reciente disponible

Si quieres revisar cuál es la versión estable más reciente publicada por el equipo de PowerShell, puedes consultar el repositorio oficial en GitHub:

[PowerShell Releases](https://github.com/PowerShell/PowerShell/releases)

Esto es útil para comparar tu versión instalada con la versión más reciente disponible.

---

## Editor recomendado: Visual Studio Code

Mi recomendación personal, tanto en **Windows** como en **macOS**, es utilizar **Visual Studio Code** para trabajar con PowerShell.

Después de probar distintas opciones, VS Code me ha resultado muy cómodo para:

- escribir scripts
- corregir errores
- navegar entre archivos
- trabajar con proyectos más organizados
- integrar Git más adelante

Descarga VS Code desde aquí:

[Visual Studio Code](https://code.visualstudio.com/)

---

## Extensiones recomendadas en VS Code

Estas extensiones ayudan bastante al comenzar:

- **PowerShell**
- **Path Intellisense**

La extensión de PowerShell mejora mucho la experiencia porque aporta:

- resaltado de sintaxis
- autocompletado
- depuración
- ayuda para detectar errores
- ejecución más cómoda de scripts

---

## Buenas prácticas desde el inicio

Estas recomendaciones te pueden ahorrar muchos problemas más adelante:

- Usa `Write-Output` en lugar de `Write-Host` cuando quieras crear scripts más reutilizables.
- Agrega comentarios con `#` para explicar la intención del código.
- Usa `Set-StrictMode -Version Latest` cuando empieces a escribir scripts más formales.
- Guarda tus scripts en carpetas organizadas por tema o proyecto.
- Verifica siempre tu versión de PowerShell cuando estés siguiendo documentación o ejemplos de Internet.

---

## Validación rápida de la instalación

Cuando termines, prueba estos comandos:

```powershell
pwsh --version
Get-Date
$PSVersionTable
```

Si estos comandos funcionan correctamente, ya tienes un ambiente básico listo para comenzar.

---

## Resumen

Con esto ya deberías poder:

- instalar PowerShell en Windows o macOS
- abrir la consola con `pwsh`
- verificar la versión instalada
- actualizar PowerShell cuando sea necesario
- preparar VS Code como editor principal

En la siguiente sección comenzaremos con los primeros comandos básicos.

