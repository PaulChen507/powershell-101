# Primeros comandos en PowerShell

Ya instalaste PowerShell y verificaste que funciona. Ahora viene la parte más importante: empezar a usarlo.

En esta sección veremos comandos sencillos para que puedas familiarizarte con la consola, entender cómo responde PowerShell y dar tus primeros pasos con confianza.

---

## Qué debes saber antes de empezar

PowerShell no solo ejecuta comandos. También trabaja con información estructurada, lo que más adelante te permitirá filtrar, ordenar y automatizar tareas con mucha más facilidad.

Por ahora, lo importante es perderle el miedo a la consola y empezar a probar comandos pequeños.

---

## Confirmar que PowerShell está funcionando

Abre PowerShell con:

```powershell
pwsh
```

Luego prueba este comando:

```powershell
Get-Date
```

Este comando muestra la fecha y hora actual del sistema.

---

## Tu primer comando de descubrimiento

Uno de los comandos más útiles para comenzar es:

```powershell
Get-Command
```

Este comando muestra una lista de comandos disponibles en tu sesión.

Al principio verás muchísimos resultados, y eso es normal. No necesitas memorizar nada. La idea es empezar a reconocer el estilo de los comandos.

---

## Cómo se nombran los comandos

Muchos comandos en PowerShell siguen esta estructura:

```text
Verbo-Sustantivo
```

Por ejemplo:

- `Get-Date`
- `Get-Process`
- `Get-Service`
- `Set-Location`

Esto hace que los comandos sean más fáciles de leer y entender.

---

## Ver procesos del sistema

Prueba este comando:

```powershell
Get-Process
```

Te mostrará los procesos que se están ejecutando en tu equipo.

Si quieres ver solo unos pocos resultados para no saturarte, puedes usar:

```powershell
Get-Process | Select-Object -First 5
```

Aquí ya estás viendo una idea muy importante de PowerShell: el uso del **pipeline** con `|`, que exploraremos mejor más adelante.

---

## Ver información del sistema

Puedes consultar información básica con comandos como estos:

```powershell
Get-Location
```

Muestra la ruta actual en la que te encuentras.

```powershell
Get-ChildItem
```

Muestra los archivos y carpetas del directorio actual.

```powershell
Get-Host
```

Muestra información sobre la sesión actual de PowerShell.

---

## Pedir ayuda desde la consola

Una de las mejores costumbres desde el inicio es aprender a pedir ayuda.

### Ayuda general sobre un comando

```powershell
Get-Help Get-Process
```

### Ver ejemplos de uso

```powershell
Get-Help Get-Process -Examples
```

### Ver ayuda más detallada

```powershell
Get-Help Get-Process -Detailed
```

Esto es muy útil porque no necesitas depender siempre de memoria o de buscar todo en Internet.

---

## Buscar comandos por tema

Si no sabes qué comando existe, puedes buscarlo.

Por ejemplo, para buscar comandos relacionados con procesos:

```powershell
Get-Command *process*
```

Para buscar comandos relacionados con servicios:

```powershell
Get-Command *service*
```

Esto te ayuda a descubrir comandos aunque no recuerdes el nombre exacto.

---

## Crear una variable

Las variables permiten guardar información para usarla después.

Ejemplo:

```powershell
$nombre = "Paul"
```

Para ver su contenido:

```powershell
$nombre
```

También puedes probar:

```powershell
$hoy = Get-Date
$hoy
```

Aquí estás guardando el resultado de un comando dentro de una variable.

---

## Navegar entre carpetas

Puedes moverte entre carpetas con:

```powershell
Set-Location C:\
```

También puedes usar su alias más conocido:

```powershell
cd C:\
```

Y para listar el contenido:

```powershell
Get-ChildItem
```

O su alias corto:

```powershell
ls
```

> **Importante:** PowerShell permite aliases, pero al aprender conviene familiarizarse primero con los nombres completos, porque son más claros y más fáciles de entender en scripts.

---

## Ver la versión de PowerShell

Este comando es muy útil y conviene recordarlo:

```powershell
$PSVersionTable
```

Te muestra información sobre la versión instalada, la plataforma y otros detalles del entorno.

---

## Ejercicio rápido de práctica

Prueba esta secuencia de comandos:

```powershell
Get-Date
Get-Location
Get-ChildItem
Get-Process | Select-Object -First 5
$equipo = $env:COMPUTERNAME
$equipo
$PSVersionTable
```

Con esto practicarás varios conceptos básicos:

- ejecutar comandos
- consultar información
- usar el pipeline
- guardar datos en variables
- revisar el entorno actual

---

## Errores normales al comenzar

Estas situaciones son completamente normales:

- escribir mal un comando
- usar una ruta que no existe
- olvidar el signo `$` en una variable
- confundir PowerShell con CMD o con Bash

Aprender PowerShell no consiste en evitar errores, sino en acostumbrarte a leerlos y corregirlos.

---

## Buen hábito desde hoy

Cada vez que aprendas un comando nuevo, intenta responder estas preguntas:

- ¿Qué hace?
- ¿Qué devuelve?
- ¿Cómo veo ayuda?
- ¿Cómo lo combinaría con otro comando?

Ese hábito te ayudará muchísimo más que memorizar listas largas de comandos.

---

## Resumen

En esta sección viste cómo:

- abrir PowerShell
- ejecutar comandos básicos
- descubrir comandos disponibles
- pedir ayuda
- usar variables simples
- navegar entre carpetas
- revisar tu versión de PowerShell

En la siguiente sección empezaremos a trabajar con variables, tipos de datos y cómo guardar información de manera más útil.

