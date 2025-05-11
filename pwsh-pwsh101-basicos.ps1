#region Introducción
<#  
PowerShell es un lenguaje de scripting y shell de línea de comandos desarrollado por Microsoft. 

Es una herramienta poderosa para la automatización de tareas y la administración de sistemas.
PowerShell es especialmente útil para administradores de sistemas, desarrolladores y profesionales de TI.
Permite interactuar con el sistema operativo, administrar configuraciones, automatizar tareas repetitivas y mucho más.

PowerShell permite administrar servicios Microsoft como:
1. Windows Server: Administración de roles y características, configuración de red, y gestión de usuarios y grupos.
2. Active Directory: Creación y administración de usuarios, grupos, y políticas de grupo.
3. Azure: Gestión de recursos, automatización de tareas, y despliegue de servicios.
4. Microsoft 365: Administración de usuarios, licencias, y configuraciones de servicios como Exchange Online y SharePoint Online.
5. Exchange Server: Gestión de buzones, bases de datos, y políticas de retención.
6. SharePoint: Administración de sitios, bibliotecas de documentos, y permisos.
7. SQL Server: Automatización de tareas de base de datos, copias de seguridad, y restauraciones.
8. Hyper-V: Creación y administración de máquinas virtuales y redes virtuales.
9. System Center Configuration Manager (SCCM): Despliegue de software, actualizaciones, y gestión de dispositivos.
10. Windows 10/11: Configuración de políticas de grupo, administración de actualizaciones, y gestión de dispositivos.
11. Intune: Gestión de dispositivos móviles y políticas de seguridad.
12. Teams: Administración de usuarios, configuraciones de equipos, y políticas de reuniones.
13. OneDrive: Configuración de políticas de almacenamiento y sincronización.
14. Power BI: Automatización de tareas de administración y despliegue de informes.
15. Power Apps: Gestión de aplicaciones y entornos.
16. Power Automate: Creación y administración de flujos de trabajo automatizados.
17. Dynamics 365: Administración de usuarios, roles, y configuraciones de aplicaciones.
18. Windows Defender: Configuración de políticas de seguridad y gestión de amenazas.
19. Azure DevOps: Automatización de despliegues y gestión de repositorios.
20. Remote Desktop Services: Configuración de sesiones remotas y administración de servidores de escritorio remoto.

Otros servicios que pueden ser administrados con PowerShell incluyen, pero no se limitan a:

1. AWS (Amazon Web Services): Utiliza el módulo AWS Tools for PowerShell para gestionar recursos en la nube.
2. Google Cloud Platform (GCP): Usa el módulo GoogleCloud para PowerShell para interactuar con servicios de GCP.
3. VMware: Administra entornos virtualizados con VMware PowerCLI.
4. Docker: Gestiona contenedores y servicios Docker con Docker PowerShell Module.
5. Kubernetes: Utiliza el módulo Kubernetes PowerShell para gestionar clústeres de Kubernetes.
6. Linux: Ejecuta comandos de PowerShell en sistemas Linux para administración y automatización.
7. macOS: Administra sistemas macOS utilizando PowerShell Core.
8. Cisco: Gestiona dispositivos de red Cisco con PowerShell y módulos específicos como Cisco UCS PowerTool.
9. Juniper Networks: Administra dispositivos de red Juniper con scripts de PowerShell.
10. MySQL: Interactúa con bases de datos MySQL utilizando el módulo MySQL PowerShell.
11. PostgreSQL: Gestiona bases de datos PostgreSQL con el módulo PostgreSQL PowerShell.
12. MongoDB: Administra bases de datos MongoDB utilizando el módulo MongoDB PowerShell.
13. Oracle Database: Utiliza el módulo Oracle ManagedDataAccess para interactuar con bases de datos Oracle.
14. Azure DevOps: Gestiona pipelines y repositorios de Azure DevOps con el módulo Azure DevOps PowerShell.
15. GitHub: Interactúa con repositorios de GitHub utilizando el módulo GitHub PowerShell.
16. Jenkins: Administra trabajos y configuraciones de Jenkins con scripts de PowerShell.
17. Ansible: Ejecuta playbooks de Ansible desde PowerShell para automatización de configuraciones.
18. Terraform: Gestiona infraestructura como código con Terraform y PowerShell.
19. Nagios: Monitorea sistemas y servicios con Nagios y scripts de PowerShell.
20. Zabbix: Administra y monitorea sistemas con Zabbix utilizando PowerShell.
#>
#endregion

#region Documentación
<# 
Documentar tus scripts en PowerShell es una buena práctica fundamental para que otros puedan entender, 
mantener y reutilizar el código en el futuro. Aquí te explico cómo hacerlo correctamente:#>

#1. Comentarios de una sola línea: Usa el símbolo # para agregar comentarios de una sola línea.
#2. Comentarios de varias líneas: Usa <# y #> para agregar comentarios de varias líneas.      
#3. Comentarios de documentación: Usa """ para agregar comentarios de documentación que describan
#el propósito del script, los parámetros y el uso general. Esto es especialmente útil para scripts más largos o complejos.
#4. Usa nombres descriptivos para variables y funciones: Asegúrate de que los nombres de tus variables y funciones sean claros y descriptivos.
#5. Mantén un estilo de codificación consistente: Usa un estilo de codificación coherente en todo tu script para que sea más fácil de leer y entender.
#6. Usa espacios en blanco y sangrías: Usa espacios en blanco y sangrías para mejorar la legibilidad del código.
#7. Usa funciones: Divide tu script en funciones para que sea más fácil de entender y reutilizar.   
#8. Usa ejemplos: Proporciona ejemplos de uso en los comentarios para que otros puedan entender cómo usar tu script.
#9. Usa el formato de salida adecuado: Asegúrate de que la salida de tu script sea fácil de leer y entender.
#>
<# Por qué estoy usando Write-Host?
En el mundo de PowerShell, usar Write-Host es considerado un "pecado" principalmente porque no envía la salida a la canalización 
Esto significa que los datos mostrados con Write-Host no pueden ser reutilizados o redirigidos a otros comandos, 
lo cual limita la flexibilidad y la capacidad de automatización de los scripts

