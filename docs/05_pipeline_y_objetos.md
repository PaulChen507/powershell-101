# Pipeline y objetos en PowerShell

Si hay una idea que distingue a PowerShell de muchas otras consolas, es esta: **PowerShell trabaja con objetos, no solo con texto**.

Entender esto cambia por completo la forma de usar la terminal. En lugar de recibir únicamente líneas de texto difíciles de procesar, PowerShell te entrega información estructurada que puedes filtrar, ordenar, transformar y reutilizar.

En esta sección veremos qué es el **pipeline**, cómo funciona y por qué es una de las características más poderosas de PowerShell.

---

## ¿Qué es el pipeline?

El pipeline es el mecanismo que permite pasar el resultado de un comando a otro comando.

Se representa con este símbolo:

```powershell
|
```

La idea es simple:

- un comando genera información
- esa información se envía al siguiente comando
- el siguiente comando la procesa

Ejemplo:

```powershell
Get-Process | Select-Object -First 5
```

Aquí ocurre lo siguiente:

- `Get-Process` obtiene la lista de procesos
- `Select-Object -First 5` toma solo los primeros 5

---

## ¿Por qué esto es tan importante?

Porque en PowerShell no estás copiando y pegando texto para manipularlo manualmente. Estás enviando objetos completos de un comando a otro.

Eso hace que tareas como estas sean mucho más fáciles:

- filtrar resultados
- ordenar información
- seleccionar columnas específicas
- exportar datos
- automatizar decisiones

---

## Primer ejemplo sencillo

Prueba este comando:

```powershell
Get-Service | Select-Object -First 10
```

Este ejemplo:

- obtiene servicios del sistema con `Get-Service`
- muestra solo los primeros 10 con `Select-Object`

---

## Seleccionar propiedades específicas

Los objetos tienen propiedades. Puedes elegir cuáles quieres mostrar.

Ejemplo:

```powershell
Get-Process | Select-Object -First 5 Name, Id, CPU
```

Aquí estás diciendo:

- trae procesos
- muestra solo los primeros 5
- enseña las propiedades `Name`, `Id` y `CPU`

Esto es muy útil porque no siempre necesitas ver toda la información.

---

## Filtrar información

Una de las operaciones más comunes es filtrar resultados.

Ejemplo:

```powershell
Get-Process | Where-Object CPU -gt 100
```

Esto busca procesos cuyo uso acumulado de CPU sea mayor que 100.

Otra forma muy común de escribirlo es:

```powershell
Get-Process | Where-Object { $_.CPU -gt 100 }
```

Más adelante entenderás mejor el uso de `$_`, pero por ahora basta con saber que representa el objeto actual que se está evaluando dentro del pipeline.

---

## Ordenar resultados

También puedes ordenar la información antes de mostrarla.

Ejemplo:

```powershell
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10 Name, CPU
```

Aquí:

- `Get-Process` obtiene los procesos
- `Sort-Object CPU -Descending` los ordena de mayor a menor por CPU
- `Select-Object -First 10 Name, CPU` muestra los 10 primeros con propiedades específicas

---

## Medir resultados

PowerShell también puede contar o medir objetos fácilmente.

Ejemplo:

```powershell
Get-Process | Measure-Object
```

Esto te devuelve información como la cantidad total de objetos.

Otro ejemplo:

```powershell
Get-ChildItem | Measure-Object
```

Así puedes saber cuántos elementos hay en una carpeta.

---

## Exportar resultados

Otra ventaja del pipeline es que puedes enviar resultados a un archivo.

Por ejemplo:

```powershell
Get-Process | Select-Object Name, Id | Export-Csv .\procesos.csv -NoTypeInformation
```

Esto genera un archivo CSV con el nombre e identificador de los procesos.

También puedes exportar a texto:

```powershell
Get-Process | Out-File .\procesos.txt
```

---

## Ver qué propiedades tiene un objeto

Cuando no sabes qué contiene un resultado, usa:

```powershell
Get-Process | Get-Member
```

Este comando es fundamental.

Te permite descubrir:

- propiedades
- métodos
- tipo de objeto

Por ejemplo, con `Get-Process | Get-Member` verás propiedades como:

- `Name`
- `Id`
- `CPU`
- `Handles`
- `WorkingSet`

Esto te ayuda a saber qué puedes seleccionar, filtrar o usar después.

---

## Texto vs objetos

Esta es una de las ideas más importantes de todo PowerShell.

En muchas terminales tradicionales, el resultado de un comando suele ser texto plano. En PowerShell, el resultado normalmente es un objeto con estructura.

Por ejemplo, este comando:

```powershell
Get-Service
```

No devuelve solo texto bonito en pantalla. Devuelve objetos de servicio, y la consola los presenta en una tabla para que sea más fácil leerlos.

Eso significa que puedes hacer cosas como:

```powershell
Get-Service | Select-Object Name, Status
```

