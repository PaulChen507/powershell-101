
<# Documentar tus scripts en PowerShell es una buena práctica fundamental para que otros puedan entender, 
mantener y reutilizar el código en el futuro. Aquí te explico cómo hacerlo correctamente:#>

#1. Comentarios de una sola línea: Usa el símbolo `#` para agregar comentarios de una sola línea.
#2. Comentarios de varias líneas: Usa <# y #> para agregar comentarios de varias líneas.      
#3. Comentarios de documentación: Usa `"""` para agregar comentarios de documentación que describan
#el propósito del script, los parámetros y el uso general. Esto es especialmente útil para scripts más largos o complejos.
#4. Usa nombres descriptivos para variables y funciones: Asegúrate de que los nombres de tus variables y funciones sean claros y descriptivos.
#5. Mantén un estilo de codificación consistente: Usa un estilo de codificación coherente en todo tu script para que sea más fácil de leer y entender.
#6. Usa espacios en blanco y sangrías: Usa espacios en blanco y sangrías para mejorar la legibilidad del código.
#7. Usa funciones: Divide tu script en funciones para que sea más fácil de entender y reutilizar.   
#8. Usa ejemplos: Proporciona ejemplos de uso en los comentarios para que otros puedan entender cómo usar tu script.
#9. Usa el formato de salida adecuado: Asegúrate de que la salida de tu script sea fácil de leer y entender.
#>

# Conceptos Básicos de PowerShell

<#  Modulos
    ¿Qué es un Módulo en PowerShell?
    Un módulo en PowerShell es un paquete reutilizable de comandos, funciones, variables y otros recursos que puedes importar a tu sesión para extender sus capacidades.

¿Por qué usar módulos?
	•	Para organizar funciones relacionadas (como una caja de herramientas).
	•	Para reutilizar código entre scripts o proyectos.
	•	Para compartir scripts con otros usuarios o con tu equipo.
	•	Para aprovechar funcionalidades externas como Azure, AWS, Active Directory, etc.
#>

# Comandos esenciales para trabajar con módulos
# 1. Listar módulos disponibles
Get-Module -ListAvailable   
# 2. Importar un módulo
Import-Module NombreDelModulo
# 3. Exportar un módulo
Export-ModuleMember -Function NombreDeLaFuncion
# 4. Obtener información sobre un módulo
Get-Module NombreDelModulo
# 5. Desinstalar un módulo
Uninstall-Module NombreDelModulo
# 6. Actualizar un módulo
Update-Module NombreDelModulo
# 7. Buscar un módulo en la Galería de PowerShell
Find-Module -Name NombreDelModulo

# Donde se almacenan los módulos
# En Windows:
$env:PSModulePath -split ';'
# En macOS, los módulos de PowerShell se almacenan en la ruta de instalación de PowerShell Core.
# Puedes ver la ruta de instalación de PowerShell Core ejecutando el siguiente comando:
$env:PSModulePath -split ':|;'
# Ejemplo de rutas de módulos en macOS:
mymac ~ % pwsh
mymac ~ % $env:PSModulePath -split ':|;'
#/Users/myuser/.local/share/powershell/Modules
#/usr/local/share/powershell/Modules
#/usr/local/microsoft/powershell/7/Modules

<#  Cmdlets
    Los cmdlets son comandos especiales de PowerShell. 
    Tienen una estructura verbo-sustantivo.
    En PowerShell diseñados para realizar tareas particulares. 
    A diferencia de los comandos tradicionales de la línea de comandos, 
    los cmdlets están basados en objetos y pueden interactuar con el sistema operativo 
    y otras aplicaciones de manera más eficiente. 
    Cada cmdlet sigue una estructura de verbo-nombre, como Get-Help o Set-Item.   
#>

# Ejemplos de cmdlets que funcionan tanto en Windows como en macOS:
# 1. Obtener información sobre los procesos el sistema
Get-Process

# 2. Listar archivos y directorios
Get-ChildItem

# 3. Obtener información sobre el sistema operativo
# En Windows
Get-ComputerInfo
# En macOS
system_profiler SPSoftwareDataType

# 4. Probar la conectividad de red
Test-Connection -ComputerName apple.com


<#  Variables
    Las variables en PowerShell se definen con el símbolo `$` seguido del nombre de la variable.
    Puedes almacenar diferentes tipos de datos en variables, como cadenas de texto, números, listas, tablas hash, etc.
#>

# Ejemplo:
$miVariable = "Hola, PowerShell!"
Write-Host $miVariable -ForegroundColor Yellow

# Puedes usar variables para almacenar datos y luego usarlas en tus scripts.
# Ejemplo de uso de variables
$nombre = "Juan"
$edad = 30
$mensaje = "Hola, mi nombre es $nombre y tengo $edad años."

