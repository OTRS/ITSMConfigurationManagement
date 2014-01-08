# --
# Kernel/Language/es_ITSMConfigItem.pm - translation file
# Copyright (C) 2001-2014 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::es_ITSMConfigItem;

use strict;
use warnings;

sub Data {
    my $Self = shift;

    # Template: AAAITSMConfigItem
    $Self->{Translation}->{'Address'} = 'Dirección';
    $Self->{Translation}->{'Admin Tool'} = 'Herramienta de Administración';
    $Self->{Translation}->{'Backup Device'} = 'Dispositivo de Respaldo';
    $Self->{Translation}->{'Beamer'} = 'Proyector';
    $Self->{Translation}->{'Building'} = 'Edificio';
    $Self->{Translation}->{'CIHistory::ConfigItemCreate'} = 'ConfigItem nuevo (ID=%s)';
    $Self->{Translation}->{'CIHistory::ConfigItemDelete'} = 'ConfigItem eliminado (ID=%s)';
    $Self->{Translation}->{'CIHistory::DefinitionUpdate'} = 'Definición del ConfigItem modificado (ID=%s)';
    $Self->{Translation}->{'CIHistory::DeploymentStateUpdate'} = 'Implementación del estado modificado (nuevo=%s; alt=%s)';
    $Self->{Translation}->{'CIHistory::IncidentStateUpdate'} = 'Modificación del estado del incidente (nuevo=%s; alt=%s)';
    $Self->{Translation}->{'CIHistory::LinkAdd'} = 'Vínculo con %s nuevo (Tipo=%s)';
    $Self->{Translation}->{'CIHistory::LinkDelete'} = 'Vínculo con %s eliminado (Tipo=%s)';
    $Self->{Translation}->{'CIHistory::NameUpdate'} = 'Nombre actualizado (nuevo=%s; alt=%s)';
    $Self->{Translation}->{'CIHistory::ValueUpdate'} = 'Atributo %s actualizado desde "%s" hasta "%s"';
    $Self->{Translation}->{'CIHistory::VersionCreate'} = 'Versión nueva (ID=%s)';
    $Self->{Translation}->{'CIHistory::VersionDelete'} = 'Versión %s eliminada';
    $Self->{Translation}->{'CIHistory::AttachmentAdd'} = '';
    $Self->{Translation}->{'CIHistory::AttachmentDelete'} = '';
    $Self->{Translation}->{'CPU'} = 'CPU';
    $Self->{Translation}->{'Camera'} = 'Cámara';
    $Self->{Translation}->{'Capacity'} = 'Capacidad';
    $Self->{Translation}->{'Change Definition'} = 'Modificar Definición';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = 'Actualización de definiciones fallida! Revisar el Log del Sistema para consultar los detalles';
    $Self->{Translation}->{'Client Application'} = 'Aplicación Cliente';
    $Self->{Translation}->{'Client OS'} = 'SO Cliente';
    $Self->{Translation}->{'Concurrent Users'} = 'Usuarios Concurrentes';
    $Self->{Translation}->{'Config Item-Area'} = 'Área de Elementos de Configuración';
    $Self->{Translation}->{'Config Items available'} = 'Elementos de Configuración disponibles';
    $Self->{Translation}->{'Config Items shown'} = 'Elementos de Configuración mostrados';
    $Self->{Translation}->{'CMDB'} = '';
    $Self->{Translation}->{'Demo'} = 'Demostración';
    $Self->{Translation}->{'Desktop'} = 'Escritorio';
    $Self->{Translation}->{'Developer Licence'} = 'Licencia de Desarrollador';
    $Self->{Translation}->{'Docking Station'} = 'Docking Station';
    $Self->{Translation}->{'Duplicate'} = 'Duplicado';
    $Self->{Translation}->{'Embedded'} = 'Embebido';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = '';
    $Self->{Translation}->{'Enterprise Licence'} = 'Licencia Corporativa';
    $Self->{Translation}->{'Expiration Date'} = 'Fecha de Expiración';
    $Self->{Translation}->{'Expired'} = 'Expirado';
    $Self->{Translation}->{'FQDN'} = 'FQDN';
    $Self->{Translation}->{'Floor'} = 'Piso';
    $Self->{Translation}->{'Freeware'} = 'Freeware';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Gateway'} = 'Puerta de enlace';
    $Self->{Translation}->{'Graphic Adapter'} = 'Tarjeta Gráfica';
    $Self->{Translation}->{'Hard Disk'} = 'Disco Duro';
    $Self->{Translation}->{'Hard Disk::Capacity'} = 'Disco Duro::Capacidad';
    $Self->{Translation}->{'Hide Versions'} = 'Ocultar Versiones';
    $Self->{Translation}->{'IP Address'} = 'Dirección IP';
    $Self->{Translation}->{'IP over DHCP'} = 'IP sobre DHCP';
    $Self->{Translation}->{'IT Facility'} = 'Instalaciones de TI';
    $Self->{Translation}->{'Inactive'} = 'Inactivo';
    $Self->{Translation}->{'Incident'} = '';
    $Self->{Translation}->{'Install Date'} = 'Fecha de Instalación';
    $Self->{Translation}->{'Keybord'} = 'Teclado';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'Laptop'} = 'Computadora portátil';
    $Self->{Translation}->{'Last Change'} = 'Ultima modificación';
    $Self->{Translation}->{'Licence Key'} = 'Clave de Licencia';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = 'Clave de Licencia::Fecha de Expiración';
    $Self->{Translation}->{'Licence Key::Quantity'} = 'Clave de Licencia::Cantidad';
    $Self->{Translation}->{'Licence Type'} = 'Tipo de Licencia';
    $Self->{Translation}->{'Maintenance'} = 'Mantenimiento';
    $Self->{Translation}->{'Maximum number of one element'} = 'Número máximo de un elemento ';
    $Self->{Translation}->{'Media'} = 'Medio';
    $Self->{Translation}->{'Middleware'} = 'Middleware';
    $Self->{Translation}->{'Model'} = 'Modelo';
    $Self->{Translation}->{'Modem'} = 'Módem';
    $Self->{Translation}->{'Monitor'} = 'Monitor';
    $Self->{Translation}->{'Mouse'} = 'Mouse';
    $Self->{Translation}->{'Network Adapter'} = 'Adaptador de Red';
    $Self->{Translation}->{'Network Adapter::IP Address'} = 'Adaptador de Red::Dirección IP';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = 'Adaptador de Red::IP Sobre DHCP';
    $Self->{Translation}->{'Network Address'} = 'Dirección de Red';
    $Self->{Translation}->{'Network Address::Gateway'} = 'Dirección de Red::Puerta de enlace';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = 'Dirección de Red::Máscara de Subred';
    $Self->{Translation}->{'Open Source'} = 'Código Abierto';
    $Self->{Translation}->{'Operating System'} = 'Sistema Operativo';
    $Self->{Translation}->{'Operational'} = 'Operacional';
    $Self->{Translation}->{'Other'} = 'Otro';
    $Self->{Translation}->{'Other Equipment'} = 'Otro Equipo';
    $Self->{Translation}->{'Outlet'} = 'Outlet';
    $Self->{Translation}->{'PCMCIA Card'} = 'Tarjeta PCMCIA';
    $Self->{Translation}->{'PDA'} = 'Agenda Personal';
    $Self->{Translation}->{'Per Node'} = 'Por Nodo';
    $Self->{Translation}->{'Per Processor'} = 'Por Procesador';
    $Self->{Translation}->{'Per Server'} = 'Por Servidor';
    $Self->{Translation}->{'Per User'} = 'Por Usuario';
    $Self->{Translation}->{'Phone 1'} = 'Teléfono 1';
    $Self->{Translation}->{'Phone 2'} = 'Teléfono 2';
    $Self->{Translation}->{'Pilot'} = 'Piloto';
    $Self->{Translation}->{'Planned'} = 'Planificado';
    $Self->{Translation}->{'Printer'} = 'Impresora';
    $Self->{Translation}->{'Production'} = 'Producción';
    $Self->{Translation}->{'Quantity'} = 'Cantidad';
    $Self->{Translation}->{'Rack'} = 'Rack';
    $Self->{Translation}->{'Ram'} = 'RAM';
    $Self->{Translation}->{'Repair'} = 'Reparación';
    $Self->{Translation}->{'Retired'} = 'Retirado';
    $Self->{Translation}->{'Review'} = 'Revisado';
    $Self->{Translation}->{'Room'} = 'Cuarto';
    $Self->{Translation}->{'Router'} = 'Enrutador';
    $Self->{Translation}->{'Scanner'} = 'Escáner';
    $Self->{Translation}->{'Search Config Items'} = 'Buscar Elementos de Configuración';
    $Self->{Translation}->{'Security Device'} = 'Dispositivo de Seguridad';
    $Self->{Translation}->{'Serial Number'} = 'Número Serial';
    $Self->{Translation}->{'Server'} = 'Servidor';
    $Self->{Translation}->{'Server Application'} = 'Aplicación Servidor';
    $Self->{Translation}->{'Server OS'} = 'SO Servidor';
    $Self->{Translation}->{'Show Versions'} = 'Mostrar Versiones';
    $Self->{Translation}->{'Single Licence'} = 'Licencia Única';
    $Self->{Translation}->{'Subnet Mask'} = 'Máscara de Subred';
    $Self->{Translation}->{'Switch'} = 'Switch';
    $Self->{Translation}->{'Telco'} = 'Conferencia telefónica';
    $Self->{Translation}->{'Test/QA'} = 'Pruebas';
    $Self->{Translation}->{'The deployment state of this config item'} = 'El estado de implementación de este elemento de configuración';
    $Self->{Translation}->{'The incident state of this config item'} = 'El estado de este elemento de configuración';
    $Self->{Translation}->{'Time Restricted'} = 'Tiempo Restringido';
    $Self->{Translation}->{'USB Device'} = 'Dispositivo USB';
    $Self->{Translation}->{'Unlimited'} = 'Ilimitada';
    $Self->{Translation}->{'User Tool'} = 'Herramienta de Usuario';
    $Self->{Translation}->{'Volume Licence'} = 'Licencia por Volumen';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'WLAN Access Point'} = 'Punto de Acceso WLAN';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Fecha de Expiración de la Garantía';
    $Self->{Translation}->{'Workplace'} = 'Lugar de trabajo';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Gestión de Elementos de Configuración';
    $Self->{Translation}->{'Change class definition'} = '';
    $Self->{Translation}->{'Config Item'} = 'Elemento de Configuración';
    $Self->{Translation}->{'Class'} = 'Clase';
    $Self->{Translation}->{'Definition'} = '';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Filter for Classes'} = '';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = '';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'El nombre de este elemento de configuración';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        '';
    $Self->{Translation}->{'Deployment State'} = 'Estado de la Implementación';
    $Self->{Translation}->{'Incident State'} = 'Estado del Incidente';

    # Template: AgentITSMConfigItemHistory

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = '';
    $Self->{Translation}->{'Config Items per page'} = '';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'Deployment State Type'} = '';
    $Self->{Translation}->{'Current Incident State'} = 'Estado Actual del Incidente';
    $Self->{Translation}->{'Current Incident State Type'} = '';
    $Self->{Translation}->{'Last changed'} = 'Última modificación';

    # Template: AgentITSMConfigItemPrint
    $Self->{Translation}->{'ConfigItem'} = '';
    $Self->{Translation}->{'ConfigItem-Info'} = '';
    $Self->{Translation}->{'Current Deployment State'} = 'Estado Actual de la Implementación';
    $Self->{Translation}->{'Last changed by'} = 'Última modificación por';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Create New Template'} = '';
    $Self->{Translation}->{'Run Search'} = '';
    $Self->{Translation}->{'Also search in previous versions?'} = '¿Desea buscar en versiones anteriores?';

    # Template: AgentITSMConfigItemSearchResultPrint
    $Self->{Translation}->{'CreateTime'} = '';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = '';
    $Self->{Translation}->{'Configuration Item Information'} = '';
    $Self->{Translation}->{'Show one version'} = '';
    $Self->{Translation}->{'Show all versions'} = '';
    $Self->{Translation}->{'Version Incident State'} = '';
    $Self->{Translation}->{'Version Number'} = '';
    $Self->{Translation}->{'Configuration Item Version Details'} = '';
    $Self->{Translation}->{'Property'} = '';

    # SysConfig
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        '';
    $Self->{Translation}->{'Config Items'} = '';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        'Módulo de evento de elementos de configuración que habilita el acceso a la historia en la interfaz del agente.';
    $Self->{Translation}->{'Configuration Item Limit'} = 'Límite de Elementos de Configuración';
    $Self->{Translation}->{'Configuration Item limit per page'} = 'Límite por página de Elementos de Configuración';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        'Router backend de búsqueda de elementos de configuración de la interfaz del agente.';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        '';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        '';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        'Define el subobjeto por default de la clase \'ITSMConfigItem\'.';
    $Self->{Translation}->{'Defines the number of rows for the CI definition editor in the admin interface.'} =
        '';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItem screen.'} =
        '';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItemSearch screen.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item overview depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item search depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view, depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown.'} =
        '';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        '';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = 'Módulo para verificar el grupo responsable de una clase.';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        'Módulo para verificar el grupo responsable de un elemento de configuración.';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = 'Módulo para generar estadísticas de los elementos de configuración ITSM.';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        'Registro del módulo de objeto backend para el módulo de importación/exportación.';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        'Parámetros para los estados de implementación en la vista de preferencias de la interfaz del agente.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        '';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        'Parámetros para las páginas (donde se muestran los elementos de configuración)';
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
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        'Selecciona el módulo generador de números de los elementos de configuración. "AutoIncrementar" incrementa el número del elemento de configuración; el SystemID, el ConfigItemClassID y el contador son usados. El formato es "SystemID.ConfigItemClassID.Counter", por ejemplo: 1205000004, 1205000005.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        'Muestra un link en el menú para vincular un elemento de configuración con otro objeto, en la vista detallada de dicho elemento de configuración de la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        'Muestra un link en el menú para acceder a la historia de un elemento de configuracion en su vista detallada, en la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        'Muestra un link en el menú para duplicar un elemento de configuracion en su vista detallada, en la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        'Muestra un link en el menú para editar un elemento de configuracion en su vista detallada, en la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuraton item zoom view of the agent interface.'} =
        'Muestra un link en el menú para regresar en la vista detallada de un elemento de configuración de la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        'Muestra un link en el menú para imprimir un elemento de configuracion en su vista detallada, en la interfaz del agente.';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        'Muestra la historia de los elementos de configuración (ordenados inversamente) en la interfaz del agente.';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        '';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #

}

1;
