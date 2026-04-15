# Buenas prácticas en PowerShell

Aprender comandos y crear scripts es solo una parte del camino. La otra parte, igual de importante, es desarrollar buenas prácticas.

Las buenas prácticas no existen para “hacer más bonito” un script. Existen para que el código sea:

- más claro
- más fácil de mantener
- más seguro
- más fácil de compartir
- menos propenso a errores

En esta sección veremos hábitos sencillos que te ayudarán desde el principio.

---

## 1. Escribe código para que otra persona lo entienda

Un script no debe escribirse solo para que funcione hoy. También debe ser entendible mañana.

Eso significa:

- usar nombres claros
- ordenar el código
- agregar comentarios útiles
- evitar líneas innecesariamente confusas

Por ejemplo, esto:

```powershell
$x = Get-Process
```

funciona, pero esto es más claro:

```powershell
$Procesos = Get-Process
```

Cuando el nombre explica el contenido, el script se vuelve más fácil de leer.

---

## 2. Usa nombres de variables claros

Prefiere nombres que expliquen la intención.

Mejor esto:

```powershell
$RutaSalida = "C:\Reportes"
$FechaReporte = Get-Date -Format "yyyyMMdd"
```

que esto:

```powershell
$a = "C:\Reportes"
$b = Get-Date
```

No se trata de escribir nombres gigantes, sino de que tengan sentido.

---

## 3. Organiza las variables al inicio

Cuando un script tiene valores que podrían cambiar, conviene agruparlos al principio.

Ejemplo:

```powershell
#region Variables
$RutaSalida       = "C:\Reportes"
$NombreArchivo    = "usuarios.csv"
$DominioPrincipal = "contoso.com"
#endregion
```

Eso hace más fácil adaptar el script sin tener que buscar valores repartidos por todo el archivo.

---

## 4. Usa `Write-Output` con intención

Cuando quieras producir una salida reutilizable, `Write-Output` suele ser una mejor elección que `Write-Host`.

Ejemplo:

```powershell
Write-Output "Proceso completado"
```

`Write-Host` puede ser útil para mensajes visuales en pantalla, pero `Write-Output` se integra mejor con el pipeline y con otras operaciones.

Una forma simple de pensarlo es esta:

- **`Write-Output`**: cuando la salida forma parte del flujo del script
- **`Write-Host`**: cuando solo quieres mostrar algo visualmente al usuario

---

## 5. Comenta el por qué, no solo el qué

Evita comentarios que repitan exactamente lo que ya dice el código.

Por ejemplo, esto aporta poco:

```powershell
# Obtener procesos
Get-Process
```

Pero esto aporta contexto real:

```powershell
# Se consultan los procesos para exportar un inventario básico del equipo
Get-Process
```

Los mejores comentarios explican intención, decisión o contexto.

---

## 6. Agrega encabezados de documentación

Cuando un script deja de ser una prueba rápida y empieza a ser reutilizable, conviene agregar un bloque como este:

```powershell
<#
.SYNOPSIS
    Genera un inventario de procesos.

.DESCRIPTION
    Consulta procesos del sistema y exporta el resultado a un archivo CSV.

.NOTES
    Script de ejemplo para aprendizaje.
#>
```

Este hábito mejora mucho la mantenibilidad del script.

---

## 7. Valida rutas y recursos antes de usarlos

No asumas que una carpeta existe o que un archivo siempre estará ahí.

Ejemplo:

```powershell
if (-not (Test-Path -Path $RutaSalida)) {
    New-Item -Path $RutaSalida -ItemType Directory -Force | Out-Null
}
```

Validar antes de actuar evita muchos errores simples.

---

## 8. Evita hacer cambios sin respaldo previo

Si un script va a modificar información, conviene pensar primero en cómo respaldar el estado actual.

Por ejemplo:

- exportar los datos actuales a CSV
- guardar la configuración antes de cambiarla
- probar primero en un grupo reducido
- ejecutar inicialmente en modo simulación

Automatizar no significa cambiar más rápido sin pensar. Significa cambiar de forma más controlada.

---

## 9. Prueba primero en modo seguro

Cuando un script modifica datos, conviene empezar con pruebas controladas.

Algunas ideas útiles:

- usar una variable como `$ModoWhatIf = $true`
- probar con pocos objetos primero
- imprimir en pantalla qué haría el script antes de ejecutar cambios reales

