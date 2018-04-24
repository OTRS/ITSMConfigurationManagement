# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_ITSMConfigurationManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Config Item Verwaltung';
    $Self->{Translation}->{'Change class definition'} = 'Klassen-Definition ändern';
    $Self->{Translation}->{'Config Item Class'} = 'ConfigItem Klasse';
    $Self->{Translation}->{'Definition'} = 'Definition';
    $Self->{Translation}->{'Change'} = 'Ändern';

    # Template: AgentDashboardITSMConfigItemGeneric
    $Self->{Translation}->{'Incident State'} = 'Vorfallsstatus';
    $Self->{Translation}->{'Deployment State'} = 'Verwendungsstatus';
    $Self->{Translation}->{'Class'} = 'Klasse';
    $Self->{Translation}->{'Deployment State Type'} = 'Verwendungsstatus-Typ';
    $Self->{Translation}->{'Current Incident State'} = 'Aktueller Vorfallsstatus';
    $Self->{Translation}->{'Current Incident State Type'} = 'Aktueller Vorfallsstatus-Typ';
    $Self->{Translation}->{'Last changed'} = 'Zuletzt geändert';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = 'Config Item';
    $Self->{Translation}->{'Filter for Classes'} = 'Filter für Klassen';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'Wählen Sie eine Klasse aus der Liste aus um ein neues Config Item zu erstellen.';

    # Template: AgentITSMConfigItemBulk
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = 'ITSM ConfigItem Sammel-Aktion';
    $Self->{Translation}->{'Deployment state'} = 'Verwendungsstatus';
    $Self->{Translation}->{'Incident state'} = 'Vorfallsstatus';
    $Self->{Translation}->{'Link to another'} = 'Zu einem anderen verlinken';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = 'Ungültige Configuration Item Nummer!';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = 'Die Nummer des zu verlinkenden ConfigItems.';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = 'Wollen Sie dieses Configitem wirklich löschen?';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'Der Name dieses Config Items';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        'Name wird bereits von den ConfigItems mit den folgenden Nummern verwendet: %s';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = 'Änderungsverlauf von Config Item: %s';
    $Self->{Translation}->{'History Content'} = 'Änderungsverlauf';
    $Self->{Translation}->{'Createtime'} = 'Erstellt am';
    $Self->{Translation}->{'Zoom view'} = 'Großansicht';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Kontext-Eintstellungen';
    $Self->{Translation}->{'Config Items per page'} = 'Config Items pro Seite';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = '';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Create New Template'} = 'Neue Vorlage erstellen';
    $Self->{Translation}->{'Run Search'} = 'Suche ausführen';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Auch in früheren Versionen suchen?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'Configuration Item';
    $Self->{Translation}->{'Configuration Item Information'} = 'Configuration Item Information';
    $Self->{Translation}->{'Current Deployment State'} = 'Aktueller Verwendungsstatus';
    $Self->{Translation}->{'Last changed by'} = 'Zuletzt geändert von';
    $Self->{Translation}->{'Show one version'} = 'Zeige nur eine Version';
    $Self->{Translation}->{'Show all versions'} = 'Zeige alle Versionen';
    $Self->{Translation}->{'Version Incident State'} = 'Versions-Vorfallstatus';
    $Self->{Translation}->{'Version Deployment State'} = '';
    $Self->{Translation}->{'Version Number'} = 'Versionsnummer';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Configuration Item Versions-Details';
    $Self->{Translation}->{'Property'} = 'Eigenschaft';

    # Perl Module: Kernel/Modules/AgentITSMConfigItem.pm
    $Self->{Translation}->{'No access to Class is given!'} = '';
    $Self->{Translation}->{'Overview: ITSM ConfigItem'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemBulk.pm
    $Self->{Translation}->{'No ConfigItemID is given!'} = '';
    $Self->{Translation}->{'You need at least one selected Configuration Item!'} = '';
    $Self->{Translation}->{'You don\'t have write access to this configuration item: %s.'} =
        '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemDelete.pm
    $Self->{Translation}->{'Config item "%s" not found in database!'} = '';
    $Self->{Translation}->{'Was not able to delete the configitem ID %s!'} = '';
    $Self->{Translation}->{'No version found for ConfigItemID %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemEdit.pm
    $Self->{Translation}->{'No ConfigItemID, DuplicateID or ClassID is given!'} = '';
    $Self->{Translation}->{'No access is given!'} = '';
    $Self->{Translation}->{'No definition was defined for class %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemHistory.pm
    $Self->{Translation}->{'Can\'t show history, no ConfigItemID is given!'} = '';
    $Self->{Translation}->{'Can\'t show history, no access rights given!'} = '';
    $Self->{Translation}->{'New ConfigItem (ID=%s)'} = 'Neues ConfigItem (ID=%s)';
    $Self->{Translation}->{'New version (ID=%s)'} = 'Neue Version (ID=%s)';
    $Self->{Translation}->{'Deployment state updated (new=%s, old=%s)'} = 'Verwendungsstatus aktualisiert (neu=%s, alt=%s)';
    $Self->{Translation}->{'Incident state updated (new=%s, old=%s)'} = 'Vorfallsstatus aktualisiert (neu=%s, alt=%s)';
    $Self->{Translation}->{'ConfigItem (ID=%s) deleted'} = 'ConfigItem (ID=%s) gelöscht';
    $Self->{Translation}->{'Link to %s (type=%s) added'} = 'Verknüpfung zu %s (Typ=%s) hinzugefügt';
    $Self->{Translation}->{'Link to %s (type=%s) deleted'} = 'Verknüpfung zu %s (Typ=%s) gelöscht';
    $Self->{Translation}->{'ConfigItem definition updated (ID=%s)'} = 'ConfigItem-Definition aktualisiert (ID=%s)';
    $Self->{Translation}->{'Name updated (new=%s, old=%s)'} = 'Name aktualisiert (neu=%s, alt=%s)';
    $Self->{Translation}->{'Attribute %s updated from "%s" to "%s"'} = 'Attribut %s aktualisiert von "%s" nach "%s"';
    $Self->{Translation}->{'Version %s deleted'} = 'Version %s gelöscht';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'No ConfigItemID or VersionID is given!'} = '';
    $Self->{Translation}->{'Can\'t show config item, no access rights given!'} = '';
    $Self->{Translation}->{'ConfigItemID %s not found in database!'} = '';
    $Self->{Translation}->{'VersionID %s not found in database!'} = '';
    $Self->{Translation}->{'ConfigItem'} = 'ConfigItem';
    $Self->{Translation}->{'printed by %s at %s'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'Invalid ClassID!'} = '';
    $Self->{Translation}->{'No ClassID is given!'} = '';
    $Self->{Translation}->{'No access rights for this class given!'} = '';
    $Self->{Translation}->{'No Result!'} = 'Kein Ergebnis!';
    $Self->{Translation}->{'Config Item Search Results'} = 'Suchergebnise filtern';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemZoom.pm
    $Self->{Translation}->{'Can\'t show item, no access rights for ConfigItem are given!'} =
        '';
    $Self->{Translation}->{'The deployment state of this config item'} = 'Der Verwendungsstatus dieses Config Items';
    $Self->{Translation}->{'The incident state of this config item'} = 'Der Vorfallsstatus dieses Config Items';

    # Perl Module: Kernel/Output/HTML/Dashboard/ITSMConfigItemGeneric.pm
    $Self->{Translation}->{'Shown config items'} = '';

    # Perl Module: Kernel/Output/HTML/ITSMConfigItem/LayoutDate.pm
    $Self->{Translation}->{'Between'} = 'Zwischen';

    # Perl Module: Kernel/System/ImportExport/ObjectBackend/ITSMConfigItem.pm
    $Self->{Translation}->{'Maximum number of one element'} = 'Maximale Anzahl eines Elements';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'Leere Felder belassen den aktuellen Wert';
    $Self->{Translation}->{'Skipped'} = 'Übersprungen';

    # Perl Module: var/packagesetup/ITSMConfigurationManagement.pm
    $Self->{Translation}->{'Model'} = 'Model';
    $Self->{Translation}->{'Serial Number'} = 'Seriennummer';
    $Self->{Translation}->{'CPU'} = 'CPU';
    $Self->{Translation}->{'Ram'} = 'Arbeitsspeicher';
    $Self->{Translation}->{'Hard Disk'} = 'Festplatte';
    $Self->{Translation}->{'Capacity'} = 'Kapazität';
    $Self->{Translation}->{'Network Adapter'} = 'Netzwerk Adapter';
    $Self->{Translation}->{'IP over DHCP'} = 'IP über DHCP';
    $Self->{Translation}->{'IP Address'} = 'IP Addresse';
    $Self->{Translation}->{'Graphic Adapter'} = 'Grafik Adapter';
    $Self->{Translation}->{'Other Equipment'} = 'Sonstige Ausstattung';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Garantie Ablaufdatum';
    $Self->{Translation}->{'Install Date'} = 'Installationsdatum';
    $Self->{Translation}->{'Phone 1'} = 'Telefon 1';
    $Self->{Translation}->{'Phone 2'} = 'Telefon 2';
    $Self->{Translation}->{'E-Mail'} = 'E-Mail';
    $Self->{Translation}->{'Network Address'} = 'Netzwerk Adresse';
    $Self->{Translation}->{'Subnet Mask'} = 'Subnetz Maske';
    $Self->{Translation}->{'Gateway'} = 'Gateway';
    $Self->{Translation}->{'Licence Type'} = 'Lizenztyp';
    $Self->{Translation}->{'Licence Key'} = 'Lizenzschlüssel';
    $Self->{Translation}->{'Quantity'} = 'Menge';
    $Self->{Translation}->{'Expiration Date'} = 'Ablaufdatum';
    $Self->{Translation}->{'Media'} = 'Medium';

    # Database XML Definition: ITSMConfigurationManagement.sopm
    $Self->{Translation}->{'Computer'} = 'Computer';
    $Self->{Translation}->{'Hardware'} = 'Hardware';
    $Self->{Translation}->{'Network'} = 'Netzwerk';
    $Self->{Translation}->{'Software'} = 'Software';
    $Self->{Translation}->{'Expired'} = 'Abgelaufen';
    $Self->{Translation}->{'Maintenance'} = 'In Wartung';
    $Self->{Translation}->{'Pilot'} = 'Pilotbetrieb';
    $Self->{Translation}->{'Planned'} = 'Geplant';
    $Self->{Translation}->{'Repair'} = 'In Reparatur';
    $Self->{Translation}->{'Retired'} = 'Außer Dienst';
    $Self->{Translation}->{'Review'} = 'Unter Review';
    $Self->{Translation}->{'Test/QA'} = 'Test/QS';
    $Self->{Translation}->{'Laptop'} = 'Laptop';
    $Self->{Translation}->{'Desktop'} = 'Desktop';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Server'} = 'Server';
    $Self->{Translation}->{'Other'} = 'Sonstiges';
    $Self->{Translation}->{'Monitor'} = 'Monitor';
    $Self->{Translation}->{'Printer'} = 'Drucker';
    $Self->{Translation}->{'Switch'} = 'Switch';
    $Self->{Translation}->{'Router'} = 'Router';
    $Self->{Translation}->{'WLAN Access Point'} = 'WLAN Access Point';
    $Self->{Translation}->{'Security Device'} = 'Sicherheitsgerät';
    $Self->{Translation}->{'Backup Device'} = 'Backup Gerät';
    $Self->{Translation}->{'Mouse'} = 'Maus';
    $Self->{Translation}->{'Keyboard'} = 'Tastatur';
    $Self->{Translation}->{'Camera'} = 'Kamera';
    $Self->{Translation}->{'Beamer'} = 'Beamer';
    $Self->{Translation}->{'Modem'} = 'Modem';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA Karte';
    $Self->{Translation}->{'USB Device'} = 'USB Gerät';
    $Self->{Translation}->{'Docking Station'} = 'Docking Station';
    $Self->{Translation}->{'Scanner'} = 'Scanner';
    $Self->{Translation}->{'Building'} = 'Gebäude';
    $Self->{Translation}->{'Office'} = 'Büro';
    $Self->{Translation}->{'Floor'} = 'Etage';
    $Self->{Translation}->{'Room'} = 'Raum';
    $Self->{Translation}->{'Rack'} = 'Rack';
    $Self->{Translation}->{'Workplace'} = 'Arbeitsplatz';
    $Self->{Translation}->{'Outlet'} = 'Anschlussdose';
    $Self->{Translation}->{'IT Facility'} = 'IT Einrichtung';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'Telco'} = 'Telko';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Client Application'} = 'Client Anwendung';
    $Self->{Translation}->{'Middleware'} = 'Middleware';
    $Self->{Translation}->{'Server Application'} = 'Server Anwendung';
    $Self->{Translation}->{'Client OS'} = 'Client Betriebssystem';
    $Self->{Translation}->{'Server OS'} = 'Server Betriebssystem';
    $Self->{Translation}->{'Admin Tool'} = 'Admin Tool';
    $Self->{Translation}->{'User Tool'} = 'User Tool';
    $Self->{Translation}->{'Embedded'} = 'Embedded';
    $Self->{Translation}->{'Single Licence'} = 'Einzellizenz';
    $Self->{Translation}->{'Per User'} = 'Pro Benutzer';
    $Self->{Translation}->{'Per Processor'} = 'Pro Prozessor';
    $Self->{Translation}->{'Per Server'} = 'Pro Server';
    $Self->{Translation}->{'Per Node'} = 'Pro Knoten';
    $Self->{Translation}->{'Volume Licence'} = 'Volumen Lizenz';
    $Self->{Translation}->{'Enterprise Licence'} = 'Enterprise Lizenz';
    $Self->{Translation}->{'Developer Licence'} = 'Entwickler Lizenz';
    $Self->{Translation}->{'Demo'} = 'Demo';
    $Self->{Translation}->{'Time Restricted'} = 'Zeitlich begrenzt';
    $Self->{Translation}->{'Freeware'} = 'Freeware';
    $Self->{Translation}->{'Open Source'} = 'Open Source';
    $Self->{Translation}->{'Unlimited'} = 'Unlimitiert';

    # JS File: ITSM.Agent.ConfigItem.Zoom
    $Self->{Translation}->{'Ok'} = 'Ok';

    # SysConfig
    $Self->{Translation}->{'Assigned CIs'} = '';
    $Self->{Translation}->{'CIs assigned to customer company'} = '';
    $Self->{Translation}->{'CIs assigned to customer user'} = '';
    $Self->{Translation}->{'CMDB Settings'} = '';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        'Prüfe Namen auf Eindeutigkeit innerhalb der selben ConfigItem-Klasse oder global, d.h. es werden alle ConfigItems jeglicher ConfigItem-Klasse bei der Prüfung auf einen eindeutigen Namen berücksichtigt.';
    $Self->{Translation}->{'Config Items'} = 'Config Items';
    $Self->{Translation}->{'Config item add.'} = 'Config Item hinzufügen.';
    $Self->{Translation}->{'Config item edit.'} = 'Config Item bearbeiten.';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        '';
    $Self->{Translation}->{'Config item history.'} = 'Config Item Verlauf.';
    $Self->{Translation}->{'Config item print.'} = 'Config Item drucken.';
    $Self->{Translation}->{'Config item zoom.'} = 'Config Item Zoom.';
    $Self->{Translation}->{'ConfigItemNumber'} = '';
    $Self->{Translation}->{'Configuration Item Limit'} = 'Configuration Item Limit';
    $Self->{Translation}->{'Configuration Item limit per page.'} = '';
    $Self->{Translation}->{'Configuration Management Database.'} = '';
    $Self->{Translation}->{'Configuration item bulk module.'} = '';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        '';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = '';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Define the group with permissions.'} = '';
    $Self->{Translation}->{'Defines Required permissions to create ITSM configuration items using the Generic Interface.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to delete ITSM configuration items using the Generic Interface.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to get ITSM configuration items using the Generic Interface.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to search ITSM configuration items using the Generic Interface.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to update ITSM configuration items using the Generic Interface.'} =
        '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        '';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        '';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        'Definiert das Standard-Subobject der Klasse';
    $Self->{Translation}->{'Defines the number of rows for the CI definition editor in the admin interface.'} =
        '';
    $Self->{Translation}->{'Defines the order of incident states from high (e.g. cricital) to low (e.g. functional).'} =
        '';
    $Self->{Translation}->{'Defines the relevant deployment states where linked tickets can affect the status of a CI.'} =
        '';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItem screen.'} =
        '';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItemSearch screen.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item overview depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item search depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item widget depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting AgentCustomerInformationCenter::Backend###0060-CIC-ITSMConfigItemCustomerCompany (key DefaultColumns).'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view, depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown.'} =
        '';
    $Self->{Translation}->{'Defines which type of link (named from the ticket perspective) can affect the status of a linked CI.'} =
        '';
    $Self->{Translation}->{'Defines which type of ticket can affect the status of a linked CI.'} =
        '';
    $Self->{Translation}->{'Delete Configuration Item'} = '';
    $Self->{Translation}->{'Deployment State Color'} = '';
    $Self->{Translation}->{'Duplicate'} = 'Duplizieren';
    $Self->{Translation}->{'Enables configuration item bulk action feature for the agent frontend to work on more than one configuration item at a time.'} =
        '';
    $Self->{Translation}->{'Enables configuration item bulk action feature only for the listed groups.'} =
        '';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        '(De-)Aktiviert die Funktionalität um ConfigItems auf eindeutige Namen zu überprüfen. Bevor Sie diese Option aktivieren, sollten Sie Ihr System auf bereits vorhandene ConfigItems mit gleichem Namen überprüfen. Sie können dies mit Hilfe des scripts bin/otrs.ITSMConfigItemListDuplicates.pl tun.';
    $Self->{Translation}->{'Event module to set configitem-status on ticket-configitem-link.'} =
        '';
    $Self->{Translation}->{'ITSM config item overview.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        '';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = '';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        'Objekt-Backend Modul Registration des Import/Export Moduls.';
    $Self->{Translation}->{'Overview.'} = 'Übersicht.';
    $Self->{Translation}->{'Parameters for the dashboard backend of the customer company config item overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.'} =
        '';
    $Self->{Translation}->{'Parameters for the deployment states color in the preferences view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Parameter für die zugriffsberechtigte Gruppe der General-Katalog-Attribute.';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required privileges to delete config items.'} = '';
    $Self->{Translation}->{'Search config items.'} = 'Suche config items.';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        '';
    $Self->{Translation}->{'Set the incident state of a CI automatically when a Ticket is Linked to a CI.'} =
        '';
    $Self->{Translation}->{'Sets the deployment state in the configuration item bulk screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Sets the incident state in the configuration item bulk screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the configuration item overview of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to delete a configuration item in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the configuration item overview of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuration item zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to zoom into a configuration item in the configuration item overview of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        '';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        '';
    $Self->{Translation}->{'class'} = 'Klasse';
    $Self->{Translation}->{'global'} = 'Global';
    $Self->{Translation}->{'postproductive'} = '';
    $Self->{Translation}->{'preproductive'} = '';
    $Self->{Translation}->{'productive'} = '';


    push @{ $Self->{JavaScriptStrings} // [] }, (
    'No',
    'Ok',
    'Settings',
    'Submit',
    'Yes',
    );

}

1;