# Puedes mostrar el mensaje en la consola
Write-Host $mensaje
# También puedes usar variables para almacenar objetos, como listas o tablas.
# Ejemplo de uso de una lista

<#  Arrays 
    Un array es una colección ordenada de elementos indexados numéricamente. 
    Los elementos se acceden por su posición (empezando en 0)
#>

# Ejemplo de uso de un array
$miLista = @("Elemento1", "Elemento2", "Elemento3")

# Puedes recorrer la lista y mostrar cada elemento
foreach ($elemento in $miLista) {
    Write-Host $elemento
}

<#  Hashtable
    Un hashtable es una colección desordenada de pares clave-valor. 
    Se accede a los elementos por nombre de clave, no por posición.
    Un hashtable es una colección clave-valor, como un diccionario. Cada clave apunta a un solo valor.
    https://learn.microsoft.com/powershell/scripting/learn/deep-dives/everything-about-hashtable
#>

# Ejemplo de uso de una tabla hash
$miHashtable = @{
    "Nombre" = "Juan"
    "Edad"   = 30
    "Ciudad" = "Panama"
}

# Puedes acceder a los valores de la tabla hash usando la clave
Write-Host "Nombre: $($miHashtable["Nombre"])"
Write-Host "Edad: $($miHashtable["Edad"])"
Write-Host "Ciudad: $($miHashtable["Ciudad"])"

# Puedes agregar nuevos pares clave-valor a la tabla hash
$miHashtable["País"] = "Panamá"

# Puedes modificar un valor existente
$miHashtable["Edad"] = 31

# Puedes eliminar un par clave-valor de la tabla hash
$miHashtable.Remove("Nombre")

# Puedes verificar si una clave existe en la tabla hash
if ($miHashtable.ContainsKey("Ciudad")) {
    Write-Host "La clave 'Ciudad' existe en la tabla hash."
}
else {
    Write-Host "La clave 'Ciudad' no existe en la tabla hash."
}

# Puedes recorrer la tabla hash y mostrar cada clave y valor
foreach ($clave in $miHashtable.Keys) {
    Write-Host "$clave $($miHashtable[$clave])"
}

# Puedes usar el método GetEnumerator() para recorrer la tabla hash
foreach ($par in $miHashtable.GetEnumerator()) {
    Write-Host "$($par.Key): $($par.Value)"
}

<#  Tablas
    Una tabla es una colección ordenada de elementos indexados por un número entero.
    Puedes acceder a los elementos por su posición (empezando en 0).
    Cuando la gente habla de “tabla” en PowerShell, normalmente se refiere a:Un array de hashtables
    Una colección de filas, donde cada fila es una hashtable:
    Una tabla es una colección de filas y columnas, similar a una hoja de cálculo.
    Puedes usar una tabla para almacenar datos estructurados.
#> 

# Ejemplo de uso de una tabla
$miTabla = @(
    @{ Nombre = "Juan"; Edad = 30 },
    @{ Nombre = "María"; Edad = 25 },
    @{ Nombre = "Pedro"; Edad = 35 }
)

# Puedes recorrer la tabla y mostrar cada fila
foreach ($fila in $miTabla) {
    Write-Host "Nombre: $($fila.Nombre), Edad: $($fila.Edad)"
}

<#  PSCutomObjects
    Un PSCustomObject es un objeto personalizado que puedes crear en PowerShell.
    Puedes usar PSCustomObject para crear objetos con propiedades personalizadas.
    Muy útil para almacenar datos estructurados y para crear objetos que se pueden usar en scripts y funciones.
    Mi objeto favorito para almacenar datos estructurados y utilizaros en las salidas de mis scripts.

    https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-pscustomobject?view=powershell-7.5
    https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_pscustomobject?view=powershell-7.5

#>
# Ejemplo de uso de PSCustomObject
$miObjeto = [PSCustomObject]@{
    Nombre = "Juan"
    Edad   = 30
    Ciudad = "Panamá"
}
# Puedes acceder a las propiedades del objeto usando el operador punto
Write-Host "Nombre: $($miObjeto.Nombre)"
Write-Host "Edad: $($miObjeto.Edad)"
Write-Host "Ciudad: $($miObjeto.Ciudad)"

# Puedes agregar nuevas propiedades al objeto
$miObjeto.País = "Panamá"

# Puedes modificar una propiedad existente
$miObjeto.Edad = 31

# Puedes eliminar una propiedad del objeto
$miObjeto.PSObject.Properties.Remove("Ciudad")

