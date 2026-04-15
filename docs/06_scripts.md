# Scripts en PowerShell

Hasta ahora has trabajado con comandos sueltos en la consola. Eso está muy bien para aprender, probar ideas y entender cómo funciona PowerShell.

Pero llega un momento en que repetir comandos manualmente deja de ser práctico. Ahí es donde entran los **scripts**.

Un script es simplemente un archivo de texto que contiene comandos de PowerShell guardados para poder ejecutarlos de nuevo cuando lo necesites.

---

## ¿Qué es un script?

Un script de PowerShell es normalmente un archivo con extensión:

```text
.ps1
```

Dentro de ese archivo puedes guardar:

- uno o varios comandos
- variables
- validaciones
- lógica condicional
- ciclos
- funciones
- exportaciones a archivos

En otras palabras, un script te permite convertir una tarea manual en un proceso repetible.

---

## ¿Por qué usar scripts?

Guardar comandos en un script tiene muchas ventajas:

- evitas reescribir lo mismo cada vez
- reduces errores manuales
- documentas mejor lo que haces
- puedes compartir la automatización con otras personas
- puedes mejorar el script con el tiempo
- puedes construir tareas cada vez más útiles

Un script no tiene que ser grande para ser valioso. Incluso uno de pocas líneas ya puede ahorrarte tiempo.

---

## Tu primer script

Crea un archivo llamado `hola.ps1` con este contenido:

```powershell
Write-Output "Hola desde PowerShell"
Get-Date
```

Guarda el archivo y ejecútalo desde PowerShell.

Si estás en la carpeta donde lo guardaste, puedes usar:

```powershell
.\hola.ps1
```

Esto ejecutará las instrucciones que escribiste en el archivo.

---

## Cómo ejecutar un script

Supongamos que tienes este archivo:

```text
C:\Scripts\hola.ps1
```

Puedes ejecutarlo así:

```powershell
C:\Scripts\hola.ps1
```

O, si ya estás en esa carpeta:

```powershell
.\hola.ps1
```

> **Importante:** en PowerShell, `./` o `.\` indica “ejecuta el archivo que está en el directorio actual”.

---

## La política de ejecución

A veces, al intentar ejecutar un script, PowerShell muestra un error relacionado con la política de ejecución.

Por ejemplo, algo como esto:

```text
running scripts is disabled on this system
```

Eso no significa que tu script esté mal. Significa que PowerShell está aplicando una política de seguridad.

Puedes revisar la política actual con:

```powershell
Get-ExecutionPolicy
```

Y también puedes revisar el detalle por alcance con:

```powershell
Get-ExecutionPolicy -List
```

En muchos laboratorios o equipos personales, suele usarse una configuración que permita ejecutar scripts locales de forma segura. Antes de cambiar nada, conviene entender la política de tu entorno y seguir los lineamientos de tu organización.

---

## Estructura básica de un script

Un script sencillo suele tener estas partes:

1. variables
2. lógica o comandos principales
3. salida o reporte final

Ejemplo:

```powershell
$Nombre = "Ana"
$Fecha  = Get-Date

Write-Output "Hola, $Nombre"
Write-Output "Fecha actual: $Fecha"
```

Aunque sea simple, ya tiene estructura y es más fácil de entender que ejecutar líneas sueltas sin orden.

---

## Usar comentarios dentro del script

Los comentarios ayudan a explicar la intención del código.

### Comentario de una línea

```powershell
# Este comando obtiene la fecha actual
Get-Date
```

### Comentario de bloque

```powershell
<#
Este script es de ejemplo.
Su propósito es mostrar la estructura básica
que puede tener un archivo .ps1.
#>
```

Comentar bien un script ayuda mucho cuando vuelves a leerlo días o semanas después.

---

## Variables dentro de scripts

En scripts conviene declarar las variables al inicio para que sean fáciles de encontrar y modificar.

Ejemplo:

```powershell
$RutaSalida = "C:\Reportes"
$Fecha      = Get-Date -Format "yyyyMMdd"
$Archivo    = "$RutaSalida\reporte-$Fecha.txt"
```

Esto hace que el script sea más claro y más fácil de adaptar.

---

## Guardar salida en archivos

Una de las cosas más útiles en scripts es generar archivos.

Ejemplo:

```powershell
Get-Process | Select-Object Name, Id | Export-Csv .\procesos.csv -NoTypeInformation
```

También puedes generar un archivo de texto:

```powershell
Get-Date | Out-File .\fecha.txt
```

Esto permite que un script no solo muestre resultados en pantalla, sino que también deje evidencia o reportes.

---

## Ejemplo práctico: inventario simple de procesos

Guarda este archivo como `inventario-procesos.ps1`:

```powershell
$RutaSalida = "C:\Reportes"
$Fecha      = Get-Date -Format "yyyyMMdd-HHmmss"
$ArchivoCsv = "$RutaSalida\procesos-$Fecha.csv"

