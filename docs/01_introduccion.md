# Powershell 101

Este repositorio ha sido creado para documentar los conocimientos que voy adquiriendo en Powershell.

La primera cosa que es necesario hacer es instalar Powershell.

Aunque viene ya incluido en los sistemas operativos Windows como Windows Powershell, con el tiempo he aprendido que es mucho mejor utiliar la version Powershell Core.

## ¿Por qué es mejor usar PowerShell Core?

- **Multiplataforma:** Puedes usar el mismo script en Windows, macOS y Linux sin modificarlo mucho, lo que facilita estandarizar tareas en ambientes mixtos.

- **Actualizaciones activas:** PowerShell Core recibe mejoras de seguridad, rendimiento y nuevas funciones constantemente, manteniéndose alineado con las necesidades actuales de automatización.

- **Código abierto:** Puedes ver el código fuente, contribuir o reportar errores directamente en GitHub, lo que da mayor transparencia y una evolución más rápida de la herramienta.

- **Compatibilidad con el futuro:** Microsoft está enfocando sus esfuerzos en PowerShell Core, no en Windows PowerShell, por lo que es la mejor opción para nuevos desarrollos y proyectos.

- **Mejor rendimiento:** PowerShell Core es más rápido y eficiente, especialmente en tareas de automatización y scripting, lo que ayuda a reducir tiempos de ejecución y consumo de recursos.

- **Soporte para nuevas tecnologías:** Como contenedores, servicios en la nube, automatización multiplataforma, APIs modernas y herramientas actuales de DevOps, permitiendo integrarse mejor con entornos modernos.

## Diferencias entre PowerShell Core y Windows PowerShell

### Windows PowerShell (5.1)

- **Plataforma**: Solo Windows
- **Motor de ejecución**: NET Framework
- **Código abierto**: No
- **Actualizaciones**: Sin soporte activo
- **Compatibilidad**: Alta (módulos antiguos)

### PowerShell Core (7.x)

- **Plataforma**: Multiplataforma (Windows, macOS, Linux)
- **Motor de ejecución**: .NET Core / .NET 6+
- **Código abierto**: Sí (open source en GitHub)
- **Actualizaciones**: Actualizaciones frecuentes
- **Compatibilidad**: Alta con compatibilidad retroactiva

## Referencias

<https://learn.microsoft.com/en-us/training/modules/introduction-to-powershell/?source=learn>
<https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/01-getting-started?view=powershell-7.5>
<https://learn.microsoft.com/en-us/training/paths/get-started-windows-powershell/>

## Repositorio Oficial

<https://github.com/PowerShell/PowerShell>

Mi recomendación personal:

No importa si estás utilizando Windows o macOS, yo utilizo VSCode para programar con Powershell.

Después de mucho tiempo usando Powershell ISE en Windows y otros IDE, con VSCode se me ha facilitado la vida