# Puedes recorrer las propiedades del objeto y mostrar cada nombre y valor
foreach ($propiedad in $miObjeto.PSObject.Properties) {
    Write-Host "$($propiedad.Name): $($propiedad.Value)"
}

# Puedes usar el método GetEnumerator() para recorrer las propiedades del objeto
foreach ($par in $miObjeto.PSObject.Properties.GetEnumerator()) {
    Write-Host "$($par.Name): $($par.Value)"
}

# Puedes usar el método Select-Object para seleccionar propiedades específicas del objeto
$miObjeto | Select-Object Nombre, Edad

# Puedes usar el método Format-Table para formatear la salida del objeto en una tabla
$miObjeto | Format-Table -Property Nombre, Edad

# Puedes usar el método Export-Csv para exportar el objeto a un archivo CSV
$miObjeto | Export-Csv -Path "C:\ruta\archivo.csv" -NoTypeInformation

# Puedes usar el método ConvertTo-Json para convertir el objeto a JSON
$miObjeto | ConvertTo-Json

# Puedes usar el método ConvertFrom-Json para convertir un JSON a un objeto
$json = '{"Nombre":"Juan","Edad":30,"Ciudad":"Panamá"}'
$miObjetoDesdeJson = $json | ConvertFrom-Json

# Puedes acceder a las propiedades del objeto convertido desde JSON
Write-Host "Nombre: $($miObjetoDesdeJson.Nombre)"
Write-Host "Edad: $($miObjetoDesdeJson.Edad)"

# Puedes usar el método Get-Member para obtener información sobre las propiedades y métodos del objeto
$miObjeto | Get-Member

# Puedes usar el método Get-Member para obtener información sobre las propiedades y métodos del objeto
$miObjetoDesdeJson | Get-Member


<#  Type Constraint
    Los type constraints son restricciones que puedes aplicar a los parámetros de una función o script para asegurarte de que solo se acepten ciertos tipos de datos.
    Esto es útil para validar la entrada y evitar errores en tiempo de ejecución.
    El Type Constraint ayuda a prevenir errores al asegurar que solo se usen datos válidos.
#>

# Ejemplo de uso de type constraints:
[int]$edad = 25       # Solo puede contener enteros
Write-Output $edad
$edad = "texto"       # Error: no se puede convertir a [int]

[string]$nombre = "Juan" # Solo puede contener cadenas de texto
Write-Output $nombre
$nombre = 1234 # Error: no se puede convertir a [string]

[bool]$esVerdadero = $true # Solo puede contener valores booleanos
Write-Output $esVerdadero
$esVerdadero = "texto" # Error: no se puede convertir a [bool]

[array]$miArray = @(1, 2, 3) # Solo puede contener arreglos
Write-Output $miArray
$miArray = "texto" # Error: no se puede convertir a [array]

[hashtable]$miHashtable = @{"clave" = "valor" } # Solo puede contener tablas hash
Write-Output $miHashtable
$miHashtable = "texto" # Error: no se puede convertir a [hashtable]

[datetime]$miFecha = Get-Date # Solo puede contener fechas
Write-Output $miFecha
$miFecha = "texto" # Error: no se puede convertir a [datetime]


<#  Type Casting
    El Type Casting es el proceso de convertir un valor de un tipo a otro. 
    En PowerShell se hace usando [Tipo]Valor o [Tipo]$Variable.

    Dónde se usa?
	•	Al leer datos desde archivos o APIs (por ejemplo, convertir un string a fecha).
	•	Para asegurarte de que los datos están en el formato correcto antes de compararlos o procesarlos.
#>  

# Ejemplos de Type Casting
$numero = 10
$numeroString = [string]$numero # Convierte el número a cadena
Write-Host "Número como cadena: $numeroString"
$numeroDecimal = [decimal]$numero # Convierte el número a decimal
Write-Host "Número como decimal: $numeroDecimal"
$numeroEntero = [int]$numero # Convierte el número a entero
Write-Host "Número como entero: $numeroEntero"

# Ejemplo de Type Casting con una cadena
$cadena = "123.45"
$numeroDecimal = [decimal]$cadena # Convierte la cadena a decimal
Write-Host "Cadena como decimal: $numeroDecimal"
$numeroEntero = [int]$cadena # Convierte la cadena a entero
Write-Host "Cadena como entero: $numeroEntero" # Esto puede dar un error si la cadena no es un número entero

# Ejemplo de Type Casting con un objeto
$fecha = Get-Date
$fechaString = [string]$fecha # Convierte la fecha a cadena
Write-Host "Fecha como cadena: $fechaString"

$fechaTexto = "2024-12-01"
[datetime]$fecha = $fechaTexto  # Convierte el texto en un objeto DateTime
$fecha # Esto puede dar un error si la cadena no es una fecha válida