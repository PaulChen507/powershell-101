# Variables y tipos de datos en PowerShell

Hasta ahora ya viste cómo ejecutar comandos básicos y cómo guardar resultados simples en una variable. En esta sección vamos a profundizar un poco más para entender cómo PowerShell maneja la información.

Aprender variables y tipos de datos es importante porque te permitirá construir scripts más claros, reutilizables y fáciles de mantener.

---

## ¿Qué es una variable?

Una variable es un nombre que usas para guardar un valor y poder reutilizarlo más adelante.

En PowerShell, las variables siempre comienzan con el símbolo `$`.

Ejemplo:

```powershell
$nombre = "Paul"
```

Aquí:

- `$nombre` es la variable
- `=` asigna un valor
- `"Paul"` es el contenido guardado

Para ver su valor, solo escribe la variable:

```powershell
$nombre
```

---

## Crear variables básicas

Puedes guardar distintos tipos de datos.

### Texto

```powershell
$ciudad = "Panamá"
```

### Número

```powershell
$edad = 30
```

### Verdadero o falso

```powershell
$activo = $true
```

### Fecha

```powershell
$hoy = Get-Date
```

---

## Mostrar varias variables

También puedes revisar varias variables en una misma sesión:

```powershell
$nombre = "Ana"
$edad = 28
$activo = $true

$nombre
$edad
$activo
```

---

## Usar variables dentro de texto

Puedes combinar texto con variables fácilmente.

```powershell
$nombre = "Ana"
"Hola, $nombre"
```

Resultado esperado:

```text
Hola, Ana
```

Esto es útil para mensajes, reportes y salidas en scripts.

---

## Tipos de datos comunes

Aunque al principio no hace falta memorizar todos los tipos, sí conviene conocer los más frecuentes.

### Cadenas de texto

Son valores de texto.

```powershell
$mensaje = "Bienvenido a PowerShell"
```

### Enteros

Son números sin decimales.

```powershell
$usuarios = 25
```

### Decimales

Son números con parte decimal.

```powershell
$precio = 19.95
```

### Booleanos

Representan verdadero o falso.

```powershell
$habilitado = $true
$bloqueado = $false
```

### Fechas

PowerShell maneja muy bien fechas y horas.

```powershell
$fechaActual = Get-Date
```

---

## Ver el tipo de una variable

Si quieres saber qué tipo de dato tiene una variable, puedes usar:

```powershell
$fechaActual = Get-Date
$fechaActual.GetType()
```

O más específicamente:

```powershell
$fechaActual.GetType().FullName
```

Esto te ayuda a entender qué estás guardando realmente.

---

## PowerShell intenta ayudarte con los tipos

Una ventaja de PowerShell es que muchas veces detecta automáticamente el tipo de dato.

Por ejemplo:

```powershell
$numero = 100
$texto = "100"
```

A simple vista parecen parecidos, pero no son iguales:

- `$numero` contiene un número
- `$texto` contiene texto

Puedes comprobarlo así:

```powershell
$numero.GetType().FullName
$texto.GetType().FullName
```

---

## Operaciones básicas con variables

### Sumar números

```powershell
$a = 5
$b = 10
$a + $b
```

Resultado:

```text
15
```

### Unir texto

```powershell
$nombre = "Ana"
$apellido = "Pérez"
$nombre + " " + $apellido
```

Resultado:

```text
Ana Pérez
```

---

## Reasignar valores

Una variable puede cambiar durante la ejecución.

```powershell
$contador = 1
$contador = 2
$contador = 3
```

Al final, la variable tendrá el último valor asignado.

---

## Variables del entorno

PowerShell también puede leer información del sistema usando variables de entorno.

Por ejemplo:

```powershell
$env:COMPUTERNAME
$env:USERNAME
$env:PATH
```

Estas variables son muy útiles cuando quieres conocer datos del equipo o del usuario actual.

> **Nota:** algunas variables pueden variar según el sistema operativo.

---

## Variables automáticas

PowerShell incluye variables automáticas que tienen significado especial.

Por ejemplo:

```powershell
$HOME
$PWD
$PSVersionTable
```

Estas variables ayudan a conocer información de la sesión actual y del entorno de trabajo.

---

## Arreglos básicos

A veces una variable no guarda un solo valor, sino varios.

```powershell
$colores = "rojo", "azul", "verde"
```

Para ver todos los valores:

```powershell
$colores
```

Para ver uno específico:

```powershell
$colores[0]
$colores[1]
```

Recuerda que en PowerShell la posición empieza en **0**.

---

## Hashtables básicas

Otra estructura muy útil es la **hashtable**, que guarda pares de clave y valor.

```powershell
$persona = @{
    Nombre = "Ana"
    Edad   = 28
    Pais   = "Panamá"
}
```

Para ver el contenido:

```powershell
$persona
```

Para consultar un valor específico:

```powershell
$persona.Nombre
$persona.Edad
```

Más adelante esto será muy útil para configuraciones y scripts más organizados.

---

## Convertir resultados de comandos en variables

Una práctica muy común es guardar el resultado de un comando en una variable.

```powershell
$procesos = Get-Process
```

Ahora puedes reutilizar ese resultado:

```powershell
$procesos
$procesos.Count
```

Esto permite trabajar de forma más eficiente y evitar repetir comandos innecesariamente.

---

## Ejercicio rápido de práctica

Prueba este bloque:

```powershell
$nombre = "Carlos"
$edad = 35
$hoy = Get-Date
$servidores = "srv01", "srv02", "srv03"

"Usuario: $nombre"
"Edad: $edad"
$hoy
$servidores
$servidores[0]
$hoy.GetType().FullName
```

Con este ejercicio practicas:

- creación de variables
- texto
- números
- fechas
- arreglos
- revisión de tipos de datos

---

## Errores comunes al empezar

Estos errores son muy frecuentes y normales:

- olvidar el símbolo `$`
- intentar usar una variable que no existe
- mezclar texto con números sin entender la diferencia
- confundir un solo valor con un arreglo de varios valores
- no revisar qué tipo de dato devolvió un comando

La buena noticia es que todo esto se corrige con práctica y observación.

---

## Buen hábito desde hoy

Cada vez que guardes algo en una variable, pregúntate:

- ¿Qué contiene?
- ¿Es texto, número, fecha o una colección?
- ¿Puedo reutilizarlo después?
- ¿Necesito ver su tipo con `.GetType()`?

Ese hábito te ayudará mucho cuando empieces a escribir scripts reales.

---

## Resumen

En esta sección viste cómo:

- crear variables
- guardar texto, números, fechas y booleanos
- reutilizar variables dentro de texto
- revisar tipos de datos
- usar arreglos y hashtables básicas
- guardar resultados de comandos en variables

En la siguiente sección entraremos a uno de los conceptos más importantes de PowerShell: el **pipeline** y el trabajo con objetos.
