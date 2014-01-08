# --
# Kernel/Language/pl_ITSMConfigItem.pm - translation file
# Copyright (C) 2001-2014 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pl_ITSMConfigItem;

use strict;
use warnings;

sub Data {
    my $Self = shift;

    # Template: AAAITSMConfigItem
    $Self->{Translation}->{'Address'} = 'Adres';
    $Self->{Translation}->{'Admin Tool'} = 'Narzędzie administratorskie';
    $Self->{Translation}->{'Backup Device'} = 'Urządzenie do backupu';
    $Self->{Translation}->{'Beamer'} = '';
    $Self->{Translation}->{'Building'} = 'Budynek';
    $Self->{Translation}->{'CIHistory::ConfigItemCreate'} = 'Nowy CI (ID=%s)';
    $Self->{Translation}->{'CIHistory::ConfigItemDelete'} = 'Usunięcie CI (ID=%s)';
    $Self->{Translation}->{'CIHistory::DefinitionUpdate'} = 'Aktualizacja definicji CI (ID=%s)';
    $Self->{Translation}->{'CIHistory::DeploymentStateUpdate'} = 'Aktualizacja stanu wdrożenia CI (nowy=%s; stary=%s)';
    $Self->{Translation}->{'CIHistory::IncidentStateUpdate'} = 'Aktualizacja stanu zdarzenia (nowy=%s; stary=%s)';
    $Self->{Translation}->{'CIHistory::LinkAdd'} = 'Dodany link do %s (Typ=%s)';
    $Self->{Translation}->{'CIHistory::LinkDelete'} = 'Usunięty link do %s (Typ=%s)';
    $Self->{Translation}->{'CIHistory::NameUpdate'} = 'Aktualizacja nazwy (nowa=%s; stara=%s)';
    $Self->{Translation}->{'CIHistory::ValueUpdate'} = 'Aktualizacja wartości atrybutu %s z "%s" na "%s"';
    $Self->{Translation}->{'CIHistory::VersionCreate'} = 'Utworzenie nowej wersji (ID=%s)';
    $Self->{Translation}->{'CIHistory::VersionDelete'} = 'Usunięcie wersji %s';
    $Self->{Translation}->{'CIHistory::AttachmentAdd'} = 'Utworzenie załącznika (%s)';
    $Self->{Translation}->{'CIHistory::AttachmentDelete'} = 'Usunięcie załącznika (%s)';
    $Self->{Translation}->{'CPU'} = 'Procesor';
    $Self->{Translation}->{'Camera'} = 'Kamera';
    $Self->{Translation}->{'Capacity'} = 'Pojemność';
    $Self->{Translation}->{'Change Definition'} = 'Definicja zmiany';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = 'Zmiana definicji nie powiodła się! Szczegóły znajdują się w logu systemu.';
    $Self->{Translation}->{'Client Application'} = 'Aplikacja kliencka';
    $Self->{Translation}->{'Client OS'} = 'System kliencki';
    $Self->{Translation}->{'Concurrent Users'} = 'Jednocześni użytkownicy';
    $Self->{Translation}->{'Config Item-Area'} = 'CI-Obszar';
    $Self->{Translation}->{'Config Items available'} = 'Dostępne CI';
    $Self->{Translation}->{'Config Items shown'} = 'Wyświetlone CI';
    $Self->{Translation}->{'CMDB'} = 'CMDB';
    $Self->{Translation}->{'Demo'} = 'Demo';
    $Self->{Translation}->{'Desktop'} = 'Desktop';
    $Self->{Translation}->{'Developer Licence'} = 'Licencja developerska';
    $Self->{Translation}->{'Docking Station'} = 'Stacja dokująca';
    $Self->{Translation}->{'Duplicate'} = 'Duplikat';
    $Self->{Translation}->{'Embedded'} = 'Osadzony';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'Puste pola znaczają, że zatrzymane będą bieżące wartości';
    $Self->{Translation}->{'Enterprise Licence'} = 'Licencja Enterprise';
    $Self->{Translation}->{'Expiration Date'} = 'Data wygaśnięcia';
    $Self->{Translation}->{'Expired'} = 'Wygasło';
    $Self->{Translation}->{'FQDN'} = 'Nazwa FQDN';
    $Self->{Translation}->{'Floor'} = 'Piętro';
    $Self->{Translation}->{'Freeware'} = 'Freeware';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Gateway'} = 'Brama';
    $Self->{Translation}->{'Graphic Adapter'} = 'Karta graficzna';
    $Self->{Translation}->{'Hard Disk'} = 'Dysk twardy';
    $Self->{Translation}->{'Hard Disk::Capacity'} = 'Pojemność dysku twardego';
    $Self->{Translation}->{'Hide Versions'} = 'Ukryj wersje';
    $Self->{Translation}->{'IP Address'} = 'Adres IP';
    $Self->{Translation}->{'IP over DHCP'} = 'Adres IP z DHCP';
    $Self->{Translation}->{'IT Facility'} = 'Dział IT';
    $Self->{Translation}->{'Incident'} = 'Zdarzenie';
    $Self->{Translation}->{'Install Date'} = 'Data instalacji';
    $Self->{Translation}->{'Keybord'} = 'Klawiatura';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'Laptop'} = 'Laptop';
    $Self->{Translation}->{'Last Change'} = 'Ostatnia zmiana';
    $Self->{Translation}->{'Licence Key'} = 'Klucz licencyjny';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = 'Klucz licencyjny::Data wygaśnięcia';
    $Self->{Translation}->{'Licence Key::Quantity'} = 'Klucz licencyjny::Ilość';
    $Self->{Translation}->{'Licence Type'} = 'Typ licencji';
    $Self->{Translation}->{'Maintenance'} = 'Utrzymanie';
    $Self->{Translation}->{'Maximum number of one element'} = 'Maksymalna liczba wystąpień pojednyczego elemetntu';
    $Self->{Translation}->{'Media'} = 'Nośnik';
    $Self->{Translation}->{'Middleware'} = 'Middleware';
    $Self->{Translation}->{'Model'} = 'Model';
    $Self->{Translation}->{'Modem'} = 'Modem';
    $Self->{Translation}->{'Monitor'} = 'Monitor';
    $Self->{Translation}->{'Mouse'} = 'Myszka';
    $Self->{Translation}->{'Network Adapter'} = 'Karta sieciowa';
    $Self->{Translation}->{'Network Adapter::IP Address'} = 'Karta sieciowa::Adres IP';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = 'Karta sieciowa::Adres IP z DHCP';
    $Self->{Translation}->{'Network Address'} = 'Adres sieciowy';
    $Self->{Translation}->{'Network Address::Gateway'} = 'Adres sieciowy::Brama';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = 'Adres sieciowy::Maska sieci';
    $Self->{Translation}->{'Open Source'} = 'Open source';
    $Self->{Translation}->{'Operating System'} = 'System operacyjny';
    $Self->{Translation}->{'Operational'} = 'Operacyjny';
    $Self->{Translation}->{'Other'} = 'Inne';
    $Self->{Translation}->{'Other Equipment'} = 'Pozostałe wyposażenie';
    $Self->{Translation}->{'Outlet'} = 'Punkt sprzedaży';
    $Self->{Translation}->{'PCMCIA Card'} = 'Karta PCMCIA';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Per Node'} = 'Na urządzenie';
    $Self->{Translation}->{'Per Processor'} = 'Na procesor';
    $Self->{Translation}->{'Per Server'} = 'Na serwer';
    $Self->{Translation}->{'Per User'} = 'Na użytkownika';
    $Self->{Translation}->{'Phone 1'} = 'Telefon 1';
    $Self->{Translation}->{'Phone 2'} = 'Telefon 2';
    $Self->{Translation}->{'Pilot'} = 'Pilotaż';
    $Self->{Translation}->{'Planned'} = 'Planowany';
    $Self->{Translation}->{'Printer'} = 'Drukarka';
    $Self->{Translation}->{'Production'} = 'Produkcja';
    $Self->{Translation}->{'Quantity'} = 'Ilość';
    $Self->{Translation}->{'Rack'} = 'Rack';
    $Self->{Translation}->{'Ram'} = 'RAM';
    $Self->{Translation}->{'Repair'} = 'Naprawa';
    $Self->{Translation}->{'Retired'} = 'Wycofany';
    $Self->{Translation}->{'Review'} = 'Przegląd';
    $Self->{Translation}->{'Room'} = 'Pokój';
    $Self->{Translation}->{'Router'} = 'Ruter';
    $Self->{Translation}->{'Scanner'} = 'Skaner';
    $Self->{Translation}->{'Search Config Items'} = 'Szukaj CI';
    $Self->{Translation}->{'Security Device'} = 'Urządzenie zabezpieczające';
    $Self->{Translation}->{'Serial Number'} = 'Numer seryjny';
    $Self->{Translation}->{'Server'} = 'Serwer';
    $Self->{Translation}->{'Server Application'} = 'Aplikacja serwerowa';
    $Self->{Translation}->{'Server OS'} = 'System serwerowy';
    $Self->{Translation}->{'Show Versions'} = 'Pokaż wersje';
    $Self->{Translation}->{'Single Licence'} = 'Pojedyńcza licencja';
    $Self->{Translation}->{'Subnet Mask'} = 'Maska sieci';
    $Self->{Translation}->{'Switch'} = 'Switch';
    $Self->{Translation}->{'Telco'} = 'Telco';
    $Self->{Translation}->{'Test/QA'} = 'Test/QA';
    $Self->{Translation}->{'The deployment state of this config item'} = 'Stan wdrożenia tego CI';
    $Self->{Translation}->{'The incident state of this config item'} = 'Stan zdarzenia tego CI';
    $Self->{Translation}->{'Time Restricted'} = 'Czasowo ograniczona';
    $Self->{Translation}->{'USB Device'} = 'Urządzenie USB';
    $Self->{Translation}->{'Unlimited'} = 'Bez limitu';
    $Self->{Translation}->{'User Tool'} = 'Narzędzie użytkownika';
    $Self->{Translation}->{'Volume Licence'} = 'Zbiorcza licencja';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'WLAN Access Point'} = 'Access Point';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Data wygaśnięcia gwarancji';
    $Self->{Translation}->{'Workplace'} = 'Miejsce pracy';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Zarządzanie CI';
    $Self->{Translation}->{'Change class definition'} = 'Zmień definicję klasy';
    $Self->{Translation}->{'Config Item'} = 'CI';
    $Self->{Translation}->{'Class'} = 'Klasa';
    $Self->{Translation}->{'Definition'} = 'Definicja';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Filter for Classes'} = 'Filtr dla klas';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'Zaznacz klasę na liście aby utworzyć nowe CI.';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'Nazwa tego CI';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        'Nazwa jest już używana przez CI o następujących numerach: %s';
    $Self->{Translation}->{'Deployment State'} = 'Stan wdrożenia';
    $Self->{Translation}->{'Incident State'} = 'Stan zdarzenia';

    # Template: AgentITSMConfigItemHistory

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Ustawienia kontekstu';
    $Self->{Translation}->{'Config Items per page'} = 'Liczba CI na stronie';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'Deployment State Type'} = 'Typ stanu wdrożenia';
    $Self->{Translation}->{'Current Incident State'} = 'Aktualny stan';
    $Self->{Translation}->{'Current Incident State Type'} = 'Aktualny typ stanu';
    $Self->{Translation}->{'Last changed'} = 'Ostatnio zmienione';

    # Template: AgentITSMConfigItemPrint
    $Self->{Translation}->{'ConfigItem'} = 'CI';
    $Self->{Translation}->{'ConfigItem-Info'} = 'CI-Info';
    $Self->{Translation}->{'Current Deployment State'} = 'Aktualny stan wdrożenia';
    $Self->{Translation}->{'Last changed by'} = 'Ostatnio zmienione przez';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Create New Template'} = '';
    $Self->{Translation}->{'Run Search'} = '';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Uwzględnić poprzednie wersje?';

    # Template: AgentITSMConfigItemSearchResultPrint
    $Self->{Translation}->{'CreateTime'} = 'Czas utworzenia';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'CI';
    $Self->{Translation}->{'Configuration Item Information'} = 'Informacje o CI';
    $Self->{Translation}->{'Show one version'} = 'Pokaż jedną wersję!';
    $Self->{Translation}->{'Show all versions'} = 'Pokaż wszystkie wersje';
    $Self->{Translation}->{'Version Incident State'} = 'Stan';
    $Self->{Translation}->{'Version Number'} = 'Wersja';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Szczegóły wersji CI';
    $Self->{Translation}->{'Property'} = 'Właściwość';

    # SysConfig
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        '';
    $Self->{Translation}->{'Config Items'} = '';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        '';
    $Self->{Translation}->{'Configuration Item Limit'} = 'Limit liczby CI';
    $Self->{Translation}->{'Configuration Item limit per page'} = 'Limit liczby CI na stronę';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        '';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = 'Tworzenie i zarządzanie definicjami elementów konfiguracji.';
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
    $Self->{Translation}->{'Changed On'} = 'Zmienione';
    $Self->{Translation}->{'Computer'} = 'Komputer';
    $Self->{Translation}->{'Config Item Search Result: Class'} = 'Wynik wyszukiwania CI: klasa';
    $Self->{Translation}->{'Created By'} = 'Utworzone przez';
    $Self->{Translation}->{'Hardware'} = 'Sprzęt';
    $Self->{Translation}->{'ITSM ConfigItem'} = 'CI';
    $Self->{Translation}->{'Network'} = 'Sieć';
    $Self->{Translation}->{'Search-Template'} = 'Szukaj-szablon';
    $Self->{Translation}->{'Software'} = 'Oprogramowanie';

}

1;