Sin embargo, Write-Host puede ser muy útil para principiantes como yo, por varias razones:

1. Visualización clara: Write-Host permite mostrar mensajes en la consola de manera clara y con colores personalizados, 
lo cual puede ser útil para resaltar información importante durante la depuración 
(https://learn.microsoft.com/es-es/powershell/module/microsoft.powershell.utility/write-host?view=powershell-7.5).

2. Simplicidad: Es fácil de usar y entender, lo que lo hace ideal para aquellos que recién comienzan a aprender PowerShell y 
necesitan ver resultados inmediatos en la consola 
(https://learn.microsoft.com/es-es/powershell/module/microsoft.powershell.utility/write-host?view=powershell-7.5).

3. Interactividad: Puede ser útil para scripts interactivos donde se necesita mostrar información al usuario 
sin la necesidad de procesar o redirigir esa información más adelante 
(https://learn.microsoft.com/es-es/powershell/module/microsoft.powershell.utility/write-host?view=powershell-7.5).

Aunque Write-Host tiene sus limitaciones, puede ser una herramienta valiosa para aprender y 
entender los conceptos básicos de PowerShell antes de avanzar a técnicas más avanzadas y eficientes.

En este script, exploraremos los conceptos básicos de PowerShell, incluyendo módulos, cmdlets, variables, 
tipos de datos, arrays, hashtables y tablas.     

Aprenderemos cómo usar estos elementos para crear scripts efectivos y eficientes.
#>
#endregion

#Conceptos Básicos de PowerShell
#region Módulos
<#  Módulos
    ¿Qué es un Módulo en PowerShell?
    Un módulo en PowerShell es un paquete reutilizable de comandos, funciones, variables y otros recursos 
    que puedes importar a tu sesión para extender sus capacidades.

¿Por qué usar módulos?
    • Para aprovechar funcionalidades externas como Azure, AWS, Active Directory, etc.
    • Para organizar funciones relacionadas (como una caja de herramientas).
    • Para reutilizar código entre scripts o proyectos.
    • Para evitar la duplicación de código y facilitar la colaboración entre desarrolladores.
    • Para facilitar la administración y el mantenimiento de scripts complejos.
    • Para mejorar la legibilidad y la comprensión del código.
    • Para compartir scripts con otros usuarios o con tu equipo.
    • Para permitir la carga selectiva de funciones y recursos según sea necesario.
    • Para mantener el código limpio y modular.

¿Dónde puedo encontrar módulos de PowerShell?
    Los módulos de PowerShell se pueden encontrar en diferentes ubicaciones:
     1. Directorios locales en tu sistema (por ejemplo, $env:PSModulePath).
     2. Repositorios en línea como PowerShell Gallery (PSGallery).
     3. Repositorios privados de tu organización.
     4. En Github.com

Ejemplo: Buscar módulos en PSGallery
Busca un módulo llamado 'Az' en la PowerShell Gallery
Find-Module -Name Az -Repository PSGallery

Ejemplo: Buscar módulos relacionados con Azure en PSGallery
Find-Module -Name *Azure* -Repository PSGallery

Instalar, importar, usar y eliminar módulos
1. Instalar un módulo desde PowerShell Gallery 

En PowerShell, al instalar módulos con Install-Module, puedes controlar el "scope" (alcance) y otros parámetros importantes:

Scope de Instalación

El parámetro -Scope define quién puede usar el módulo instalado:

- CurrentUser: Instala el módulo solo para el usuario actual. No requiere permisos de administrador.
- AllUsers: Instala el módulo para todos los usuarios del sistema. Requiere permisos de administrador.

Ejemplos:

# Instalar solo para el usuario actual (no requiere admin)
Install-Module -Name Az -Scope CurrentUser

# Instalar para todos los usuarios (requiere admin)
Install-Module -Name Az -Scope AllUsers

Otros parámetros útiles:

-Force: Omite advertencias y fuerza la instalación.
-AllowClobber: Permite sobrescribir comandos existentes con el mismo nombre.
-Repository: Especifica el repositorio (por ejemplo, PSGallery).
-RequiredVersion: Instala una versión específica del módulo.

Ejemplo avanzado:

Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force -AllowClobber
Usa -Scope CurrentUser para evitar permisos de administrador.
Usa -Scope AllUsers para instalar globalmente (requiere admin).
Combina otros parámetros según tus necesidades para controlar la instalación.

#Ejemplo: Instalar un módulo desde PSGallery
Install-Module -Name Az -Repository PSGallery

#Ejemplo: Listar todos los módulos instalados localmente
Get-InstalledModule

Más información sobre PSGallery:
https://www.powershellgallery.com/
https://learn.microsoft.com/en-us/powershell/scripting/gallery/installing-psgallery?view=powershell-7.5

Importar un módulo para usar sus comandos en la sesión actual
# Ejemplo: Importar el módulo Az
    Import-Module Az

Utilizar los cmdlets del módulo importado
# Ejemplo: Listar las cuentas de almacenamiento de Azure (requiere iniciar sesión en Azure)
    Connect-AzAccount
    Get-AzStorageAccount

Ver los comandos disponibles en un módulo
    Get-Command -Module Az

Ver información detallada de un módulo
    Get-Module -Name Az -ListAvailable

Eliminar (desinstalar) un módulo instalado
    Uninstall-Module -Name Az

# Nota: Si el módulo está en uso, primero debes cerrar la sesión de PowerShell o asegurarte de que no esté cargado.
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
#endregion

#region Cmdlets
<#  Cmdlets
    Los cmdlets son comandos especializados de PowerShell diseñados para realizar tareas específicas de administración y automatización. 
    A diferencia de los comandos tradicionales de la línea de comandos, los cmdlets trabajan con objetos en lugar de texto, 
    lo que permite manipular datos de manera más eficiente y flexible. 
    Cada cmdlet sigue la convención de nomenclatura verbo-sustantivo (por ejemplo, Get-Process, Set-Item), 
    lo que facilita su comprensión y descubrimiento.

    Los cmdlets pueden usarse para administrar el sistema operativo, servicios de Microsoft, recursos en la nube y mucho más. 
    Se pueden combinar en scripts y canalizaciones para automatizar tareas complejas.

    Ejemplo de uso:
        Get-Help Get-Process      # Muestra ayuda sobre el cmdlet Get-Process
        Get-Process               # Lista los procesos en ejecución
        Set-ExecutionPolicy RemoteSigned  # Cambia la política de ejecución de scripts

    Referencias:
    1. Documentación oficial de Microsoft sobre cmdlets: 
       https://learn.microsoft.com/powershell/scripting/developer/cmdlet/cmdlet-overview
    2. Introducción a los cmdlets en PowerShell:
       https://learn.microsoft.com/powershell/scripting/learn/deep-dives/everything-about-cmdlets
    3. Uso de cmdlets y ejemplos prácticos:
       https://learn.microsoft.com/powershell/scripting/learn/ps101/01-getting-started
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
#endregion

#region Variables
<#  Variables
    
     En PowerShell, una variable es un contenedor que almacena datos que pueden ser utilizados y modificados durante la ejecución de un script.
     Las variables se definen anteponiendo el símbolo $ al nombre de la variable (por ejemplo, $miVariable).
     Puedes almacenar en ellas cualquier tipo de dato: cadenas de texto, números, booleanos, arrays, tablas hash, objetos, etc.
     Las variables son dinámicas, lo que significa que su tipo se determina automáticamente según el valor asignado,  aunque puedes forzar el tipo si lo necesitas.
    
     Ejemplo:
       $nombre = "Ana"
       $edad = 30
       $lista = @(1, 2, 3)
       $tabla = @{ clave = "valor" }
       [int]$numero = 5 # Forzando el tipo de dato


Buenas prácticas para el uso de variables en PowerShell:

1. Nombres descriptivos
Usa nombres de variables que describan claramente su propósito. 
Evita nombres genéricos como $a o $var a menos que sea en bucles muy cortos.

2. Notación camelCase
En PowerShell, es común usar 
camelCase
 para variables (ejemplo: $nombreCompleto). 
Esto mejora la legibilidad, especialmente en scripts largos.

3. Evita sobrescribir variables automáticas
No uses nombres de variables que ya existen en PowerShell, como $PSVersionTable, $Error, etc.

4. Inicialización
Siempre inicializa tus variables antes de usarlas para evitar errores inesperados.

6. Uso de variables en cadenas
Puedes insertar variables dentro de cadenas usando comillas dobles ("), pero no con comillas simples (').

# Ejemplo:
$nombre = "Ana"
Write-Host "Hola, $nombre"      # Muestra: Hola, Ana
Write-Host 'Hola, $nombre'      # Muestra: Hola, $nombre

Referencias:
    1. https://learn.microsoft.com/powershell/scripting/learn/deep-dives/everything-about-variables
    2. https://learn.microsoft.com/powershell/scripting/learn/deep-dives/everything-about-types
    3. https://learn.microsoft.com/powershell/scripting/learn/deep-dives/everything-about-hashtable

Sugerencia: Comenta tus variables si su propósito no es obvio. 
Esto ayuda a otros (y a ti mismo en el futuro) a entender el código.

#>

Clear-Host
Write-Host "Variables" -ForegroundColor Green

# Ejemplo:
# Definimos una variable
$miVariable = "Hola, PowerShell!"
Write-Host $miVariable -ForegroundColor Yellow

# Puedes usar variables para almacenar datos y luego usarlas en tus scripts.
# Ejemplo de uso de variables
$nombre = "Juan"
$edad = 30
$mensaje = "Hola, mi nombre es $nombre y tengo $edad años."

# Puedes mostrar el mensaje en la consola
Write-Host $mensaje -ForegroundColor Yellow
#endregion

#region Tipos de Datos
<#
Tipos de Datos en PowerShell
Los tipos de datos son fundamentales en cualquier lenguaje de programación, y PowerShell no es la excepción.
En PowerShell, los tipos de datos determinan cómo se almacenan y manipulan los valores en tus scripts. 
Entenderlos es clave para escribir código robusto y evitar errores.

Tipos de datos comunes en PowerShell

Cadenas de texto (String)
: Representan texto. Ejemplo: "Hola Mundo"
 
Números (Int, Double)
: Para cálculos. Ejemplo: 42, 3.14
 
Booleanos (Bool)
: Solo pueden ser $true o $false. Útiles en condiciones.
 
Arreglos (Array)
: Colecciones ordenadas de elementos. Ejemplo: @(1, 2, 3)
 
Tablas hash (Hashtable)
: Pares clave-valor. Ejemplo: @{Nombre="Ana"; Edad=30}
 
Objetos personalizados
: Permiten estructurar datos complejos. Ejemplo: [PSCustomObject]@{Propiedad="Valor"}

Importancia

- Permiten validar y manipular datos correctamente.
- Mejoran la legibilidad y mantenibilidad del código.
- Ayudan a prevenir errores de tipo y lógica.

Referencias

1. [Microsoft Docs: About Data Types](https://learn.microsoft.com/powershell/scripting/learn/deep-dives/everything-about-objects?view=powershell-7.3)
2. [Microsoft Docs: About Arrays](https://learn.microsoft.com/powershell/scripting/learn/deep-dives/everything-about-arrays?view=powershell-7.3)
3. [Microsoft Docs: About Hash Tables](https://learn.microsoft.com/powershell/scripting/learn/deep-dives/everything-about-hashtables?view=powershell-7.3)

#>

# 1. Cadenas de texto (string)
Write-Host "Cadenas de texto" -ForegroundColor Green
$miCadena = "Hola, PowerShell!"
Write-Host $miCadena -ForegroundColor Yellow

# 2. Números (int, float, decimal)
Write-Host "Números" -ForegroundColor Green
$miNumeroEntero = 42
$miNumeroDecimal = 3.14
$miNumeroFlotante = 2.71828
Write-Host "Número entero: $miNumeroEntero" -ForegroundColor Yellow
Write-Host "Número decimal: $miNumeroDecimal" -ForegroundColor Yellow
Write-Host "Número flotante: $miNumeroFlotante"-ForegroundColor Yellow

# 3. Booleanos (bool)
Write-Host "Booleanos" -ForegroundColor Green
$miBooleanoVerdadero = $true
$miBooleanoFalso = $false
Write-Host "Booleano verdadero: $miBooleanoVerdadero" -ForegroundColor Yellow
Write-Host "Booleano falso: $miBooleanoFalso"   -ForegroundColor Yellow

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
#endregion


#region Arrays
<#  Arrays 
    Un array es una colección ordenada de elementos indexados numéricamente. 
    Los elementos se acceden por su posición (empezando en 0)
#>

# Ejemplo de uso de un array
Write-Host "Arrays" -ForegroundColor Green
$miLista = @("Elemento1", "Elemento2", "Elemento3")
Write-Host "Lista: $miLista" -ForegroundColor Yellow
# Puedes recorrer la lista y mostrar cada elemento
foreach ($elemento in $miLista) {
    Write-Host $elemento -ForegroundColor Cyan
}
#TODO: Expandir el ejemplo de uso de un array
#endregion

#region HashTable
<#  Hashtable
    Un hashtable es una colección desordenada de pares clave-valor. 
    Se accede a los elementos por nombre de clave, no por posición.
    Un hashtable es una colección clave-valor, como un diccionario. Cada clave apunta a un solo valor.
    https://learn.microsoft.com/powershell/scripting/learn/deep-dives/everything-about-hashtable
#>
Clear-Host
Write-Host "Hashtable" -ForegroundColor Green
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
Write-Host "Agregando nuevo par clave-valor a la tabla hash..." -ForegroundColor Green
$miHashtable["País"] = "Panamá"
Write-Host "País: $($miHashtable["País"])" -ForegroundColor Yellow

# Puedes modificar un valor existente
Write-Host "Modificando el valor de la clave 'Edad'..." -ForegroundColor Green
$miHashtable["Edad"] = 31
Write-Host "Edad modificada: $($miHashtable["Edad"])" -ForegroundColor Yellow

# Puedes eliminar un par clave-valor de la tabla hash
Write-Host "Eliminando el par clave-valor 'Nombre'..." -ForegroundColor Green
$miHashtable.Remove("Nombre")
Write-Host "Nombre eliminado: $($miHashtable["Nombre"])" -ForegroundColor Yellow

# Puedes verificar si una clave existe en la tabla hash
# "¿La clave 'Ciudad' existe?" -ForegroundColor Green
# Verifica si la clave "Ciudad" existe en la tabla hash
# Si la clave existe, muestra un mensaje
# Si la clave no existe, muestra otro mensaje
Write-Host "¿La clave 'Nombre' existe? $($miHashtable.ContainsKey("Nombre"))"ç
if ($miHashtable.ContainsKey("Ciudad")) {
    Write-Host "La clave 'Ciudad' existe en la tabla hash."
}
else {
    Write-Host "La clave 'Ciudad' no existe en la tabla hash."
}

# Puedes recorrer la tabla hash y mostrar cada clave y valor
Write-Host "Recorriendo la tabla hash..." -ForegroundColor Green
foreach ($clave in $miHashtable.Keys) {
    Write-Host "$clave $($miHashtable[$clave])" -ForegroundColor Cyan
}

# Puedes usar el método GetEnumerator() para recorrer la tabla hash
Write-Host "Recorriendo la tabla hash con GetEnumerator()..." -ForegroundColor Green
foreach ($par in $miHashtable.GetEnumerator()) {
    Write-Host "$($par.Key): $($par.Value)" -ForegroundColor Yellow
}
#region

#region Tablas
<#  Tablas
    Una tabla es una colección ordenada de elementos indexados por un número entero.
    Puedes acceder a los elementos por su posición (empezando en 0).
    Cuando la gente habla de “tabla” en PowerShell, normalmente se refiere a:Un array de hashtables
    Una colección de filas, donde cada fila es una hashtable:
    Una tabla es una colección de filas y columnas, similar a una hoja de cálculo.
    Puedes usar una tabla para almacenar datos estructurados.
#> 
Clear-Host
Write-Host "Tablas" -ForegroundColor Green

# Ejemplo  de uso de una tabla
$miTabla = @(
    @{ Nombre = "Juan"; Edad = 30 },
    @{ Nombre = "María"; Edad = 25 },
    @{ Nombre = "Pedro"; Edad = 35 }
)

# Puedes recorrer la tabla y mostrar cada fila
foreach ($fila in $miTabla) {
    Write-Host "Nombre: $($fila.Nombre), Edad: $($fila.Edad)" -ForegroundColor Yellow
}

# Puedes acceder a los valores de la tabla usando el índice de la fila y el nombre de la columna
Write-Host
Write-Host "Nombre: $($miTabla[0].Nombre), Edad: $($miTabla[0].Edad)" -ForegroundColor Yellow
Write-Host "Nombre: $($miTabla[1].Nombre), Edad: $($miTabla[1].Edad)" -ForegroundColor Yellow
Write-Host "Nombre: $($miTabla[2].Nombre), Edad: $($miTabla[2].Edad)" -ForegroundColor Yellow

# Puedes agregar nuevas filas a la tabla
Write-Host "Agregando nueva fila a la tabla..." -ForegroundColor Green
$miTabla += @{ Nombre = "Ana"; Edad = 28 }
foreach ($fila in $miTabla) {
    Write-Host "Nombre: $($fila.Nombre), Edad: $($fila.Edad)" -ForegroundColor Yellow
}

# Puedes modificar un valor existente
Write-Host "Modificando el valor de la fila 0..." -ForegroundColor Green
$miTabla[0].Edad = 31
foreach ($fila in $miTabla) {
    Write-Host "Nombre: $($fila.Nombre), Edad: $($fila.Edad)" -ForegroundColor Yellow
}

# Puedes eliminar una fila de la tabla
Write-Host "Eliminando la fila con el nombre 'Pedro'..." -ForegroundColor Green
$miTabla = $miTabla | Where-Object { $_.Nombre -ne "Pedro" }
foreach ($fila in $miTabla) {
    Write-Host "Nombre: $($fila.Nombre), Edad: $($fila.Edad)" -ForegroundColor Yellow
}

# Puedes verificar si una fila existe en la tabla
# Verifica si la fila con el nombre "Juan" existe en la tabla
Write-Host "¿La fila con el nombre 'Juan' existe?" -ForegroundColor Green
$existeFila = $miTabla | Where-Object { $_.Nombre -eq "Juan" }
if ($existeFila) {
    Write-Host "La fila con el nombre 'Juan' existe en la tabla."
}
else {
    Write-Host "La fila con el nombre 'Juan' no existe en la tabla."
}

# Puedes usar el método Select-Object para seleccionar columnas específicas de la tabla
$miTabla | Select-Object Nombre, Edad
#endregion

#region PSCustomObjects
<#  PSCutomObjects
    Un PSCustomObject es un objeto personalizado que puedes crear en PowerShell.
    Puedes usar PSCustomObject para crear objetos con propiedades personalizadas.
    Muy útil para almacenar datos estructurados y para crear objetos que se pueden usar en scripts y funciones.
    Mi objeto favorito para almacenar datos estructurados y utilizarlos en las salidas de mis scripts.

    https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-pscustomobject?view=powershell-7.5
    https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_pscustomobject?view=powershell-7.5

#>
Clear-Host
Write-Host "PSCustomObject" -ForegroundColor Green

# Ejemplo de uso de PSCustomObject
$miObjeto = [PSCustomObject]@{
    Nombre = "Juan"
    Edad   = 30
    Ciudad = "Panamá"
}
# Puedes acceder a las propiedades del objeto usando el operador punto
Write-Host "Accediendo a las propiedades del objeto..." -ForegroundColor Green
Write-Host "Nombre: $($miObjeto.Nombre)" -ForegroundColor Yellow
Write-Host "Edad: $($miObjeto.Edad)" -ForegroundColor Yellow
Write-Host "Ciudad: $($miObjeto.Ciudad)" -ForegroundColor Yellow

# Puedes agregar nuevas propiedades al objeto
Write-Host "Agregando nueva propiedad al objeto..." -ForegroundColor Green
$miObjeto | Add-Member -MemberType NoteProperty -Name Pais -Value "Panamá"
Write-Host "Pais: $($miObjeto.Pais)" -ForegroundColor Yellow

# Puedes modificar una propiedad existente
Write-Host "Modificando la propiedad 'Edad'..." -ForegroundColor Green
$miObjeto.Edad = 31
Write-Host "Edad modificada: $($miObjeto.Edad)" -ForegroundColor Yellow

# Puedes eliminar una propiedad del objeto
Write-Host "Eliminando la propiedad 'Ciudad'..." -ForegroundColor Green
$miObjeto.PSObject.Properties.Remove("Ciudad")
Write-Host "Ciudad: $($miObjeto.Ciudad)" -ForegroundColor Yellow

# Puedes recorrer las propiedades del objeto y mostrar cada nombre y valor
Write-Host "Recorriendo las propiedades del objeto..." -ForegroundColor Green
foreach ($propiedad in $miObjeto.PSObject.Properties) {
    Write-Host "$($propiedad.Name): $($propiedad.Value)" -ForegroundColor Cyan
}

# Puedes usar el método GetEnumerator() para recorrer las propiedades del objeto
Write-Host "Recorriendo las propiedades del objeto con GetEnumerator()..." -ForegroundColor Green
foreach ($par in $miObjeto.PSObject.Properties.GetEnumerator()) {
    Write-Host "$($par.Name): $($par.Value)" -ForegroundColor Yellow
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
Write-Host "Objeto convertido desde JSON: " -ForegroundColor Yellow
$miObjetoDesdeJson | format-table -AutoSize

# Puedes acceder a las propiedades del objeto convertido desde JSON
Write-Host "Nombre: $($miObjetoDesdeJson.Nombre)"
Write-Host "Edad: $($miObjetoDesdeJson.Edad)"

# Puedes usar el método Get-Member para obtener información sobre las propiedades y métodos del objeto
$miObjeto | Get-Member

# Puedes usar el método Get-Member para obtener información sobre las propiedades y métodos del objeto
$miObjetoDesdeJson | Get-Member
#endregion


#region Operadores
# En PowerShell, los operadores son símbolos que se utilizan para realizar operaciones en variables y valores.
# Estos son algunos de los operadores más comunes que puedes usar en PowerShell:

# 1. Operadores aritméticos

Clear-Host
Write-Host "Operadores aritméticos" -ForegroundColor Green
# Los operadores aritméticos se utilizan para realizar operaciones matemáticas básicas.
# Estos son los operadores aritméticos más comunes en PowerShell:
# Suma (+): suma dos números
# Resta (-): resta el segundo número al primero
# Multiplicación (*): multiplica dos números
# División (/): divide el primer número por el segundo
# Módulo (%): residuo de la división entre dos números
# Exponente (^): eleva el primer número a la potencia del segundo
# Ejemplo de uso de operadores aritméticos
# Definimos dos números
$numero1 = 10
$numero2 = 5
Write-Host "Número 1: $numero1" -ForegroundColor Yellow
Write-Host "Número 2: $numero2" -ForegroundColor Yellow

# Realizamos operaciones aritméticas
# Suma, resta, multiplicación, división, módulo y exponente

$suma = $numero1 + $numero2           # Suma (+): suma dos números
$resta = $numero1 - $numero2          # Resta (-): resta el segundo número al primero
$multiplicacion = $numero1 * $numero2 # Multiplicación (*): multiplica dos números
$division = $numero1 / $numero2       # División (/): divide el primer número por el segundo
$modulo = $numero1 % $numero2         # Módulo (%): residuo de la división entre dos números
$exponente = [math]::Pow($numero1, $numero2) # Exponente: eleva el primer número a la potencia del segundo

Write-Host "Suma: $suma"
Write-Host "Resta: $resta"
Write-Host "Multiplicación: $multiplicacion"
Write-Host "División: $division"
Write-Host "Módulo: $modulo"
Write-Host "Exponente: $exponente"

# 2. Operadores de comparación
Clear-Host
Write-Host "Operadores de comparación" -ForegroundColor Green
# Los operadores de comparación en PowerShell permiten comparar valores y devuelven un resultado booleano ($true o $false).
# Aquí tienes una breve explicación de los operadores utilizados:
# -eq  : Igual a (Equal)           -> Devuelve $true si ambos valores son iguales.
# -ne  : No igual a (Not Equal)    -> Devuelve $true si los valores son diferentes.
# -gt  : Mayor que (Greater Than)  -> Devuelve $true si el primer valor es mayor que el segundo.
# -lt  : Menor que (Less Than)     -> Devuelve $true si el primer valor es menor que el segundo.
# -ge  : Mayor o igual (Greater or Equal) -> Devuelve $true si el primer valor es mayor o igual al segundo.
# -le  : Menor o igual (Less or Equal)    -> Devuelve $true si el primer valor es menor o igual al segundo.
$numero1 = 10
$numero2 = 5
Write-Host "Número 1: $numero1" -ForegroundColor Yellow
Write-Host "Número 2: $numero2" -ForegroundColor Yellow
# Realizamos comparaciones
# Igual, diferente, mayor, menor, mayor o igual, menor o igual
# Comparaciones
$esIgual = $numero1 -eq $numero2
$esDiferente = $numero1 -ne $numero2
$esMayor = $numero1 -gt $numero2
$esMenor = $numero1 -lt $numero2
$esMayorOIgual = $numero1 -ge $numero2
$esMenorOIgual = $numero1 -le $numero2
Write-Host "Es igual: $esIgual"
Write-Host "Es diferente: $esDiferente"
Write-Host "Es mayor: $esMayor"
Write-Host "Es menor: $esMenor"
Write-Host "Es mayor o igual: $esMayorOIgual"
Write-Host "Es menor o igual: $esMenorOIgual"

# 3. Operadores lógicos
Clear-Host
Write-Host "Operadores lógicos" -ForegroundColor Green
# Operador lógico -or en PowerShell
# El operador -or se utiliza para realizar una operación lógica OR (o disyunción lógica) entre dos valores booleanos. 
# Devuelve True si al menos uno de los operandos es verdadero.

<# Tabla de verdad del OR:
| Operando 1    | Operando 2    | Resultado |
| ------------  | ------------  | --------- |
| True          | True          | True      |
| True          | False         | True      |
| False         | True          | True      |
| False         | False         | False     |
#>

# Ejemplo en el código
# Supón que $verdadero = $true y $falso = $false
$verdadero = $true
$falso = $false
# Si quieres comprobar si al menos uno de ellos es verdadero, puedes usar el operador -or:
# En este caso, $verdadero es True y $falso es False.
$o = $verdadero -or $falso
Write-Host "'$verdadero' -or '$falso' = $o" -ForegroundColor Cyan

# Operador lógico NOT (-not)
$no = -not $verdadero
Write-Host "-not $verdadero = $no" -ForegroundColor Magenta

# Ejemplo adicional: combinación de operadores
$resultado = ($verdadero -or $falso) -and (-not $falso)
Write-Host "($verdadero -or $falso) -and (-not $falso) = $resultado" -ForegroundColor Green

# 4. Operadores de asignación
Clear-Host
Write-Host "Operadores de asignación" -ForegroundColor Yellow
# Los operadores de asignación se utilizan para asignar valores a variables.
# Estos son los operadores de asignación más comunes en PowerShell:
# Asignación simple (=): asigna un valor a una variable
# Asignación de suma (+=): suma un valor a una variable y asigna el resultado a la misma variable
# Asignación de resta (-=): resta un valor a una variable y asigna el resultado a la misma variable
# Asignación de multiplicación (*=): multiplica una variable por un valor y asigna el resultado a la misma variable
# Asignación de división (/=): divide una variable por un valor y asigna el resultado a la misma variable       
$numero = 10
Write-Host "Número inicial: $numero" -ForegroundColor Green
$numero += 5 # Suma y asigna
Write-Host "Después de += 5: $numero" -ForegroundColor Cyan
$numero -= 5 # Resta y asigna
Write-Host "Después de -= 5: $numero" -ForegroundColor Cyan
$numero *= 5 # Multiplica y asigna
Write-Host "Después de *= 5: $numero" -ForegroundColor Cyan
$numero /= 5 # Divide y asigna
Write-Host "Después de /= 5: $numero" -ForegroundColor Cyan
$numero = [math]::Pow($numero, 5) # Exponente y asigna
Write-Host "Después de exponente (^= 5 simulado): $numero" -ForegroundColor Cyan

# 5. Operadores de cadena
Clear-Host
Write-Host "Operadores de cadena" -ForegroundColor Yellow
# Los operadores de cadena se utilizan para manipular cadenas de texto.
# Concatenación (+): une dos cadenas
# Repetición (*): repite una cadena un número específico de veces
# Ejemplo de uso de operadores de cadena
$cadena1 = "Hola"
$cadena2 = "Mundo"
Write-Host "Cadena 1: $cadena1" -ForegroundColor Yellow
Write-Host "Cadena 2: $cadena2" -ForegroundColor Yellow
# Concatenación
$cadenaConcatenada = $cadena1 + " " + $cadena2
# Repetición
$cadenaRepetida = $cadena1 * 3 # Repite la cadena 3 veces
Write-Host "Cadena concatenada: $cadenaConcatenada" -ForegroundColor Green
Write-Host "Cadena repetida: $cadenaRepetida" -ForegroundColor Green
# Puedes usar el operador -replace para reemplazar partes de una cadena
$cadenaReemplazada = $cadenaConcatenada -replace "Mundo", "PowerShell"
Write-Host "Cadena reemplazada: $cadenaReemplazada" -ForegroundColor Green
# Puedes usar el operador -split para dividir una cadena en un array
$miCadena = "Hola, PowerShell, Mundo"
$miArray = $miCadena -split ", " # Divide la cadena en un array usando la coma como separador
Write-Host "Cadena original: $miCadena" -ForegroundColor Yellow
Write-Host "Array resultante: $miArray" -ForegroundColor Green
# Puedes usar el operador -join para unir un array en una cadena
$miCadenaUnida = $miArray -join ", " # Une el array en una cadena usando la coma como separador
Write-Host "Array unido: $miCadenaUnida" -ForegroundColor Green
# Puedes usar el operador -like para verificar si una cadena coincide con un patrón
$miCadena = "Hola, PowerShell"
$patron = "Hola*"
$coincide = $miCadena -like $patron # Verifica si la cadena coincide con el patrón
Write-Host "Cadena: $miCadena" -ForegroundColor Yellow
Write-Host "Patrón: $patron" -ForegroundColor Yellow
Write-Host "¿Coincide con el patrón? $coincide" -ForegroundColor Green
# Puedes usar el operador -match para verificar si una cadena coincide con una expresión regular
$miCadena = "Hola, PowerShell"
$expresionRegular = "Hola.*"
$coincide = $miCadena -match $expresionRegular # Verifica si la cadena coincide con la expresión regular
Write-Host "Cadena: $miCadena" -ForegroundColor Yellow
Write-Host "Expresión regular: $expresionRegular" -ForegroundColor Yellow
Write-Host "¿Coincide con la expresión regular? $coincide" -ForegroundColor Green
# Puedes usar el operador -contains para verificar si un array contiene un elemento
$miArray = @("Elemento1", "Elemento2", "Elemento3")
$elemento = "Elemento2"
$contieneElemento = $miArray -contains $elemento # Verifica si el array contiene el elemento
Write-Host "Array: $miArray" -ForegroundColor Yellow
Write-Host "Elemento: $elemento" -ForegroundColor Yellow
Write-Host "¿Contiene el elemento? $contieneElemento" -ForegroundColor Green
# Puedes usar el operador -notcontains para verificar si un array no contiene un elemento
$miArray = @("Elemento1", "Elemento2", "Elemento3")
$elemento = "Elemento4"
$noContieneElemento = $miArray -notcontains $elemento # Verifica si el array no contiene el elemento
Write-Host "Array: $miArray" -ForegroundColor Yellow
Write-Host "Elemento: $elemento" -ForegroundColor Yellow
Write-Host "¿No contiene el elemento? $noContieneElemento" -ForegroundColor Green

# 6. Operadores de tipo
Clear-Host
Write-Host "Operadores de tipo" -ForegroundColor Yellow
# Los operadores de tipo se utilizan para convertir un valor de un tipo a otro.
# Puedes usar el operador [Tipo] para convertir un valor a un tipo específico.
# Ejemplo de uso de operadores de tipo  
$numero = 10
$numeroString = [string]$numero # Convierte el número a cadena
$numeroDecimal = [decimal]$numero # Convierte el número a decimal
$numeroEntero = [int]$numero # Convierte el número a entero
Write-Host "Número como cadena: $numeroString"
Write-Host "Número como decimal: $numeroDecimal"
Write-Host "Número como entero: $numeroEntero"

# 7. Operadores de membresía
$miArray = @(1, 2, 3, 4, 5)
$existeElemento = 3 -in $miArray # Verifica si el elemento existe en el array
$noExisteElemento = 6 -notin $miArray # Verifica si el elemento no existe en el array
Write-Host "¿El elemento 3 existe en el array? $existeElemento"
Write-Host "¿El elemento 6 no existe en el array? $noExisteElemento"

# 8. Operadores de rango
$miRango = 1..10 # Crea un rango de números del 1 al 10
Write-Host "Rango: $miRango"

# 9. Operadores de comparación de cadenas
$cadena1 = "Hola"
$cadena2 = "Mundo"
$sonIguales = $cadena1 -eq $cadena2 # Verifica si las cadenas son iguales
$sonDiferentes = $cadena1 -ne $cadena2 # Verifica si las cadenas son diferentes
Write-Host "¿Las cadenas son iguales? $sonIguales"  
Write-Host "¿Las cadenas son diferentes? $sonDiferentes"

# 10. Operadores de comparación de objetos
$miObjeto1 = [PSCustomObject]@{ Nombre = "Juan"; Edad = 30 }
$miObjeto2 = [PSCustomObject]@{ Nombre = "Juan"; Edad = 30 }
$sonObjetosIguales = $miObjeto1 -eq $miObjeto2 # Verifica si los objetos son iguales
$sonObjetosDiferentes = $miObjeto1 -ne $miObjeto2 # Verifica si los objetos son diferentes
Write-Host "¿Los objetos son iguales? $sonObjetosIguales"
Write-Host "¿Los objetos son diferentes? $sonObjetosDiferentes"

# 11. Operadores de comparación de fechas
$fecha1 = Get-Date "2024-01-01"
$fecha2 = Get-Date "2024-12-31"
$esFecha1Mayor = $fecha1 -gt $fecha2 # Verifica si la fecha1 es mayor que la fecha2
$esFecha1Menor = $fecha1 -lt $fecha2 # Verifica si la fecha1 es menor que la fecha2
$esFecha1Igual = $fecha1 -eq $fecha2 # Verifica si la fecha1 es igual a la fecha2
Write-Host "¿La fecha1 es mayor que la fecha2? $esFecha1Mayor"
Write-Host "¿La fecha1 es menor que la fecha2? $esFecha1Menor"
Write-Host "¿La fecha1 es igual a la fecha2? $esFecha1Igual"

# 12. Operadores de comparación de tipos
$esTipoEntero = $numero -is [int] # Verifica si el número es de tipo entero
$esTipoDecimal = $numero -is [decimal] # Verifica si el número es de tipo decimal
$esTipoCadena = $numero -is [string] # Verifica si el número es de tipo cadena
Write-Host "¿El número es de tipo entero? $esTipoEntero"
Write-Host "¿El número es de tipo decimal? $esTipoDecimal"
Write-Host "¿El número es de tipo cadena? $esTipoCadena"

# 13. Operadores de comparación de tipos (con el operador -isnot)
$esTipoEntero = $numero -isnot [int] # Verifica si el número no es de tipo entero
$esTipoDecimal = $numero -isnot [decimal] # Verifica si el número no es de tipo decimal
$esTipoCadena = $numero -isnot [string] # Verifica si el número no es de tipo cadena
Write-Host "¿El número no es de tipo entero? $esTipoEntero"
Write-Host "¿El número no es de tipo decimal? $esTipoDecimal"
Write-Host "¿El número no es de tipo cadena? $esTipoCadena"

# 14. Operadores de comparación de tipos (con el operador -is)
$esTipoEntero = $numero -is [int] # Verifica si el número es de tipo entero
$esTipoDecimal = $numero -is [decimal] # Verifica si el número es de tipo decimal
$esTipoCadena = $numero -is [string] # Verifica si el número es de tipo cadena
Write-Host "¿El número es de tipo entero? $esTipoEntero"
Write-Host "¿El número es de tipo decimal? $esTipoDecimal"
Write-Host "¿El número es de tipo cadena? $esTipoCadena"