if (-not (Test-Path -Path $RutaSalida)) {
    New-Item -Path $RutaSalida -ItemType Directory -Force | Out-Null
}

$Procesos = Get-Process | Select-Object Name, Id, CPU
$Procesos | Export-Csv -Path $ArchivoCsv -NoTypeInformation -Encoding UTF8

Write-Output "Procesos exportados: $($Procesos.Count)"
Write-Output "Archivo generado en: $ArchivoCsv"
```

Este ejemplo enseña varias cosas útiles:

- uso de variables
- validación de carpetas
- recolección de información
- exportación a CSV
- mensajes finales para el usuario

---

## Usar regiones para organizar scripts

Cuando un script empieza a crecer, puede ayudar agruparlo con regiones.

Ejemplo:

```powershell
#region Variables
$RutaSalida = "C:\Reportes"
#endregion

#region Consulta
$Procesos = Get-Process
#endregion

#region Exportar
$Procesos | Export-Csv .\procesos.csv -NoTypeInformation
#endregion
```

Esto no cambia la lógica, pero sí mejora mucho la lectura, especialmente en editores como VS Code.

---

## Encabezados de documentación

Una buena práctica muy útil es agregar un bloque inicial de documentación.

Ejemplo:

```powershell
<#
.SYNOPSIS
    Genera un inventario de procesos.

.DESCRIPTION
    Consulta los procesos del sistema y exporta el resultado a un archivo CSV.

.NOTES
    Script de ejemplo para aprendizaje.
#>
```

Más adelante, cuando escribas scripts más serios, este hábito te ayudará mucho.

---

## Modo simulación y cambios reales

Cuando un script realiza cambios, conviene pensar desde el inicio en cómo probarlo primero de forma segura.

Una práctica común es tener una variable como esta:

```powershell
$ModoPrueba = $true
```

Y luego usarla para decidir si solo muestras lo que harías o si aplicas realmente el cambio.

Este concepto es muy importante en automatización responsable.

---

## Errores normales al comenzar

Estos errores son comunes cuando alguien empieza a trabajar con scripts:

- guardar el archivo con extensión incorrecta
- ejecutar el script desde la carpeta equivocada
- no entender la política de ejecución
- usar rutas que no existen
- no validar si una variable está vacía
- mezclar pruebas rápidas con scripts que ya quieres reutilizar

Todo esto mejora con práctica y orden.

---

## Buen hábito desde hoy

Cuando escribas un script, intenta que responda estas preguntas:

- ¿qué hace?
- ¿qué necesita para ejecutarse?
- ¿qué variables deberían ir al inicio?
- ¿qué salida genera?
- ¿qué pasaría si alguien más lo ejecuta mañana?

Si un script responde bien a esas preguntas, casi siempre será más claro y más útil.

---

## Resumen

En esta sección viste cómo:

- entender qué es un script `.ps1`
- crear y ejecutar scripts simples
- organizar variables al inicio
- guardar resultados en archivos
- comentar y documentar scripts
- pensar en estructura y reutilización

En la siguiente sección veremos buenas prácticas para escribir scripts más claros, más seguros y más fáciles de mantener.

