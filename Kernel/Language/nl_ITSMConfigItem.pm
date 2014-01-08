# --
# Kernel/Language/nl_ITSMConfigItem.pm - translation file
# Copyright (C) 2001-2014 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::nl_ITSMConfigItem;

use strict;
use warnings;

sub Data {
    my $Self = shift;

    # Template: AAAITSMConfigItem
    $Self->{Translation}->{'Address'} = 'Adres';
    $Self->{Translation}->{'Admin Tool'} = 'Admin Tool';
    $Self->{Translation}->{'Backup Device'} = 'Backupapparaat';
    $Self->{Translation}->{'Beamer'} = 'Beamer';
    $Self->{Translation}->{'Building'} = 'Gebouw';
    $Self->{Translation}->{'CIHistory::ConfigItemCreate'} = 'Nieuw configuratie-item (ID=%s)';
    $Self->{Translation}->{'CIHistory::ConfigItemDelete'} = 'Configuratie-item (ID=%s) verwijderd';
    $Self->{Translation}->{'CIHistory::DefinitionUpdate'} = 'ConfigItems\' definitie bijgewerkt (ID=%s)';
    $Self->{Translation}->{'CIHistory::DeploymentStateUpdate'} = 'Status bijgewerkt (nieuw=%s; oud=%s)';
    $Self->{Translation}->{'CIHistory::IncidentStateUpdate'} = 'Incident-status bijgewerkt (nieuw=%s; oud=%s)';
    $Self->{Translation}->{'CIHistory::LinkAdd'} = 'Koppeling naar %s (type=%s) toegevoegd';
    $Self->{Translation}->{'CIHistory::LinkDelete'} = 'Koppeling naar %s (type=%s) verwijderd';
    $Self->{Translation}->{'CIHistory::NameUpdate'} = 'Naam bijgewerkt (nieuw=%s; oud=%s)';
    $Self->{Translation}->{'CIHistory::ValueUpdate'} = 'Attribuut %s bijgewerkt van "%s" naar "%s"';
    $Self->{Translation}->{'CIHistory::VersionCreate'} = 'Nieuwe versie (ID=%s)';
    $Self->{Translation}->{'CIHistory::VersionDelete'} = 'Versie %s verwijderd';
    $Self->{Translation}->{'CIHistory::AttachmentAdd'} = '';
    $Self->{Translation}->{'CIHistory::AttachmentDelete'} = '';
    $Self->{Translation}->{'CPU'} = 'CPU';
    $Self->{Translation}->{'Camera'} = 'Camera';
    $Self->{Translation}->{'Capacity'} = 'Capaciteit';
    $Self->{Translation}->{'Change Definition'} = 'Definitie veranderen';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = 'Definitiewijziging mislukt! Zie de System Log voor details.';
    $Self->{Translation}->{'Client Application'} = 'Clienttoepassing';
    $Self->{Translation}->{'Client OS'} = 'Client besturingssysteem';
    $Self->{Translation}->{'Concurrent Users'} = 'Gelijktijdige gebruikers';
    $Self->{Translation}->{'Config Item-Area'} = 'Configuratie-item-gebied';
    $Self->{Translation}->{'Config Items available'} = 'Beschikbare configuratie-items';
    $Self->{Translation}->{'Config Items shown'} = 'Getoonde configuratie-items';
    $Self->{Translation}->{'CMDB'} = 'CMDB';
    $Self->{Translation}->{'Demo'} = 'Demo';
    $Self->{Translation}->{'Desktop'} = 'Desktop';
    $Self->{Translation}->{'Developer Licence'} = 'Ontwikkelaarslicentie';
    $Self->{Translation}->{'Docking Station'} = 'Docking station';
    $Self->{Translation}->{'Duplicate'} = 'Dupliceren';
    $Self->{Translation}->{'Embedded'} = 'Embedded';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = '';
    $Self->{Translation}->{'Enterprise Licence'} = 'Enterpriselicentie';
    $Self->{Translation}->{'Expiration Date'} = 'Expiratiedatum';
    $Self->{Translation}->{'Expired'} = 'Verlopen';
    $Self->{Translation}->{'FQDN'} = 'FQDN';
    $Self->{Translation}->{'Floor'} = 'Etage';
    $Self->{Translation}->{'Freeware'} = 'Freeware';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Gateway'} = 'Gateway';
    $Self->{Translation}->{'Graphic Adapter'} = 'Videokaart';
    $Self->{Translation}->{'Hard Disk'} = 'Harde schijf';
    $Self->{Translation}->{'Hard Disk::Capacity'} = 'Harde schijf::Capaciteit';
    $Self->{Translation}->{'Hide Versions'} = 'Verberg versies';
    $Self->{Translation}->{'IP Address'} = 'IP adres';
    $Self->{Translation}->{'IP over DHCP'} = 'IP via DHCP';
    $Self->{Translation}->{'IT Facility'} = 'Serverruimte';
    $Self->{Translation}->{'Inactive'} = 'Inactief';
    $Self->{Translation}->{'Incident'} = 'Incident';
    $Self->{Translation}->{'Install Date'} = 'Installatiedatum';
    $Self->{Translation}->{'Keybord'} = 'Toetsenbord';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'Laptop'} = 'Laptop';
    $Self->{Translation}->{'Last Change'} = 'Laatste wijziging';
    $Self->{Translation}->{'Licence Key'} = 'Licentiesleutel';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = 'Licentiesleutel::Expiratiedatum';
    $Self->{Translation}->{'Licence Key::Quantity'} = 'Licentiesleutel::Hoeveelheid';
    $Self->{Translation}->{'Licence Type'} = 'Licentietype';
    $Self->{Translation}->{'Maintenance'} = 'In onderhoud';
    $Self->{Translation}->{'Maximum number of one element'} = 'Maximale hoeveelheid';
    $Self->{Translation}->{'Media'} = 'Media';
    $Self->{Translation}->{'Middleware'} = 'Middleware';
    $Self->{Translation}->{'Model'} = 'Model';
    $Self->{Translation}->{'Modem'} = 'Modem';
    $Self->{Translation}->{'Monitor'} = 'Monitor';
    $Self->{Translation}->{'Mouse'} = 'Muis';
    $Self->{Translation}->{'Network Adapter'} = 'Netwerk adapter';
    $Self->{Translation}->{'Network Adapter::IP Address'} = 'Netwerk adapter::IP adres';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = 'Netwerk adapter::IP via DHCP';
    $Self->{Translation}->{'Network Address'} = 'Netwerkadres';
    $Self->{Translation}->{'Network Address::Gateway'} = 'Netwerkadres::Gateway';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = 'Netwerkadres::Subnet Mask';
    $Self->{Translation}->{'Open Source'} = 'Open Source';
    $Self->{Translation}->{'Operating System'} = 'Besturingssysteem';
    $Self->{Translation}->{'Operational'} = 'Operationeel';
    $Self->{Translation}->{'Other'} = 'Overige';
    $Self->{Translation}->{'Other Equipment'} = 'Overige uitrusting';
    $Self->{Translation}->{'Outlet'} = 'Aansluiting';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA kaart';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Per Node'} = 'Per node';
    $Self->{Translation}->{'Per Processor'} = 'Per CPU';
    $Self->{Translation}->{'Per Server'} = 'Per server';
    $Self->{Translation}->{'Per User'} = 'Per gebruiker';
    $Self->{Translation}->{'Phone 1'} = 'Telefoon 1';
    $Self->{Translation}->{'Phone 2'} = 'Telefoon 2';
    $Self->{Translation}->{'Pilot'} = 'Pilot';
    $Self->{Translation}->{'Planned'} = 'Geplanned';
    $Self->{Translation}->{'Printer'} = 'Printer';
    $Self->{Translation}->{'Production'} = 'Produktie';
    $Self->{Translation}->{'Quantity'} = 'Hoeveelheid';
    $Self->{Translation}->{'Rack'} = 'Rack';
    $Self->{Translation}->{'Ram'} = 'RAM';
    $Self->{Translation}->{'Repair'} = 'In reparatie';
    $Self->{Translation}->{'Retired'} = 'Uitgefaseerd';
    $Self->{Translation}->{'Review'} = 'Review';
    $Self->{Translation}->{'Room'} = 'Kamer';
    $Self->{Translation}->{'Router'} = 'Router';
    $Self->{Translation}->{'Scanner'} = 'Scanner';
    $Self->{Translation}->{'Search Config Items'} = 'Zoek Configuratie-items';
    $Self->{Translation}->{'Security Device'} = 'Security device';
    $Self->{Translation}->{'Serial Number'} = 'Serienummer';
    $Self->{Translation}->{'Server'} = 'Server';
    $Self->{Translation}->{'Server Application'} = 'Servertoepassing';
    $Self->{Translation}->{'Server OS'} = 'Server besturingssysteem';
    $Self->{Translation}->{'Show Versions'} = 'Toon versies';
    $Self->{Translation}->{'Single Licence'} = 'Single Licence';
    $Self->{Translation}->{'Subnet Mask'} = 'Subnet Mask';
    $Self->{Translation}->{'Switch'} = 'Switch';
    $Self->{Translation}->{'Telco'} = 'Telco';
    $Self->{Translation}->{'Test/QA'} = 'Test/QA';
    $Self->{Translation}->{'The deployment state of this config item'} = 'De status van dit configuratie-item';
    $Self->{Translation}->{'The incident state of this config item'} = 'De incidentstatus van dit configuratie-item';
    $Self->{Translation}->{'Time Restricted'} = 'Time restricted';
    $Self->{Translation}->{'USB Device'} = 'USB apparaat';
    $Self->{Translation}->{'Unlimited'} = 'Ongelimiteerd';
    $Self->{Translation}->{'User Tool'} = 'User Tool';
    $Self->{Translation}->{'Volume Licence'} = 'Volume Licentie';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'WLAN Access Point'} = 'WLAN Access Point';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Einddatum garantie';
    $Self->{Translation}->{'Workplace'} = 'Werkplek';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Configuratie-item beheer';
    $Self->{Translation}->{'Change class definition'} = 'Wijzig definitie';
    $Self->{Translation}->{'Config Item'} = 'Configuratie-item';
    $Self->{Translation}->{'Class'} = 'Klasse';
    $Self->{Translation}->{'Definition'} = 'Definitie';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Filter for Classes'} = 'Filter op klassen';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'Selecteer een klasse uit de lijst om een nieuw configuratie-item aan te maken.';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'De naam van dit configuratie-item';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        '';
    $Self->{Translation}->{'Deployment State'} = 'Status';
    $Self->{Translation}->{'Incident State'} = 'Incidentstatus';

    # Template: AgentITSMConfigItemHistory

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = '';
    $Self->{Translation}->{'Config Items per page'} = 'Aantal configuratie-items per pagina';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'Deployment State Type'} = '';
    $Self->{Translation}->{'Current Incident State'} = 'Actuele incidentstatus';
    $Self->{Translation}->{'Current Incident State Type'} = '';
    $Self->{Translation}->{'Last changed'} = 'Laaste wijziging';

    # Template: AgentITSMConfigItemPrint
    $Self->{Translation}->{'ConfigItem'} = '';
    $Self->{Translation}->{'ConfigItem-Info'} = '';
    $Self->{Translation}->{'Current Deployment State'} = 'Actuele status';
    $Self->{Translation}->{'Last changed by'} = 'Laaste wijziging door';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Create New Template'} = '';
    $Self->{Translation}->{'Run Search'} = '';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Ook in eerdere versies zoeken?';

    # Template: AgentITSMConfigItemSearchResultPrint
    $Self->{Translation}->{'CreateTime'} = '';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'Configuratie-item';
    $Self->{Translation}->{'Configuration Item Information'} = 'Configuratie-item informatie';
    $Self->{Translation}->{'Show one version'} = 'Toon één versie';
    $Self->{Translation}->{'Show all versions'} = 'Toon alle versies';
    $Self->{Translation}->{'Version Incident State'} = 'Versie Incident-status';
    $Self->{Translation}->{'Version Number'} = 'Versienummer';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Configuratie-item versie details';
    $Self->{Translation}->{'Property'} = 'Attribuut';

    # SysConfig
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        '';
    $Self->{Translation}->{'Config Items'} = 'Configuratie-items';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        '';
    $Self->{Translation}->{'Configuration Item Limit'} = '';
    $Self->{Translation}->{'Configuration Item limit per page'} = '';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        '';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = 'Aanmaken en beheren van definities voor configuratie-items.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        '';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        '';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        '';
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
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        '';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = '';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        '';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        '';
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
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuraton item zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        '';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        '';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #

}

1;
