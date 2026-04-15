# Módulos en PowerShell

A medida que avanzas en PowerShell, llega un momento en que los comandos integrados ya no son suficientes para todo lo que quieres hacer. Ahí es donde entran los **módulos**.

Un módulo es un paquete que agrega nuevos comandos, funciones, recursos o capacidades a PowerShell. Gracias a los módulos, PowerShell puede conectarse y trabajar con tecnologías muy diferentes sin que todo venga instalado desde el inicio.

---

## ¿Qué es un módulo?

Un módulo en PowerShell es una colección organizada de elementos como:

- cmdlets
- funciones
- aliases
- variables
- archivos de ayuda
- recursos adicionales

En términos simples, un módulo amplía lo que PowerShell puede hacer.

Por ejemplo:

- el módulo **ActiveDirectory** agrega comandos para trabajar con Active Directory
- el módulo **Az** agrega comandos para trabajar con Azure
- el módulo **ExchangeOnlineManagement** agrega comandos para Exchange Online
- los módulos de **Microsoft Graph** permiten trabajar con Microsoft 365 y otros servicios modernos

---

## ¿Por qué son tan importantes?

Porque gran parte del valor de PowerShell viene precisamente de su ecosistema de módulos.

Sin módulos, PowerShell seguiría siendo útil para muchas tareas locales. Pero con módulos, se convierte en una plataforma capaz de administrar:

- sistemas operativos
- directorios
- plataformas de nube
- servicios empresariales
- herramientas de seguridad
- redes
- virtualización
- muchas APIs y productos externos

En otras palabras, los módulos son una de las razones por las que PowerShell puede usarse en tantos escenarios distintos.

---

## Ver qué módulos tienes disponibles

Puedes listar los módulos disponibles en tu equipo con:

```powershell
Get-Module -ListAvailable
```

Esto muestra los módulos instalados o presentes en rutas que PowerShell conoce.

Si quieres ver solo los módulos cargados en la sesión actual:

```powershell
Get-Module
```

La diferencia es importante:

- **`Get-Module -ListAvailable`**: muestra lo que está disponible en el sistema
- **`Get-Module`**: muestra lo que está cargado en ese momento

---

## Importar un módulo

Si quieres cargar un módulo manualmente en la sesión actual, puedes usar:

```powershell
Import-Module ActiveDirectory
```

O por ejemplo:

```powershell
Import-Module Az.Accounts
```

Muchas veces PowerShell importa módulos automáticamente cuando detecta que vas a usar uno de sus comandos. Aun así, conviene saber cómo hacerlo manualmente.

---

## Ver comandos dentro de un módulo

Una vez que conoces el nombre de un módulo, puedes ver qué comandos ofrece.

Ejemplo:

```powershell
Get-Command -Module ActiveDirectory
```

Otro ejemplo:

```powershell
Get-Command -Module Az.Accounts
```

Esto es muy útil para explorar y aprender.

---

## Instalar módulos

Muchos módulos modernos pueden instalarse desde la PowerShell Gallery.

Ejemplo:

```powershell
Install-Module ExchangeOnlineManagement
```

Otro ejemplo:

```powershell
Install-Module Microsoft.Graph
```

Dependiendo del sistema, la instalación puede requerir permisos adicionales.

En muchos casos también conviene especificar el alcance.

Por ejemplo, para instalar solo para el usuario actual:

```powershell
Install-Module ExchangeOnlineManagement -Scope CurrentUser
```

---

## Actualizar módulos

Con el tiempo, los módulos reciben nuevas versiones.

Puedes actualizar uno instalado con:

```powershell
Update-Module ExchangeOnlineManagement
```

O:

```powershell
Update-Module Microsoft.Graph
```

Mantener módulos actualizados ayuda a recibir:

- correcciones de errores
- mejoras de compatibilidad
- cambios de seguridad
- nuevas funciones

---

## Buscar módulos

Si no recuerdas el nombre exacto de un módulo, puedes buscarlo.

Ejemplo:

```powershell
Find-Module ExchangeOnlineManagement
```

También puedes buscar por palabra clave:

```powershell
Find-Module *Graph*
```

Esto te ayuda a descubrir módulos disponibles en la galería.

---

## Ejemplos de módulos comunes

Estos son algunos módulos muy conocidos en el ecosistema PowerShell:

### Active Directory

```powershell
Import-Module ActiveDirectory
```

Se usa para trabajar con usuarios, grupos, OUs y otros objetos de Active Directory.

### Azure

```powershell
Import-Module Az.Accounts
Import-Module Az.Resources
```

Se usa para autenticación, administración de recursos, inventarios, automatización y mucho más en Azure.

### Exchange Online

```powershell
Import-Module ExchangeOnlineManagement
```

