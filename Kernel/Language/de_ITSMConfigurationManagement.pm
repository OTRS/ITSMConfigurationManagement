# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Language::de_ITSMConfigurationManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'ConfigItem-Verwaltung';
    $Self->{Translation}->{'Change class definition'} = 'Klassen-Definition ändern';
    $Self->{Translation}->{'Config Item Class'} = 'ConfigItem-Klasse';
    $Self->{Translation}->{'Definition'} = 'Definition';
    $Self->{Translation}->{'Change'} = 'Ändern';

    # Template: AgentDashboardITSMConfigItemGeneric
    $Self->{Translation}->{'Incident State'} = 'Vorfallstatus';
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
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = 'ITSM ConfigItem Sammelaktion';
    $Self->{Translation}->{'Deployment state'} = 'Verwendungsstatus';
    $Self->{Translation}->{'Incident state'} = 'Vorfallstatus';
    $Self->{Translation}->{'Link to another'} = 'Zu einem anderen verknüpfen';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = 'Ungültige Configuration Item Nummer!';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = 'Die Nummer des zu verknüpfenden Configuration Items.';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = 'Wollen Sie dieses Configuration Item wirklich löschen?';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'Der Name dieses Configuration Items';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        'Name wird bereits von den Configuration Items mit den folgenden Nummern verwendet: %s';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = 'Historie von Configuration Item: %s';
    $Self->{Translation}->{'History Content'} = 'Änderungsverlauf';
    $Self->{Translation}->{'Createtime'} = 'Erstellt am';
    $Self->{Translation}->{'Zoom view'} = 'Detailansicht';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Kontext-Eintstellungen';
    $Self->{Translation}->{'Config Items per page'} = 'Configuration Items pro Seite';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = 'Eine generische ITSM Configuration Item-Tabelle.';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Run Search'} = 'Suche ausführen';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Auch in früheren Versionen suchen?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'Configuration Item';
    $Self->{Translation}->{'Configuration Item Information'} = 'Configuration Item Information';
    $Self->{Translation}->{'Current Deployment State'} = 'Aktueller Verwendungsstatus';
    $Self->{Translation}->{'Last changed by'} = 'Zuletzt geändert von';
    $Self->{Translation}->{'Show one version'} = 'Nur eine Version anzeigen';
    $Self->{Translation}->{'Show all versions'} = 'Alle Versionen anzeigen';
    $Self->{Translation}->{'Version Incident State'} = 'Vorfallstatus-Version';
    $Self->{Translation}->{'Version Deployment State'} = 'Version des Verwendungsstatus.';
    $Self->{Translation}->{'Version Number'} = 'Versionsnummer';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Configuration Item-Versionsdetails';
    $Self->{Translation}->{'Property'} = 'Eigenschaft';

    # Perl Module: Kernel/Modules/AgentITSMConfigItem.pm
    $Self->{Translation}->{'No access to Class is given!'} = 'Es wird kein Zugriff auf die Klasse gewährt!';
    $Self->{Translation}->{'Overview: ITSM ConfigItem'} = 'Übersicht: ITSM ConfigItem';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemBulk.pm
    $Self->{Translation}->{'No ConfigItemID is given!'} = 'Keine ID für das Configuration Item angegeben!';
    $Self->{Translation}->{'You need at least one selected Configuration Item!'} = 'Sie benötigen wenigstens ein ausgewähltes Configuration Item!';
    $Self->{Translation}->{'You don\'t have write access to this configuration item: %s.'} =
        'Sie haben keine Schreib-Berechtigungen für dieses Configuration Item: %s.';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemDelete.pm
    $Self->{Translation}->{'Config item "%s" not found in database!'} = 'Configuration Item "%s" in Datenbank nicht gefunden!';
    $Self->{Translation}->{'Was not able to delete the configitem ID %s!'} = 'Es war nicht möglich, die Configuration Item-ID %s zu löschen!';
    $Self->{Translation}->{'No version found for ConfigItemID %s!'} = 'Keine Version für Configuration Item-ID %s gefunden!';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemEdit.pm
    $Self->{Translation}->{'No ConfigItemID, DuplicateID or ClassID is given!'} = 'Keine Configuration Item-ID, Duplikats-ID oder Klassen-ID angegeben.';
    $Self->{Translation}->{'No access is given!'} = 'Kein Zugriff gewährt!';
    $Self->{Translation}->{'No definition was defined for class %s!'} = 'Keine Definition für Klasse %s definiert!';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemHistory.pm
    $Self->{Translation}->{'Can\'t show history, no ConfigItemID is given!'} = 'Kann Historie nicht anzeigen, keine Configuration Item-ID übermittelt!';
    $Self->{Translation}->{'Can\'t show history, no access rights given!'} = 'Kann Historie nicht anzeigen, keine Configuration Item-ID übermittelt!';
    $Self->{Translation}->{'New ConfigItem (ID=%s)'} = 'Neues Configuration Item (ID=%s)';
    $Self->{Translation}->{'New version (ID=%s)'} = 'Neue Version (ID=%s)';
    $Self->{Translation}->{'Deployment state updated (new=%s, old=%s)'} = 'Verwendungsstatus aktualisiert (neu=%s, alt=%s)';
    $Self->{Translation}->{'Incident state updated (new=%s, old=%s)'} = 'Vorfallstatus aktualisiert (neu=%s, alt=%s)';
    $Self->{Translation}->{'ConfigItem (ID=%s) deleted'} = 'ConfigItem (ID=%s) gelöscht';
    $Self->{Translation}->{'Link to %s (type=%s) added'} = 'Verknüpfung zu %s (Typ=%s) hinzugefügt';
    $Self->{Translation}->{'Link to %s (type=%s) deleted'} = 'Verknüpfung zu %s (Typ=%s) gelöscht';
    $Self->{Translation}->{'ConfigItem definition updated (ID=%s)'} = 'ConfigItem-Definition aktualisiert (ID=%s)';
    $Self->{Translation}->{'Name updated (new=%s, old=%s)'} = 'Name aktualisiert (neu=%s, alt=%s)';
    $Self->{Translation}->{'Attribute %s updated from "%s" to "%s"'} = 'Attribut %s aktualisiert von "%s" nach "%s"';
    $Self->{Translation}->{'Version %s deleted'} = 'Version %s gelöscht';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'No ConfigItemID or VersionID is given!'} = 'Keine Configuration Item-ID oder Versions-ID angegeben.';
    $Self->{Translation}->{'Can\'t show config item, no access rights given!'} = 'Configuration Item kann nicht angezeigt werden, keine Zugriffsrechte vergeben!';
    $Self->{Translation}->{'ConfigItemID %s not found in database!'} = 'Configuration Item-ID %s in Datenbank nicht gefunden.';
    $Self->{Translation}->{'VersionID %s not found in database!'} = 'Versions-ID %s in Datenbank nicht gefunden!';
    $Self->{Translation}->{'ConfigItem'} = 'ConfigItem';
    $Self->{Translation}->{'printed by %s at %s'} = 'gedruckt von %s am %s';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'Invalid ClassID!'} = 'Ungültige Klassen-ID!';
    $Self->{Translation}->{'No ClassID is given!'} = 'Keine Klassen-ID übermittelt!';
    $Self->{Translation}->{'No access rights for this class given!'} = 'Keine Zugriffsrechte für diese Klasse vergeben!';
    $Self->{Translation}->{'No Result!'} = 'Kein Ergebnis!';
    $Self->{Translation}->{'Config Item Search Results'} = 'Config Item-Suchergebnisse';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemZoom.pm
    $Self->{Translation}->{'Can\'t show item, no access rights for ConfigItem are given!'} =
        'Kann das Configuration Item nicht anzeigen, keine Zugriffsrechte für Configuration Items vergeben.';
    $Self->{Translation}->{'operational'} = 'Operativ';
    $Self->{Translation}->{'warning'} = 'Warnung';
    $Self->{Translation}->{'incident'} = 'Vorfall';
    $Self->{Translation}->{'The deployment state of this config item'} = 'Der Verwendungsstatus dieses Config Items';
    $Self->{Translation}->{'The incident state of this config item'} = 'Der Vorfallstatus dieses Config Items';

    # Perl Module: Kernel/Output/HTML/Dashboard/ITSMConfigItemGeneric.pm
    $Self->{Translation}->{'Shown config items'} = 'Angezeigte Configuration Items';

    # Perl Module: Kernel/Output/HTML/ITSMConfigItem/LayoutDate.pm
    $Self->{Translation}->{'Between'} = 'Zwischen';

    # Perl Module: Kernel/System/ImportExport/ObjectBackend/ITSMConfigItem.pm
    $Self->{Translation}->{'Maximum number of one element'} = 'Maximale Anzahl eines Elements';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'Leere Felder zeigen an, dass die aktuellen Werte beibehalten werden.';
    $Self->{Translation}->{'Skipped'} = 'Übersprungen';

    # Perl Module: var/packagesetup/ITSMConfigurationManagement.pm
    $Self->{Translation}->{'Model'} = 'Modell';
    $Self->{Translation}->{'Customer Company'} = 'Kundenunternehmen';
    $Self->{Translation}->{'Serial Number'} = 'Seriennummer';
    $Self->{Translation}->{'CPU'} = 'CPU';
    $Self->{Translation}->{'Ram'} = 'RAM';
    $Self->{Translation}->{'Hard Disk'} = 'Festplatte';
    $Self->{Translation}->{'Capacity'} = 'Kapazität';
    $Self->{Translation}->{'Network Adapter'} = 'Netzwerk-Adapter';
    $Self->{Translation}->{'IP over DHCP'} = 'IP über DHCP';
    $Self->{Translation}->{'IP Address'} = 'IP-Addresse';
    $Self->{Translation}->{'Graphic Adapter'} = 'Grafik-Adapter';
    $Self->{Translation}->{'Other Equipment'} = 'Sonstige Ausstattung';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Garantie Ablaufdatum';
    $Self->{Translation}->{'Install Date'} = 'Installationsdatum';
    $Self->{Translation}->{'Phone 1'} = 'Telefon 1';
    $Self->{Translation}->{'Phone 2'} = 'Telefon 2';
    $Self->{Translation}->{'E-Mail'} = 'E-Mail';
    $Self->{Translation}->{'Network Address'} = 'Netzwerk-Adresse';
    $Self->{Translation}->{'Subnet Mask'} = 'Subnetz-Maske';
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
    $Self->{Translation}->{'WLAN Access Point'} = 'WLAN-Zugangspunkt';
    $Self->{Translation}->{'Security Device'} = 'Sicherheitsgerät';
    $Self->{Translation}->{'Backup Device'} = 'Backup-Gerät';
    $Self->{Translation}->{'Mouse'} = 'Maus';
    $Self->{Translation}->{'Keyboard'} = 'Tastatur';
    $Self->{Translation}->{'Camera'} = 'Kamera';
    $Self->{Translation}->{'Beamer'} = 'Beamer';
    $Self->{Translation}->{'Modem'} = 'Modem';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA-Karte';
    $Self->{Translation}->{'USB Device'} = 'USB-Gerät';
    $Self->{Translation}->{'Docking Station'} = 'Docking-Station';
    $Self->{Translation}->{'Scanner'} = 'Scanner';
    $Self->{Translation}->{'Building'} = 'Gebäude';
    $Self->{Translation}->{'Office'} = 'Büro';
    $Self->{Translation}->{'Floor'} = 'Etage';
    $Self->{Translation}->{'Room'} = 'Raum';
    $Self->{Translation}->{'Rack'} = 'Rack';
    $Self->{Translation}->{'Workplace'} = 'Arbeitsplatz';
    $Self->{Translation}->{'Outlet'} = 'Anschlussdose';
    $Self->{Translation}->{'IT Facility'} = 'IT-Einrichtung';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'Telco'} = 'Telko';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Client Application'} = 'Client-Anwendung';
    $Self->{Translation}->{'Middleware'} = 'Middleware';
    $Self->{Translation}->{'Server Application'} = 'Server-Anwendung';
    $Self->{Translation}->{'Client OS'} = 'Client-Betriebssystem';
    $Self->{Translation}->{'Server OS'} = 'Server-Betriebssystem';
    $Self->{Translation}->{'Admin Tool'} = 'Administrator-Tool';
    $Self->{Translation}->{'User Tool'} = 'Benutzer-Tool';
    $Self->{Translation}->{'Embedded'} = 'Embedded';
    $Self->{Translation}->{'Single Licence'} = 'Einzellizenz';
    $Self->{Translation}->{'Per User'} = 'Pro Benutzer';
    $Self->{Translation}->{'Per Processor'} = 'Pro Prozessor';
    $Self->{Translation}->{'Per Server'} = 'Pro Server';
    $Self->{Translation}->{'Per Node'} = 'Pro Knoten';
    $Self->{Translation}->{'Volume Licence'} = 'Volume-Lizenz';
    $Self->{Translation}->{'Enterprise Licence'} = 'Enterprise-Lizenz';
    $Self->{Translation}->{'Developer Licence'} = 'Entwickler-Lizenz';
    $Self->{Translation}->{'Demo'} = 'Demo';
    $Self->{Translation}->{'Time Restricted'} = 'Zeitlich begrenzt';
    $Self->{Translation}->{'Freeware'} = 'Freeware';
    $Self->{Translation}->{'Open Source'} = 'Open Source';
    $Self->{Translation}->{'Unlimited'} = 'Unlimitiert';

    # JS File: ITSM.Agent.ConfigItem.Zoom
    $Self->{Translation}->{'Ok'} = 'Ok';

    # SysConfig
    $Self->{Translation}->{'Assigned CIs'} = 'Zugewiesene Configuration Items';
    $Self->{Translation}->{'CIs assigned to customer company'} = 'Zum Kunden zugewiesene Configurations Items';
    $Self->{Translation}->{'CIs assigned to customer user'} = 'Zum Kundenbenutzer zugewiesene Configurations Items';
    $Self->{Translation}->{'CMDB Settings'} = 'CMDB-Einstellungen';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        'Prüft Namen auf Eindeutigkeit innerhalb der selben Configuration Item-Klasse oder global, d.h. es werden alle Configuration Items jeglicher Configuration Item-Klasse bei der Prüfung auf einen eindeutigen Namen berücksichtigt.';
    $Self->{Translation}->{'Config Items'} = 'Configuration Items';
    $Self->{Translation}->{'Config item add.'} = 'Configuration Item hinzufügen.';
    $Self->{Translation}->{'Config item edit.'} = 'Configuration Item bearbeiten.';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        'Configuration Item-Ereignismodul, dass die Protokollierung der Historie im Agenten-Interface ermöglicht.';
    $Self->{Translation}->{'Config item history.'} = 'Configuration Item-Historie.';
    $Self->{Translation}->{'Config item print.'} = 'Configuration Item drucken.';
    $Self->{Translation}->{'Config item zoom.'} = 'Configuration Item-Detailansicht.';
    $Self->{Translation}->{'ConfigItemNumber'} = 'Configuration Item-Nummer';
    $Self->{Translation}->{'Configuration Item Limit'} = 'Configuration Item-Limit';
    $Self->{Translation}->{'Configuration Item limit per page.'} = 'Configuration Item-Limit pro Seite.';
    $Self->{Translation}->{'Configuration Management Database.'} = 'Configuration Management Database.';
    $Self->{Translation}->{'Configuration item bulk module.'} = 'Configuration Item-Sammelaktion.';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        '';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = 'Die Definitionen von Configuration Item-Limit erstellen und verwalten.';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        'Definieren Sie Actions, in denen im Verknüpfte-Objekte-Widget ein Einstellungen-Knopf verfügbar sein soll (LinkObject::ViewMode = "complex"). Bitte beachten Sie, dass für diese Actions die folgenden JS- und CSS-Dateien registriert sein müssen:  Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js und Core.Agent.LinkObject.js.';
    $Self->{Translation}->{'Defines Required permissions to create ITSM configuration items using the Generic Interface.'} =
        'Definiert die benötigten Berechtigungen zum Erstellen von ITSM Configuration Items durch das Generic Interface.';
    $Self->{Translation}->{'Defines Required permissions to delete ITSM configuration items using the Generic Interface.'} =
        'Definiert die benötigten Berechtigungen zum Löschen von ITSM Configuration Items durch das Generic Interface.';
    $Self->{Translation}->{'Defines Required permissions to get ITSM configuration items using the Generic Interface.'} =
        'Definiert die benötigten Berechtigungen, um ITSM-Configuration Items über das Generic Interface abzurufen.';
    $Self->{Translation}->{'Defines Required permissions to search ITSM configuration items using the Generic Interface.'} =
        'Definiert die benötigten Berechtigungen, um nach ITSM-Configuration Items mit dem Generic Interface zu suchen.';
    $Self->{Translation}->{'Defines Required permissions to update ITSM configuration items using the Generic Interface.'} =
        'Definiert die benötigten Berechtigungen, um ITSM-Generic Items mit dem Generic Interface zu aktualisieren.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        'Definiert das Übersichtsmodul um die "Klein"-Ansicht einer Configuration Items-Liste anzuzeigen.';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        'Definiert reguläre Ausdrücke individuell für jedes Configuration Item, um den Namen des Configuration Item zu überprüfen und entsprechende Fehlermeldungen anzuzeigen.';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        'Definiert das Standard-Unterobjekt der Klasse \'ITSMConfigItem\'.';
    $Self->{Translation}->{'Defines the number of rows for the CI definition editor in the admin interface.'} =
        'Definiert die Anzahl der Zeilen für den Editor der Configuration Item-Definition im Administrator-Interface.';
    $Self->{Translation}->{'Defines the order of incident states from high (e.g. cricital) to low (e.g. functional).'} =
        'Definiert die Reihenfolge der Vorfallstatus von hoch (bspw. kritisch) nach niedrig (bspw. funktional).';
    $Self->{Translation}->{'Defines the relevant deployment states where linked tickets can affect the status of a CI.'} =
        'Definiert die relevanten Verwendungsstaus, bei denen verknüpfte Tickets den Status eines Configuration Items beeinflussen.';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItem screen.'} =
        'Definiert das Suchlimit für die ITSM Configuration-Ansicht.';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItemSearch screen.'} =
        'Definiert das Suchlimit für die Configuration Items-Suche.';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected.'} =
        'Definiert die angezeigten Tabellenspalten in der Configuration Item-Übersicht. Diese Option hat keinen Effekt auf die Position der Spalten. Hinweis: Klassenspalte ist immer verfügbar, wenn Filter "Alle" gewählt ist.';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} =
        'Definiert die angezeigten Tabellenspalten für die Configuration Item-Suche. Diese Option hat keinen Effekt auf die Position der Spalten.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item overview depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'Definiert die angezeigten Spalten von Configuration Items in der Configuration Item-Übersicht in Abhängigkeit von der Configuration Item-Klasse. Jedem Eintrag müssen der Klassenname und Doppelpunkte vorangestellt werden (z.B. Computer:::). Es gibt einige Configuration Item-Attribute, die allen Configuration Items gemeinsam sind (Beispiel für die Klasse Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). Um einzelne Configuration Item-Attribute, wie sie in der Configuration Item-Definition definiert sind, darzustellen, muss das folgende Schema verwendet werden (Beispiel für die Klasse Computer): Computer::HardDisk::1, Computer::HardDisk::1::Kapazität::1, Computer::HardDisk::2, Computer::HardDisk::2::Kapazität::1. Wenn es keinen Eintrag für eine Configuration Item-Klasse gibt, werden die Standard-Spalten so angezeigt, wie in der Einstellung "ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns" definiert.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item search depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'Definiert die angezeigten Spalten von Configuration Items in der Configuration Item-Suche in Abhängigkeit von der Configuration Item-Klasse. Jedem Eintrag müssen der Klassenname und Doppelpunkte vorangestellt werden (z.B. Computer:::). Es gibt einige Configuration Item-Attribute, die allen Configuration Items gemeinsam sind (Beispiel für die Klasse Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). Um einzelne Configuration Item-Attribute, wie sie in der Configuration Item-Definition definiert sind, darzustellen, muss das folgende Schema verwendet werden (Beispiel für die Klasse Computer): Computer::HardDisk::1, Computer::HardDisk::1::Kapazität::1, Computer::HardDisk::2, Computer::HardDisk::2::Kapazität::1. Wenn es keinen Eintrag für eine Configuration Item-Klasse gibt, werden die Standard-Spalten so angezeigt, wie in der Einstellung "ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns" definiert.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item widget depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting AgentCustomerInformationCenter::Backend###0060-CIC-ITSMConfigItemCustomerCompany (key DefaultColumns).'} =
        'Definiert die angezeigten Spalten von Configuration Items in der Configuration Item-Übersicht in Abhängigkeit von der Configuration Item-Klasse. Jedem Eintrag müssen der Klassenname und Doppelpunkte vorangestellt werden (z.B. Computer:::). Es gibt einige Configuration Item-Attribute, die allen Configuration Items gemeinsam sind (Beispiel für die Klasse Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). Um einzelne Configuration Item-Attribute, wie sie in der Configuration Item-Definition definiert sind, darzustellen, muss das folgende Schema verwendet werden (Beispiel für die Klasse Computer): Computer::HardDisk::1, Computer::HardDisk::1::Kapazität::1, Computer::HardDisk::2, Computer::HardDisk::2::Kapazität::1. Wenn es keinen Eintrag für eine Configuration Item-Klasse gibt, werden die Standard-Spalten so angeuzeigt, wie in der Einstellung "AgentCustomerInformationCenter::Backend###0060-CIC-ITSMConfigItemCustomerCompany" definiert (Schlüssel "DefaultColumns").';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view for all CI classes. If there is no entry, then the default columns are shown.'} =
        'Definiert die angezeigten Spalten in der Komplexansicht der Verknüpfungstabelle für alle Configuration Item-Klassen. Wenn es keinen Eintrag gibt, werden die Standardspalten angezeigt.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view, depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown.'} =
        'Definiert die angezeigten Spalten von Configuration Items in der Komplexansicht der Verknüpfungstabelle abhängig von der Configuration Item-Klasse. Definiert die angezeigten Spalten von Configuration Items in der Configuration Item-Übersicht in Abhängigkeit von der Configuration Item-Klasse. Jedem Eintrag müssen der Klassenname und Doppelpunkte vorangestellt werden (z.B. Computer:::). Es gibt einige Configuration Item-Attribute, die allen Configuration Items gemeinsam sind (Beispiel für die Klasse Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). Um einzelne Configuration Item-Attribute, wie sie in der Configuration Item-Definition definiert sind, darzustellen, muss das folgende Schema verwendet werden (Beispiel für die Klasse Computer): Computer::HardDisk::1, Computer::HardDisk::1::Kapazität::1, Computer::HardDisk::2, Computer::HardDisk::2::Kapazität::1. Wenn es keinen Eintrag für eine Configuration Item-Klasse gibt, werden die Standardspalten angezeigt.';
    $Self->{Translation}->{'Defines which type of link (named from the ticket perspective) can affect the status of a linked CI.'} =
        'Legt fest, welche Art von Link (aus der Ticketperspektive benannt) den Status eines verlinkten CI beeinflussen kann.';
    $Self->{Translation}->{'Defines which type of ticket can affect the status of a linked CI.'} =
        'Definiert, welcher Typ von Ticket den Status eines verknüpften Configuration Items beeinflussen kann.';
    $Self->{Translation}->{'Delete Configuration Item'} = 'Configuration Item löschen.';
    $Self->{Translation}->{'Deployment State Color'} = 'Verwendungsstatus-Farbe';
    $Self->{Translation}->{'Duplicate'} = 'Duplizieren';
    $Self->{Translation}->{'Enables configuration item bulk action feature for the agent frontend to work on more than one configuration item at a time.'} =
        'Aktiviert die Funktion "Sammelaktion" für das Agenten-Frontend, um zur gleichen Zeit an mehreren Configuration Items arbeiten zu können.';
    $Self->{Translation}->{'Enables configuration item bulk action feature only for the listed groups.'} =
        'Aktiviert die Funktion "Sammelaktion" nur für die gelisteten Gruppen.';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        '(De-)Aktiviert die Funktionalität um ConfigItems auf eindeutige Namen zu überprüfen. Bevor Sie diese Option aktivieren, sollten Sie Ihr System auf bereits vorhandene ConfigItems mit gleichem Namen überprüfen. Sie können dies mit Hilfe des scripts bin/otrs.ITSMConfigItemListDuplicates.pl tun.';
    $Self->{Translation}->{'Event module to set configitem-status on ticket-configitem-link.'} =
        'Ein Ereignismodul das beim Verknüpfen von Tickets mit Configuration Items den Status des Configuration Items verändert.';
    $Self->{Translation}->{'ITSM config item overview.'} = 'ITSM Configuration Item-Übersicht';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = 'Modul zur Überprüfung der Gruppe, die für eine Klasse verantwortlich ist.';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        'Modul, um die Gruppe zu überprüfen, die für ein Configuration Item verantwortlich ist.';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = 'Modul zum Generieren von ITSM-Configuration Item-Statistiken.';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        'Objekt-Backend Modul Registration des Import/Export Moduls.';
    $Self->{Translation}->{'Overview.'} = 'Übersicht.';
    $Self->{Translation}->{'Parameters for the dashboard backend of the customer company config item overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.'} =
        'Legt die Parameter für das Dashboard-Backend fest. "Limit" legt die Anzahl an Einträgen fest, die standardmäßig angezeigt werden. "Group" beschränkt den Zugang zum jeweiligen Dashlet (z. B. Group: admin;group1;group2). "Default" bestimmt, ob das Dashlet standardmäßig aktiv ist oder vom Nutzer manuell aktiviert werden muss. "CacheTTLLocal" bestimmt die Cachingdauer für das Dashlet in Minuten.';
    $Self->{Translation}->{'Parameters for the deployment states color in the preferences view of the agent interface.'} =
        'Parameter für die Farben der Verwendungsstatus in den persönlichen Einstellungen im Agenten-Interface.';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        'Parameter für die Farben der Verwendungsstatus in den persönlichen Einstellungen im Agenten-Interface.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Parameter für die zugriffsberechtigte Gruppe der General-Katalog-Attribute.';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        'Parameter für die Seiten, in denen Configuration Items angezeigt werden.';
    $Self->{Translation}->{'Permission Group'} = 'Berechtigungsgruppe \*';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} =
        'Erforderliche Berechtigungen, um die Ansicht zur Konfiguration von Configuration Items im Agenten-Interface nutzen zu können.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} =
        'Erforderliche Berechtigungen, um die Ansicht zur Suche von Configuration Items im Agenten-Interface nutzen zu können.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} =
        'Erforderliche Berechtigungen, um die Detailansicht von Configuration Items im Agenten-Interface nutzen zu können.';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} =
        'Erforderliche Berechtigungen, um die Ansicht zum Hinzufügen von Configuration Items im Agenten-Interface nutzen zu können.';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} =
        'Erforderliche Berechtigungen, um die Ansicht zum Bearbeiten von Configuration Items im Agenten-Interface nutzen zu können.';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} =
        'Erforderliche Berechtigungen, um die Historien-Ansicht von Configuration Items im Agenten-Interface nutzen zu können.';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} =
        'Erforderliche Berechtigungen, um die Ansicht zum Drucken von Configuration Items im Agenten-Interface nutzen zu können.';
    $Self->{Translation}->{'Required privileges to delete config items.'} = 'Erforderliche Berechtigungen, um Configuration Items löschen zu können.';
    $Self->{Translation}->{'Search config items.'} = 'Configuration Items suchen.';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        'Wählt das Modul zum Erzeugen der Configuration Item-Nummer. "AutoIncrement" erhöht die Nummer des Configuration Items, die System-ID, die Klassen-ID und des benutzen Zählers. Das Format ist "SystemID.ConfigItemClassID.Counter", bspw. 1205000004, 1205000005.';
    $Self->{Translation}->{'Set the incident state of a CI automatically when a Ticket is Linked to a CI.'} =
        'Settzt den Vorfallstatus eines Configuration Items automatisch, wenn ein Ticket mit einem Configuration Item verknüpft wird.';
    $Self->{Translation}->{'Sets the deployment state in the configuration item bulk screen of the agent interface.'} =
        'Setzt den Verwendungsstatus für die Funktion "Sammelaktion" für Configuration Items im Agenten-Interace.';
    $Self->{Translation}->{'Sets the incident state in the configuration item bulk screen of the agent interface.'} =
        'Setzt den Verwendungsstatus für die Funktion "Sammelaktion" für Configuration Items im Agenten-Interace.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        'Zeigt eine Verknüpfung im Menü, die es erlaubt ein Configuration Item mit einem anderen Objekt in der Detailansicht des Configuration Items des Agenten-Interface zu verknüpfen.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the configuration item overview of the agent interface.'} =
        'Zeigt im Menü der Configuration Item-Übersicht die Verknüpfung zur Historie eines Configuration Items.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        'Zeigt im Menü der Configuration Item-Detailansicht die Verknüpfung zur Historie eines Configuration Items.';
    $Self->{Translation}->{'Shows a link in the menu to delete a configuration item in its zoom view of the agent interface.'} =
        'Zeigt im Menü der Detailansicht eines Configuration Items die Verknüpfung zum Löschen eines Configuration Items.';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the configuration item overview of the agent interface.'} =
        'Zeigt im Menü der Configuration Item-Übersicht die Verknüpfung zum Duplizieren eines Configuration Items.';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        'Zeigt im Menü der Detailansicht eines Configuration Items die Verknüpfung zum Duplizieren eines Configuration Items.';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        'Zeigt im Menü der Detailansicht eines Configuration Items die Verknüpfung zum Bearbeiten eines Configuration Items.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuration item zoom view of the agent interface.'} =
        'Zeigt im Menü der Detailansicht eines Configuration Item eine Verknüpfung zum Zurückgehen auf die vorherige Ansicht.';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        'Zeigt im Menü der Detailansicht eines Configuration Items die Verknüpfung zum Drucken eines Configuration Items.';
    $Self->{Translation}->{'Shows a link in the menu to zoom into a configuration item in the configuration item overview of the agent interface.'} =
        'Zeigt eine Verknüpfung im Menü der Ansicht "Configuration Item-Übersicht", um zur Detailansicht des Configuration Items zu gelangen.';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        'Zeigt die Configuration Item-Historie (umgekehrte Reihenfolge) im Agenten-Interface an.';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        'Der Identifikator für ein Configuration Item, bspw. "ConfigItem#" , "MeinConfigItem#". Der Standard ist "ConfigItem#".';
    $Self->{Translation}->{'class'} = 'Klasse';
    $Self->{Translation}->{'global'} = 'Global';
    $Self->{Translation}->{'postproductive'} = 'Post-produktiv';
    $Self->{Translation}->{'preproductive'} = 'Pre-produktiv';
    $Self->{Translation}->{'productive'} = 'Produktiv';


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