O:

```powershell
Get-Service | Where-Object Status -eq 'Running'
```

Sin necesidad de “parsear” texto manualmente.

---

## Un ejemplo paso a paso

Mira este comando completo:

```powershell
Get-Service | Where-Object Status -eq 'Running' | Sort-Object Name | Select-Object -First 10 Name, Status
```

Esto hace varias cosas en secuencia:

1. Obtiene todos los servicios.
2. Filtra solo los que están en ejecución.
3. Los ordena por nombre.
4. Muestra solo los primeros 10.
5. Enseña únicamente las columnas `Name` y `Status`.

Eso es justamente la fuerza del pipeline: construir una tarea compleja uniendo pasos simples.

---

## El objeto actual: `$_`

Cuando usas `Where-Object` o `ForEach-Object`, muchas veces aparece `$_`.

Ejemplo:

```powershell
Get-Process | Where-Object { $_.ProcessName -like '*code*' }
```

Aquí `$_` representa el objeto actual que está pasando por el pipeline.

En otras palabras, PowerShell evalúa cada proceso uno por uno y pregunta:

- ¿su nombre coincide con `*code*`?

Si la respuesta es sí, ese objeto sigue adelante en el pipeline.

---

## Recorrer elementos con `ForEach-Object`

Puedes ejecutar una acción sobre cada objeto recibido.

Ejemplo:

```powershell
Get-ChildItem | ForEach-Object { $_.Name }
```

Este comando recorre cada archivo o carpeta del directorio actual y muestra su nombre.

Otro ejemplo:

```powershell
Get-Process | Select-Object -First 5 | ForEach-Object { $_.Name }
```

---

## Guardar resultados intermedios

No siempre tienes que hacer todo en una sola línea. También puedes guardar resultados en variables.

```powershell
$procesos = Get-Process
$procesos | Sort-Object CPU -Descending | Select-Object -First 5 Name, CPU
```

Esto hace que tus pruebas sean más fáciles de leer y depurar.

---

## Formatear la salida

Hay comandos específicos para mostrar la información más bonita en pantalla.

Por ejemplo:

```powershell
Get-Process | Format-Table Name, Id, CPU
```

O:

```powershell
Get-Process | Format-List Name, Id, CPU
```

Pero aquí hay una recomendación importante:

> Usa `Format-Table` y `Format-List` al final, solo cuando tu objetivo sea mostrar resultados en pantalla.

No conviene formatear demasiado pronto si luego quieres seguir procesando la información.

---

## Ejemplos prácticos para probar

### Ver los 5 procesos con mayor CPU

```powershell
Get-Process | Sort-Object CPU -Descending | Select-Object -First 5 Name, CPU
```

### Ver solo servicios en ejecución

```powershell
Get-Service | Where-Object Status -eq 'Running'
```

### Ver los archivos del directorio actual ordenados por nombre

```powershell
Get-ChildItem | Sort-Object Name
```

### Contar cuántos procesos hay

```powershell
Get-Process | Measure-Object
```

### Buscar procesos cuyo nombre contenga una palabra

```powershell
Get-Process | Where-Object { $_.ProcessName -like '*chrome*' }
```

---

## Errores comunes al comenzar

Estos errores son muy normales:

- usar `Format-Table` demasiado temprano y luego intentar seguir procesando datos
- no saber qué propiedades tiene un objeto
- confundir lo que se ve en pantalla con lo que realmente contiene el objeto
- olvidar usar `Get-Member` para explorar
- intentar memorizar todo en vez de experimentar paso a paso

---

## Buen hábito desde hoy

Cada vez que ejecutes un comando, intenta preguntarte:

- ¿qué tipo de objeto devuelve?
- ¿qué propiedades tiene?
- ¿qué puedo filtrar?
- ¿qué puedo ordenar?
- ¿qué puedo seleccionar?

Ese cambio de mentalidad es lo que te empieza a convertir en una persona que realmente entiende PowerShell.

---

## Ejercicio rápido de práctica

Prueba este bloque por partes:

```powershell
Get-Process | Get-Member
Get-Process | Select-Object -First 5 Name, Id, CPU
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10 Name, CPU
Get-Service | Where-Object Status -eq 'Running' | Select-Object -First 10 Name, Status
Get-ChildItem | Sort-Object Name | Select-Object -First 10 Name, Length
```

La idea no es memorizarlo, sino observar cómo va cambiando la salida cuando agregas cada paso del pipeline.

---

## Resumen

En esta sección viste cómo:

- usar el pipeline con `|`
- pasar información de un comando a otro
- seleccionar propiedades
- filtrar resultados
- ordenar información
- medir objetos
- explorar propiedades con `Get-Member`
- entender que PowerShell trabaja con objetos y no solo con texto

En la siguiente sección empezaremos a crear scripts y a guardar comandos en archivos `.ps1` para reutilizarlos.