Se usa para administrar buzones, grupos, permisos y configuraciones de Exchange Online.

### Microsoft Graph

```powershell
Import-Module Microsoft.Graph.Users
```

Se usa para trabajar con usuarios, licencias, grupos y otros recursos de Microsoft 365 mediante Microsoft Graph.

---

## Módulos grandes y módulos específicos

A veces encontrarás módulos muy grandes y otras veces módulos más pequeños y específicos.

Por ejemplo:

- `Microsoft.Graph` puede instalar muchos componentes
- `Microsoft.Graph.Users` instala una parte más específica
- `Az` incluye múltiples submódulos
- `Az.Accounts` o `Az.Resources` son más puntuales

Aprender esta diferencia es útil porque no siempre necesitas cargar o instalar todo.

---

## Dónde se instalan los módulos

PowerShell usa rutas definidas en la variable `PSModulePath` para encontrar módulos.

Puedes verla así:

```powershell
$env:PSModulePath
```

Y para verla por líneas más cómodamente:

```powershell
$env:PSModulePath -split ';'
```

En algunos equipos, una parte importante de la práctica con módulos consiste en entender dónde se instalan y qué ruta está usando PowerShell.

---

## Instalar módulos para el usuario actual o para todos

Una diferencia importante es el alcance de instalación.

### Solo para el usuario actual

```powershell
Install-Module ImportExcel -Scope CurrentUser
```

### Para todos los usuarios del equipo

```powershell
Install-Module ImportExcel -Scope AllUsers
```

Esto influye en:

- permisos necesarios
- ubicación de instalación
- quién puede usar el módulo en ese equipo

---

## Ver la versión de un módulo

Puedes revisar qué versión tienes instalada con:

```powershell
Get-Module ExchangeOnlineManagement -ListAvailable
```

O por ejemplo:

```powershell
Get-Module Microsoft.Graph.Users -ListAvailable
```

Esto es útil cuando un ejemplo o una guía depende de una versión concreta.

---

## Cuando un comando no existe

A veces ejecutarás algo y verás un error como este:

```text
The term 'Get-ADUser' is not recognized...
```

Muchas veces eso significa una de estas cosas:

- el módulo no está instalado
- el módulo no está cargado
- estás en un sistema donde ese módulo no existe
- el comando pertenece a otro producto o prerequisito

Ese tipo de error no siempre significa que escribiste mal el comando. A veces simplemente falta el módulo adecuado.

---

## Ejemplo práctico: revisar un módulo y sus comandos

Prueba esta secuencia:

```powershell
Get-Module -ListAvailable
Get-Module
Find-Module ExchangeOnlineManagement
Get-Module ExchangeOnlineManagement -ListAvailable
```

Con eso empezarás a entender:

- qué módulos tienes
- cuáles están cargados
- cuáles podrías instalar
- qué versiones están disponibles en tu entorno

---

## Ejemplo práctico con un módulo instalado

Si ya tienes un módulo instalado, puedes explorar sus comandos así:

```powershell
Get-Command -Module ExchangeOnlineManagement
```

O:

```powershell
Get-Command -Module Microsoft.Graph.Users
```

Luego puedes tomar uno de esos comandos y pedir ayuda:

```powershell
Get-Help Get-MgUser
```

Esto convierte el módulo en una fuente de aprendizaje, no solo en una dependencia técnica.

---

## Buenas prácticas al trabajar con módulos

Estas ideas ayudan bastante:

- instala solo lo que realmente necesitas
- revisa versiones cuando algo no funcione como esperas
- prefiere nombres de módulos oficiales y conocidos
- entiende si necesitas instalar para tu usuario o para todos
- documenta qué módulo requiere cada script
- prueba primero que el módulo cargue correctamente

Por eso verás a veces líneas como esta al inicio de algunos scripts:

```powershell
#requires -Modules ExchangeOnlineManagement
```

Eso ayuda a dejar claro qué necesita el script para funcionar.

---

## Errores comunes al comenzar

Estos errores son muy frecuentes:

- instalar un módulo y no saber dónde quedó
- no entender la diferencia entre instalar e importar
- usar un comando sin tener el módulo correcto
- confundir un módulo grande con uno específico
- no revisar la versión del módulo cuando un ejemplo falla

Todo esto se vuelve mucho más claro con práctica.

---

## Resumen

En esta sección viste cómo:

- entender qué es un módulo
- ver módulos disponibles y cargados
- importar módulos
- instalar y actualizar módulos
- buscar módulos en la galería
- revisar comandos de un módulo
- entender por qué los módulos son fundamentales en PowerShell

Con esta base ya puedes comprender mejor cómo PowerShell se conecta con tecnologías como Active Directory, Azure, Microsoft 365 y muchas otras.