Eso reduce el riesgo y te ayuda a validar la lógica antes de afectar un entorno real.

---

## 10. Usa `Set-StrictMode` en scripts más formales

Cuando empieces a escribir scripts más estructurados, puede ayudarte activar:

```powershell
Set-StrictMode -Version Latest
```

Esto ayuda a detectar ciertos errores comunes, como usar variables no definidas o referencias incorrectas.

No siempre lo verás en pruebas rápidas, pero es una práctica muy útil en scripts serios.

---

## 11. Mantén una estructura consistente

Aunque no existe una única estructura obligatoria, ayuda mucho que tus scripts tengan siempre un orden parecido.

Por ejemplo:

1. encabezado de documentación
2. variables
3. validaciones
4. conexión o consulta
5. procesamiento
6. exportación o salida final

Cuando mantienes un patrón, leer tus propios scripts se vuelve mucho más fácil.

---

## 12. Separa pruebas rápidas de scripts reutilizables

Está bien experimentar en la consola. De hecho, es parte natural del aprendizaje.

Pero cuando una secuencia ya funciona y quieres conservarla, conviértela en un script bien organizado en lugar de dejarla perdida en el historial.

Eso te ayuda a construir una biblioteca personal de automatizaciones útiles.

---

## 13. No abuses de los aliases al aprender

PowerShell permite aliases como:

```powershell
ls
cd
gci
```

Son cómodos, pero al aprender conviene familiarizarse con los nombres completos:

```powershell
Get-ChildItem
Set-Location
```

Los nombres completos son más claros, más didácticos y mejores para documentación.

---

## 14. Piensa en la salida del script

Un buen script no solo “hace algo”. También deja claro qué ocurrió.

Por ejemplo, es útil informar:

- cuántos objetos procesó
- qué archivo generó
- si hubo errores o advertencias
- qué quedó pendiente por revisar

Ejemplo:

```powershell
Write-Output "Usuarios exportados: $($Usuarios.Count)"
Write-Output "Archivo generado en: $ArchivoCsv"
```

Esto mejora mucho la experiencia de quien ejecuta el script.

---

## 15. Mantén el código simple mientras aprendes

Cuando estás empezando, no necesitas escribir scripts sofisticados para que sean valiosos.

Es mejor un script simple, claro y correcto que uno complejo y difícil de entender.

Primero domina lo básico:

- variables
- pipeline
- filtros
- exportaciones
- validaciones simples

Después podrás crecer hacia funciones, módulos y automatizaciones más avanzadas.

---

## 16. Guarda tus scripts por tema o proyecto

Una buena organización desde el inicio te ahorra mucho desorden después.

Por ejemplo:

```text
scripts/
  active-directory/
  azure/
  m365/
  reportes/
```

También ayuda usar nombres de archivo claros, por ejemplo:

```text
pwsh-ad-inventario-usuarios.ps1
pwsh-azure-inventario-recursos.ps1
pwsh-m365-inventario-buzones.ps1
```

---

## 17. Revisa tu código antes de compartirlo

Antes de publicar o enviar un script, conviene revisar:

- rutas locales innecesarias
- nombres internos de servidores
- dominios reales
- usuarios reales
- datos sensibles o confidenciales
- comentarios que no deberían salir del ambiente interno

Esto es especialmente importante si vas a compartir scripts en un blog o repositorio público.

---

## 18. Mejora tus scripts poco a poco

No intentes escribir el “script perfecto” desde el primer día.

Una forma más realista de trabajar es:

1. hacer que funcione
2. hacerlo entendible
3. hacerlo reutilizable
4. hacerlo más seguro
5. documentarlo mejor

Ese enfoque incremental funciona muy bien en PowerShell.

---

## Errores comunes que estas prácticas ayudan a evitar

Estas buenas prácticas ayudan a reducir problemas como:

- scripts difíciles de entender
- cambios sin respaldo previo
- rutas inválidas
- variables poco claras
- salidas confusas
- dificultad para reutilizar automatizaciones
- publicación accidental de datos sensibles

---

## Resumen

Las buenas prácticas en PowerShell te ayudan a escribir scripts que sean:

- más claros
- más seguros
- más ordenados
- más reutilizables
- más fáciles de mantener

No necesitas aplicar todo de manera perfecta desde el primer día. Lo importante es empezar a construir buenos hábitos.

Con el tiempo, esos hábitos hacen una gran diferencia entre un script improvisado y una automatización realmente útil.

