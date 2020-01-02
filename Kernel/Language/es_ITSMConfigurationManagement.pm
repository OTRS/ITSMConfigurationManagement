# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Language::es_ITSMConfigurationManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Gestión de Elementos de Configuración';
    $Self->{Translation}->{'Change class definition'} = 'Cambiar definición de la Clase';
    $Self->{Translation}->{'Config Item Class'} = 'Clase de elemento de configuración';
    $Self->{Translation}->{'Definition'} = 'Definición';
    $Self->{Translation}->{'Change'} = 'Modificar';

    # Template: AgentDashboardITSMConfigItemGeneric
    $Self->{Translation}->{'Incident State'} = 'Estado del Incidente';
    $Self->{Translation}->{'Deployment State'} = 'Estado de la Implementación';
    $Self->{Translation}->{'Class'} = 'Clase';
    $Self->{Translation}->{'Deployment State Type'} = 'Tipo de estado de implementación';
    $Self->{Translation}->{'Current Incident State'} = 'Estado Actual del Incidente';
    $Self->{Translation}->{'Current Incident State Type'} = 'Estado actual del Tipo de incidente';
    $Self->{Translation}->{'Last changed'} = 'Última modificación';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = 'Elemento de Configuración';
    $Self->{Translation}->{'Filter for Classes'} = 'Filtro para Clases';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'Seleccione una Clase de la lista para crear un nuevo Item de Configuración';

    # Template: AgentITSMConfigItemBulk
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = 'ITSM ConfigItem Acción Masiva';
    $Self->{Translation}->{'Deployment state'} = 'Estado de despliegue';
    $Self->{Translation}->{'Incident state'} = 'Estado del incidente';
    $Self->{Translation}->{'Link to another'} = 'Enlazar con otro';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = '¡Número de Ítem de Configuración no valido!';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = 'El número de otro elemento de configuración con el que vincular.';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = '¿Realmente desea eliminar este elemento de configuración?';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'El nombre de este elemento de configuración';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        'El nombre ya esta en uso por Ítems de Configuración con los siguientes número(s): %s';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = 'Historial del Elemento de configuración: %s';
    $Self->{Translation}->{'History Content'} = 'Contenido del historial';
    $Self->{Translation}->{'Createtime'} = 'Fecha de Creación';
    $Self->{Translation}->{'Zoom view'} = 'Vista detallada ';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Ajustes de Contexto';
    $Self->{Translation}->{'Config Items per page'} = 'CIs por página';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = 'Una tabla genérica de ítems de configuración de ITSM';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Run Search'} = 'Ejecutar la búsqueda';
    $Self->{Translation}->{'Also search in previous versions?'} = '¿Desea buscar en versiones anteriores?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'Elemento de configuración';
    $Self->{Translation}->{'Configuration Item Information'} = 'Información del elemento de configuración';
    $Self->{Translation}->{'Current Deployment State'} = 'Estado Actual de la Implementación';
    $Self->{Translation}->{'Last changed by'} = 'Última modificación por';
    $Self->{Translation}->{'Show one version'} = 'Mostrar una versión';
    $Self->{Translation}->{'Show all versions'} = 'Mostrar todas las versiones';
    $Self->{Translation}->{'Version Incident State'} = 'Estado del incidente de la versión';
    $Self->{Translation}->{'Version Deployment State'} = 'Estado de la versión de implementación';
    $Self->{Translation}->{'Version Number'} = 'Número de versión';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Elemento de configuración Detalles de la versión';
    $Self->{Translation}->{'Property'} = 'Propiedad';

    # Perl Module: Kernel/Modules/AgentITSMConfigItem.pm
    $Self->{Translation}->{'No access to Class is given!'} = '¡No se ha proporcionado acceso a Clase!';
    $Self->{Translation}->{'Overview: ITSM ConfigItem'} = 'Resumen: ITSM ConfigItem';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemBulk.pm
    $Self->{Translation}->{'No ConfigItemID is given!'} = '¡No se ha proporcionado ConfigItemID!';
    $Self->{Translation}->{'You need at least one selected Configuration Item!'} = '¡Necesita al menos un elemento de configuración seleccionado!';
    $Self->{Translation}->{'You don\'t have write access to this configuration item: %s.'} =
        'No tiene permiso de escritura para este elemento de configuración: %s';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemDelete.pm
    $Self->{Translation}->{'Config item "%s" not found in database!'} = '¡Elemento de configuración "%s"  no se encontró en la base de datos!';
    $Self->{Translation}->{'Was not able to delete the configitem ID %s!'} = '¡No fue posible eliminar el configitem ID %s!';
    $Self->{Translation}->{'No version found for ConfigItemID %s!'} = '¡No se encontró Versión para ConfigItemID %s!';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemEdit.pm
    $Self->{Translation}->{'No ConfigItemID, DuplicateID or ClassID is given!'} = '¡No se ha proporcionado ConfigItemID, DuplicateID o ClassID!';
    $Self->{Translation}->{'No access is given!'} = '¡No se ha proporcionado acceso!';
    $Self->{Translation}->{'No definition was defined for class %s!'} = '¡Ninguna definición fue definida para clase %s!';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemHistory.pm
    $Self->{Translation}->{'Can\'t show history, no ConfigItemID is given!'} = '¡No se puede mostrar el historial, no se ha proporcionado ConfigItemID!';
    $Self->{Translation}->{'Can\'t show history, no access rights given!'} = '¡No se puede mostrar el historial, no se han proporcionado permisos de acceso!';
    $Self->{Translation}->{'New ConfigItem (ID=%s)'} = 'Nuevo ConfigItem (ID=%s)';
    $Self->{Translation}->{'New version (ID=%s)'} = 'Nueva versión (ID=%s)';
    $Self->{Translation}->{'Deployment state updated (new=%s, old=%s)'} = 'Actualizado estado de despliegue (nuevo=%s, viejo=%s)';
    $Self->{Translation}->{'Incident state updated (new=%s, old=%s)'} = 'Actualizado estado de incidencia (nuevo=%s,viejo=%s)';
    $Self->{Translation}->{'ConfigItem (ID=%s) deleted'} = 'ConfigItem (ID=%s) eliminado';
    $Self->{Translation}->{'Link to %s (type=%s) added'} = 'Enlace a %s (tipo=%s) añadido';
    $Self->{Translation}->{'Link to %s (type=%s) deleted'} = 'Enlace a %s (tipo=%s) eliminado';
    $Self->{Translation}->{'ConfigItem definition updated (ID=%s)'} = 'Actualizada definición de ConfigItem (ID=%s)';
    $Self->{Translation}->{'Name updated (new=%s, old=%s)'} = 'Nombre actualizado (nuevo=%s,viejo=%s)';
    $Self->{Translation}->{'Attribute %s updated from "%s" to "%s"'} = 'Atributo %s actualizado de "%s" a "%s"';
    $Self->{Translation}->{'Version %s deleted'} = 'Versión %s eliminada';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'No ConfigItemID or VersionID is given!'} = '¡No se ha proporcionado ConfigItemID o VersionID!';
    $Self->{Translation}->{'Can\'t show config item, no access rights given!'} = '¡No se puede mostrar el elemento de configuración, no se han proporcionado permisos de acceso!';
    $Self->{Translation}->{'ConfigItemID %s not found in database!'} = '¡ConfigItemID %s no se encontró en la base de datos!';
    $Self->{Translation}->{'VersionID %s not found in database!'} = '¡VersionID %s no se encontró en la base de datos!';
    $Self->{Translation}->{'ConfigItem'} = 'ConfigItem';
    $Self->{Translation}->{'printed by %s at %s'} = 'impreso por %s en %s';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'Invalid ClassID!'} = '¡ClassID no es válida!';
    $Self->{Translation}->{'No ClassID is given!'} = '¡No se ha proporcionado ClassID!';
    $Self->{Translation}->{'No access rights for this class given!'} = '¡No se ha proporcionado permisos de acceso para esta clase!';
    $Self->{Translation}->{'No Result!'} = '¡Sin resultados!';
    $Self->{Translation}->{'Config Item Search Results'} = 'Resultados de búsqueda de elemento de configuración';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemZoom.pm
    $Self->{Translation}->{'Can\'t show item, no access rights for ConfigItem are given!'} =
        '¡No se puede mostrar el elemento, no se han proporcionado permisos de acceso para ConfigItem!';
    $Self->{Translation}->{'operational'} = '';
    $Self->{Translation}->{'warning'} = '';
    $Self->{Translation}->{'incident'} = '';
    $Self->{Translation}->{'The deployment state of this config item'} = 'El estado de implementación de este elemento de configuración';
    $Self->{Translation}->{'The incident state of this config item'} = 'El estado de este elemento de configuración';

    # Perl Module: Kernel/Output/HTML/Dashboard/ITSMConfigItemGeneric.pm
    $Self->{Translation}->{'Shown config items'} = 'Se muestran elementos de configuración';

    # Perl Module: Kernel/Output/HTML/ITSMConfigItem/LayoutDate.pm
    $Self->{Translation}->{'Between'} = 'Entre';

    # Perl Module: Kernel/System/ImportExport/ObjectBackend/ITSMConfigItem.pm
    $Self->{Translation}->{'Maximum number of one element'} = 'Número máximo de un elemento ';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'Los campos vacíos indican que los valores actuales se mantienen';
    $Self->{Translation}->{'Skipped'} = 'Saltado';

    # Perl Module: var/packagesetup/ITSMConfigurationManagement.pm
    $Self->{Translation}->{'Model'} = 'Modelo';
    $Self->{Translation}->{'Customer Company'} = '';
    $Self->{Translation}->{'Serial Number'} = 'Número Serial';
    $Self->{Translation}->{'CPU'} = 'CPU';
    $Self->{Translation}->{'Ram'} = 'RAM';
    $Self->{Translation}->{'Hard Disk'} = 'Disco Duro';
    $Self->{Translation}->{'Capacity'} = 'Capacidad';
    $Self->{Translation}->{'Network Adapter'} = 'Adaptador de Red';
    $Self->{Translation}->{'IP over DHCP'} = 'IP sobre DHCP';
    $Self->{Translation}->{'IP Address'} = 'Dirección IP';
    $Self->{Translation}->{'Graphic Adapter'} = 'Tarjeta Gráfica';
    $Self->{Translation}->{'Other Equipment'} = 'Otro Equipo';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Fecha de Expiración de la Garantía';
    $Self->{Translation}->{'Install Date'} = 'Fecha de Instalación';
    $Self->{Translation}->{'Phone 1'} = 'Teléfono 1';
    $Self->{Translation}->{'Phone 2'} = 'Teléfono 2';
    $Self->{Translation}->{'E-Mail'} = 'E-Mail';
    $Self->{Translation}->{'Network Address'} = 'Dirección de Red';
    $Self->{Translation}->{'Subnet Mask'} = 'Máscara de Subred';
    $Self->{Translation}->{'Gateway'} = 'Puerta de enlace';
    $Self->{Translation}->{'Licence Type'} = 'Tipo de Licencia';
    $Self->{Translation}->{'Licence Key'} = 'Clave de Licencia';
    $Self->{Translation}->{'Quantity'} = 'Cantidad';
    $Self->{Translation}->{'Expiration Date'} = 'Fecha de Expiración';
    $Self->{Translation}->{'Media'} = 'Medio';

    # Database XML Definition: ITSMConfigurationManagement.sopm
    $Self->{Translation}->{'Computer'} = 'Ordenador';
    $Self->{Translation}->{'Hardware'} = 'Hardware';
    $Self->{Translation}->{'Network'} = 'Red';
    $Self->{Translation}->{'Software'} = 'Software';
    $Self->{Translation}->{'Expired'} = 'Expirado';
    $Self->{Translation}->{'Maintenance'} = 'Mantenimiento';
    $Self->{Translation}->{'Pilot'} = 'Piloto';
    $Self->{Translation}->{'Planned'} = 'Planificado';
    $Self->{Translation}->{'Repair'} = 'Reparación';
    $Self->{Translation}->{'Retired'} = 'Retirado';
    $Self->{Translation}->{'Review'} = 'Revisado';
    $Self->{Translation}->{'Test/QA'} = 'Prueba / Control de calidad';
    $Self->{Translation}->{'Laptop'} = 'Ordenador portátil';
    $Self->{Translation}->{'Desktop'} = 'Escritorio';
    $Self->{Translation}->{'PDA'} = 'Agenda Personal';
    $Self->{Translation}->{'Server'} = 'Servidor';
    $Self->{Translation}->{'Other'} = 'Otro';
    $Self->{Translation}->{'Monitor'} = 'Monitor';
    $Self->{Translation}->{'Printer'} = 'Impresora';
    $Self->{Translation}->{'Switch'} = 'Switch';
    $Self->{Translation}->{'Router'} = 'Enrutador';
    $Self->{Translation}->{'WLAN Access Point'} = 'Punto de Acceso WLAN';
    $Self->{Translation}->{'Security Device'} = 'Dispositivo de Seguridad';
    $Self->{Translation}->{'Backup Device'} = 'Dispositivo de Respaldo';
    $Self->{Translation}->{'Mouse'} = 'Ratón';
    $Self->{Translation}->{'Keyboard'} = 'Teclado';
    $Self->{Translation}->{'Camera'} = 'Cámara';
    $Self->{Translation}->{'Beamer'} = 'Proyector';
    $Self->{Translation}->{'Modem'} = 'Módem';
    $Self->{Translation}->{'PCMCIA Card'} = 'Tarjeta PCMCIA';
    $Self->{Translation}->{'USB Device'} = 'Dispositivo USB';
    $Self->{Translation}->{'Docking Station'} = 'Estación de acoplamiento';
    $Self->{Translation}->{'Scanner'} = 'Escáner';
    $Self->{Translation}->{'Building'} = 'Edificio';
    $Self->{Translation}->{'Office'} = 'Oficina';
    $Self->{Translation}->{'Floor'} = 'Piso';
    $Self->{Translation}->{'Room'} = 'Habitación';
    $Self->{Translation}->{'Rack'} = 'Rack';
    $Self->{Translation}->{'Workplace'} = 'Lugar de trabajo';
    $Self->{Translation}->{'Outlet'} = 'Outlet';
    $Self->{Translation}->{'IT Facility'} = 'Instalaciones de TI';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'Telco'} = 'Conferencia telefónica';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Client Application'} = 'Aplicación Cliente';
    $Self->{Translation}->{'Middleware'} = 'Middleware';
    $Self->{Translation}->{'Server Application'} = 'Aplicación Servidor';
    $Self->{Translation}->{'Client OS'} = 'Sistema Operativo del Cliente';
    $Self->{Translation}->{'Server OS'} = 'Sistema operativo del Servidor';
    $Self->{Translation}->{'Admin Tool'} = 'Herramienta de Administración';
    $Self->{Translation}->{'User Tool'} = 'Herramienta de Usuario';
    $Self->{Translation}->{'Embedded'} = 'Embebido';
    $Self->{Translation}->{'Single Licence'} = 'Licencia Única';
    $Self->{Translation}->{'Per User'} = 'Por Usuario';
    $Self->{Translation}->{'Per Processor'} = 'Por Procesador';
    $Self->{Translation}->{'Per Server'} = 'Por Servidor';
    $Self->{Translation}->{'Per Node'} = 'Por Nodo';
    $Self->{Translation}->{'Volume Licence'} = 'Licencia por Volumen';
    $Self->{Translation}->{'Enterprise Licence'} = 'Licencia Corporativa';
    $Self->{Translation}->{'Developer Licence'} = 'Licencia de Desarrollador';
    $Self->{Translation}->{'Demo'} = 'Demostración';
    $Self->{Translation}->{'Time Restricted'} = 'Tiempo Restringido';
    $Self->{Translation}->{'Freeware'} = 'Freeware';
    $Self->{Translation}->{'Open Source'} = 'Código Abierto';
    $Self->{Translation}->{'Unlimited'} = 'Ilimitada';

    # JS File: ITSM.Agent.ConfigItem.Zoom
    $Self->{Translation}->{'Ok'} = 'Ok';

    # SysConfig
    $Self->{Translation}->{'Assigned CIs'} = 'CIs asignados';
    $Self->{Translation}->{'CIs assigned to customer company'} = 'Cis asignados a la Empresa del Cliente';
    $Self->{Translation}->{'CIs assigned to customer user'} = 'Cis asignados al usuario del cliente';
    $Self->{Translation}->{'CMDB Settings'} = 'Configuraciones CMDB';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        'Busque un nombre único solo dentro de la misma clase de ConfigItem (\'clase\') o globalmente (\'global\'), lo que significa que cada ConfigItem existente se tiene en cuenta cuando se buscan duplicados.';
    $Self->{Translation}->{'Config Items'} = 'Elementos de configuración';
    $Self->{Translation}->{'Config item add.'} = 'Añadir elemento de configuración';
    $Self->{Translation}->{'Config item edit.'} = 'Editar elemento de configuración.';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        'Módulo de evento de elementos de configuración que habilita el acceso a la historia en la interfaz del agente.';
    $Self->{Translation}->{'Config item history.'} = 'Historial del elemento de configuración.';
    $Self->{Translation}->{'Config item print.'} = 'Imprimir elemento de configuración.';
    $Self->{Translation}->{'Config item zoom.'} = 'Detallez del elemento de configuración.';
    $Self->{Translation}->{'ConfigItemNumber'} = 'ConfigItemNumber';
    $Self->{Translation}->{'Configuration Item Limit'} = 'Límite de Elementos de Configuración';
    $Self->{Translation}->{'Configuration Item limit per page.'} = 'Límite de elemento de configuración por página.';
    $Self->{Translation}->{'Configuration Management Database.'} = 'Gestión de la Configuración de Bases de Datos';
    $Self->{Translation}->{'Configuration item bulk module.'} = 'Elemento de configuración del módulo masivo';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        'Router backend de búsqueda de elementos de configuración de la interfaz del agente.';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = 'Crea y gestiona las definiciones de los elementos de configuración.';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        'Definir acciones donde está disponible un botón de configuración en el widget de objetos vinculados (LinkObject::ViewMode = "complex"). Tenga en cuenta que estas acciones deben haber registrado los siguientes archivos JS y CSS: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js y Core.Agent.LinkObject.js.';
    $Self->{Translation}->{'Defines Required permissions to create ITSM configuration items using the Generic Interface.'} =
        'Define los permisos necesarios para crear elementos de configuración de ITSM utilizando la interfaz genérica.';
    $Self->{Translation}->{'Defines Required permissions to delete ITSM configuration items using the Generic Interface.'} =
        'Define los permisos necesarios para eliminar elementos de configuración de ITSM mediante la interfaz genérica.';
    $Self->{Translation}->{'Defines Required permissions to get ITSM configuration items using the Generic Interface.'} =
        'Define los permisos necesarios para obtener elementos de configuración de ITSM utilizando la interfaz genérica.';
    $Self->{Translation}->{'Defines Required permissions to search ITSM configuration items using the Generic Interface.'} =
        'Define los permisos necesarios para buscar elementos de configuración de ITSM utilizando la interfaz genérica.';
    $Self->{Translation}->{'Defines Required permissions to update ITSM configuration items using the Generic Interface.'} =
        'Define los permisos necesarios para actualizar los elementos de configuración de ITSM mediante la interfaz genérica.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        'Define un módulo de resumen para mostrar la pequeña vista de una lista de elemento de configuración.';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        'Define expresiones regulares individualmente para cada clase ConfigItem para verificar el nombre de ConfigItem y para mostrar los mensajes de error correspondientes.';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        'Define el subobjeto por default de la clase \'ITSMConfigItem\'.';
    $Self->{Translation}->{'Defines the number of rows for the CI definition editor in the admin interface.'} =
        'Define el número de filas para el editor de definiciones de CI en la interfaz de administración.';
    $Self->{Translation}->{'Defines the order of incident states from high (e.g. cricital) to low (e.g. functional).'} =
        'Define el orden de los estados de incidencia desde alto (por ejemplo, crítico) a bajo (por ejemplo, funcional).';
    $Self->{Translation}->{'Defines the relevant deployment states where linked tickets can affect the status of a CI.'} =
        'Define los estados de implementación relevantes donde los tickets vinculados pueden afectar el estado de un CI.';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItem screen.'} =
        'Define el límite de búsqueda para la pantalla AgentITSMConfigItem.';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItemSearch screen.'} =
        'Define el límite de búsqueda para la pantalla AgentITSMConfigItemSearch.';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected.'} =
        'Define las columnas mostradas en la descripción general del elemento de configuración. Esta opción no tiene efecto en la posición de la columna. Nota: La columna de clase siempre está disponible si se selecciona el filtro \'Todos\'.';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} =
        'Define las columnas mostradas en la búsqueda de elementos de configuración. Esta opción no tiene efecto en la posición de la columna.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item overview depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'Define las columnas de los elementos de configuración que se muestran en la vista general del elemento de configuración, en función de la clase CI. Cada entrada debe ir precedida del nombre de la clase y dos puntos dobles (es decir, computadora: :). Hay algunos atributos de CI que son comunes a todos los elementos de configuración (ejemplo para la clase Computadora: Computadora :: Nombre, Computadora :: CurDeplState, Computadora :: CreateTime). Para mostrar los IC-Atributos individuales definidos en la Definición-CI, se debe utilizar el siguiente esquema (ejemplo para la clase Computadora): Computadora :: Disco Duro :: 1, Computadora :: Disco Duro :: 1 :: Capacidad :: 1, Computadora :: Disco Duro :: 2, Computadora :: Disco Duro :: 2 :: Capacidad :: 1. Si no hay ninguna entrada para una clase CI, las columnas predeterminadas se muestran como se define en la configuración ITSMConfigItem :: Frontend :: AgentITSMConfigItem ### ShowColumns.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item search depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'Define las columnas de los elementos de configuración mostrados en la búsqueda del elemento config dependiendo de la clase CI. Cada entrada debe ir precedida del nombre de la clase y dos puntos dobles (es decir, computadora: :). Hay algunos atributos de CI que son comunes a todos los elementos de configuración (ejemplo para la clase Computadora: Computadora :: Nombre, Computadora :: CurDeplState, Computadora :: CreateTime). Para mostrar los IC-Atributos individuales definidos en la Definición-CI, se debe utilizar el siguiente esquema (ejemplo para la clase Computadora): Computadora :: Disco Duro :: 1, Computadora :: Disco Duro :: 1 :: Capacidad :: 1, Computadora :: Disco Duro :: 2, Computadora :: Disco Duro :: 2 :: Capacidad :: 1. Si no hay ninguna entrada para una clase CI, las columnas predeterminadas se muestran como se define en la configuración ITSMConfigItem :: Frontend :: AgentITSMConfigItem ### ShowColumns.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item widget depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting AgentCustomerInformationCenter::Backend###0060-CIC-ITSMConfigItemCustomerCompany (key DefaultColumns).'} =
        'De las columnas de elemento de configuración mostradas en el widget según la clase de CI. Cada entrada debe ir precedida con el nombre de la clase y dos puntos dobles( es decir; Ordenador::). Hay algunos atributos de CI que son comunes a todos los CIs (ejemplo para la clase Computer: Ordenador::Nombre, Ordenador::CurDeplState, Ordenador::FechaCreación). Para mostrar los atributos de CI individuales definidos en la definición-CI, se debe utilizar el siguiente esquema (ejemplo para la clase Ordenador) Ordenador::DiscoDuro::1, Ordenador::DiscoDuro::1::Capacidad::1, Ordenador::DiscoDuro::2, Ordenador::DiscoDuro::2::Capacidad::1. Si no hay ninguna entrada para una clase CI, las columnas por defecto se muestran en la siguiente configuración AgentCustomerInformationCenter::Backend###0060-CIC-ITSMConfigItemCustomerCompany (key DefaultColumns).';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view for all CI classes. If there is no entry, then the default columns are shown.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view, depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown.'} =
        'Define las columnas de los elementos de configuración mostrados en la vista compleja de la tabla de enlaces, según la clase de CI. Cada entrada debe ir precedida del nombre de la clase y dos puntos dobles (es decir, computadora: :). Hay algunos atributos de CI que son comunes a todos los elementos de configuración (ejemplo para la clase Computadora: Computadora :: Nombre, Computadora :: CurDeplState, Computadora :: CreateTime). Para mostrar los IC-Atributos individuales definidos en la Definición-CI, se debe utilizar el siguiente esquema (ejemplo para la clase Computadora): Computadora :: Disco Duro :: 1, Computadora :: Disco Duro :: 1 :: Capacidad :: 1, Computadora :: Disco Duro :: 2, Computadora :: Disco Duro :: 2 :: Capacidad :: 1. Si no hay una entrada para una clase CI, se muestran las columnas predeterminadas.';
    $Self->{Translation}->{'Defines which type of link (named from the ticket perspective) can affect the status of a linked CI.'} =
        'Define qué tipo de enlace (nombrado desde la perspectiva del ticket) puede afectar el estado de un CI vinculado.';
    $Self->{Translation}->{'Defines which type of ticket can affect the status of a linked CI.'} =
        'Define qué tipo de ticket puede afectar el estado de un CI vinculado.';
    $Self->{Translation}->{'Delete Configuration Item'} = 'Eliminar elemento de configuración';
    $Self->{Translation}->{'Deployment State Color'} = 'Color del estado de despliegue';
    $Self->{Translation}->{'Duplicate'} = 'Duplicado';
    $Self->{Translation}->{'Enables configuration item bulk action feature for the agent frontend to work on more than one configuration item at a time.'} =
        'Permite que la característica de acción masiva del elemento de configuración para la interfaz del agente funcione en más de un elemento de configuración a la vez.';
    $Self->{Translation}->{'Enables configuration item bulk action feature only for the listed groups.'} =
        'Habilita la característica de acción masiva del elemento de configuración solo para los grupos enumerados.';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        'Habilita / deshabilita la funcionalidad para verificar ConfigItems para nombres únicos. Antes de habilitar esta opción, debe verificar en su sistema los elementos de configuración ya existentes con nombres duplicados. Puede hacer esto con el script bin/otrs.ITSMConfigItemListDuplicates.pl.';
    $Self->{Translation}->{'Event module to set configitem-status on ticket-configitem-link.'} =
        'Módulo de eventos para configurar configitem-status en ticket-configitem-link.';
    $Self->{Translation}->{'ITSM config item overview.'} = 'Descripción general del elemento de configuración de ITSM.';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = 'Módulo para verificar el grupo responsable de una clase.';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        'Módulo para verificar el grupo responsable de un elemento de configuración.';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = 'Módulo para generar estadísticas de los elementos de configuración ITSM.';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        'Registro del módulo de objeto backend para el módulo de importación/exportación.';
    $Self->{Translation}->{'Overview.'} = 'Vista general.';
    $Self->{Translation}->{'Parameters for the dashboard backend of the customer company config item overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.'} =
        'Parámetros para el backend del Panel Principal del resumen de elemento de configuración de la empresa del cliente de la interfaz del agente. "Límite" es el número de entradas mostradas por defecto. "Grupo" se usa para restringir el accedo al complemento (por ejemplo, Grupo: admin;grupo1;grupo2). "Por defecto" determina si el complemento está habilitado por defecto o si el usuaro necesita habilitarlo manualmente. "CacheTTLLocal" es el tiempo de caché en minutos para el complemento.';
    $Self->{Translation}->{'Parameters for the deployment states color in the preferences view of the agent interface.'} =
        'Los parámetros para la implementación indican el color en la vista de preferencias de la interfaz de agente.';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        'Parámetros para los estados de implementación en la vista de preferencias de la interfaz del agente.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Parámetros para los permisos de ejemplo de los atributos del catálogo general.';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        'Parámetros para las páginas (donde se muestran los elementos de configuración)';
    $Self->{Translation}->{'Permission Group'} = '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} =
        'Permisos necesarios para usar la ventana de los elementos de configuración en la interfaz del agente.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} =
        'Permisos necesarios para usar la ventana de búsqueda de elementos de configuración en la interfaz del agente.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} =
        'Permisos necesarios para usar la ventana de detalle de los elementos de configuración en la interfaz del agente.';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} =
        'Permisos necesarios para usar la ventana para agregar elementos de configuración en la interfaz del agente.';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} =
        'Permisos necesarios para usar la ventana de edición de los elementos de configuración en la interfaz del agente.';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} =
        'Permisos necesarios para usar la ventana de historial de los elementos de configuración en la interfaz del agente.';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} =
        'Permisos necesarios para usar la ventana de impresión de elementos de configuración en la interfaz del agente.';
    $Self->{Translation}->{'Required privileges to delete config items.'} = 'Privilegios necesarios para eliminar los elementos de configuración.';
    $Self->{Translation}->{'Search config items.'} = 'Buscar elementos de configuración.';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        'Selecciona el módulo generador de números de los elementos de configuración. "AutoIncrementar" incrementa el número del elemento de configuración; el SystemID, el ConfigItemClassID y el contador son usados. El formato es "SystemID.ConfigItemClassID.Counter", por ejemplo: 1205000004, 1205000005.';
    $Self->{Translation}->{'Set the incident state of a CI automatically when a Ticket is Linked to a CI.'} =
        'Establezca el estado de incidente de un CI automáticamente cuando un ticket esté vinculado a un CI.';
    $Self->{Translation}->{'Sets the deployment state in the configuration item bulk screen of the agent interface.'} =
        'Establece el estado de implementación en la pantalla masiva del elemento de configuración de la interfaz de agente.';
    $Self->{Translation}->{'Sets the incident state in the configuration item bulk screen of the agent interface.'} =
        'Establece el estado del incidente en la pantalla masiva del elemento de configuración de la interfaz de agente.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        'Muestra un link en el menú para vincular un elemento de configuración con otro objeto, en la vista detallada de dicho elemento de configuración de la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the configuration item overview of the agent interface.'} =
        'Muestra un enlace en el menú para acceder al historial de un elemento de configuración en la vista general del elemento de configuración de la interfaz de agente.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        'Muestra un link en el menú para acceder a la historia de un elemento de configuracion en su vista detallada, en la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu to delete a configuration item in its zoom view of the agent interface.'} =
        'Muestra un enlace en el menú para eliminar un elemento de configuración en su vista ampliada de la interfaz de agente.';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the configuration item overview of the agent interface.'} =
        'Muestra un enlace en el menú para duplicar un elemento de configuración en la descripción general del elemento de configuración de la interfaz de agente.';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        'Muestra un link en el menú para duplicar un elemento de configuracion en su vista detallada, en la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        'Muestra un link en el menú para editar un elemento de configuracion en su vista detallada, en la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuration item zoom view of the agent interface.'} =
        'Muestra un enlace en el menú para volver a la vista de zoom de elemento de configuración de la interfaz de agente.';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        'Muestra un link en el menú para imprimir un elemento de configuracion en su vista detallada, en la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu to zoom into a configuration item in the configuration item overview of the agent interface.'} =
        'Muestra un enlace en el menú para acercarse a un elemento de configuración en la vista general del elemento de configuración de la interfaz de agente.';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        'Muestra la historia de los elementos de configuración (ordenados inversamente) en la interfaz del agente.';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        'El identificador de un elemento de configuración, por ejemplo. ConfigItem #, MyConfigItem #. El valor por defecto es ConfigItem #.';
    $Self->{Translation}->{'class'} = 'clase';
    $Self->{Translation}->{'global'} = 'global';
    $Self->{Translation}->{'postproductive'} = 'postproductivo';
    $Self->{Translation}->{'preproductive'} = 'preproductivo';
    $Self->{Translation}->{'productive'} = 'productivo';


    push @{ $Self->{JavaScriptStrings} // [] }, (
    'No',
    'Ok',
    'Please enter at least one search value or * to find anything.',
    'Settings',
    'Submit',
    'Yes',
    );

}

1;
