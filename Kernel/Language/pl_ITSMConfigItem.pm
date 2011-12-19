# --
# Kernel/Language/pl_ITSMConfigItem.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: pl_ITSMConfigItem.pm,v 1.10.2.1 2011-12-19 16:21:20 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pl_ITSMConfigItem;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAITSMConfigItem
    $Self->{Translation}->{'Address'} = 'Adres';
    $Self->{Translation}->{'Admin Tool'} = 'Narzêdzie administratorskie';
    $Self->{Translation}->{'Backup Device'} = 'Urz±dzenie do backupu';
    $Self->{Translation}->{'Beamer'} = '';
    $Self->{Translation}->{'Building'} = 'Budynek';
    $Self->{Translation}->{'CIHistory::ConfigItemCreate'} = 'Nowy CI (ID=%s)';
    $Self->{Translation}->{'CIHistory::ConfigItemDelete'} = 'Usuniêcie CI (ID=%s)';
    $Self->{Translation}->{'CIHistory::DefinitionUpdate'} = 'Aktualizacja definicji CI (ID=%s)';
    $Self->{Translation}->{'CIHistory::DeploymentStateUpdate'} = 'Aktualizacja stanu wdro¿enia CI (nowy=%s; stary=%s)';
    $Self->{Translation}->{'CIHistory::IncidentStateUpdate'} = 'Aktualizacja stanu zdarzenia (nowy=%s; stary=%s)';
    $Self->{Translation}->{'CIHistory::LinkAdd'} = 'Dodany link do %s (Typ=%s)';
    $Self->{Translation}->{'CIHistory::LinkDelete'} = 'Usuniêty link do %s (Typ=%s)';
    $Self->{Translation}->{'CIHistory::NameUpdate'} = 'Aktualizacja nazwy (nowa=%s; stara=%s)';
    $Self->{Translation}->{'CIHistory::ValueUpdate'} = 'Aktualizacja warto¶ci atrybutu %s z "%s" na "%s"';
    $Self->{Translation}->{'CIHistory::VersionCreate'} = 'Utworzenie nowej wersji (ID=%s)';
    $Self->{Translation}->{'CIHistory::VersionDelete'} = 'Usuniêcie wersji %s';
    $Self->{Translation}->{'CPU'} = 'Procesor';
    $Self->{Translation}->{'Camera'} = 'Kamera';
    $Self->{Translation}->{'Capacity'} = 'Pojemno¶æ';
    $Self->{Translation}->{'Change Definition'} = 'Definicja zmiany';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = 'Zmiana definicji nie powiod³a siê! Szczegó³y znajduj± siê w logu systemu.';
    $Self->{Translation}->{'Client Application'} = 'Aplikacja kliencka';
    $Self->{Translation}->{'Client OS'} = 'System kliencki';
    $Self->{Translation}->{'Concurrent Users'} = 'Jednocze¶ni u¿ytkownicy';
    $Self->{Translation}->{'Config Item-Area'} = 'CI-Obszar';
    $Self->{Translation}->{'Config Items available'} = 'Dostêpne CI';
    $Self->{Translation}->{'Config Items shown'} = 'Wy¶wietlone CI';
    $Self->{Translation}->{'CMDB'} = 'CMDB';
    $Self->{Translation}->{'Demo'} = 'Demo';
    $Self->{Translation}->{'Desktop'} = 'Desktop';
    $Self->{Translation}->{'Developer Licence'} = 'Licencja developerska';
    $Self->{Translation}->{'Docking Station'} = 'Stacja dokuj±ca';
    $Self->{Translation}->{'Duplicate'} = 'Duplikat';
    $Self->{Translation}->{'Embedded'} = 'Osadzony';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'Puste pola znaczaj±, ¿e zatrzymane bêd± bie¿±ce warto¶ci';
    $Self->{Translation}->{'Enterprise Licence'} = 'Licencja Enterprise';
    $Self->{Translation}->{'Expiration Date'} = 'Data wyga¶niêcia';
    $Self->{Translation}->{'Expired'} = 'Wygas³o';
    $Self->{Translation}->{'FQDN'} = 'Nazwa FQDN';
    $Self->{Translation}->{'Floor'} = 'Piêtro';
    $Self->{Translation}->{'Freeware'} = 'Freeware';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Gateway'} = 'Brama';
    $Self->{Translation}->{'Graphic Adapter'} = 'Karta graficzna';
    $Self->{Translation}->{'Hard Disk'} = 'Dysk twardy';
    $Self->{Translation}->{'Hard Disk::Capacity'} = 'Pojemno¶æ dysku twardego';
    $Self->{Translation}->{'Hide Versions'} = 'Ukryj wersje';
    $Self->{Translation}->{'IP Address'} = 'Adres IP';
    $Self->{Translation}->{'IP over DHCP'} = 'Adres IP z DHCP';
    $Self->{Translation}->{'IT Facility'} = 'Dzia³ IT';
    $Self->{Translation}->{'Inactive'} = 'Nieaktywny';
    $Self->{Translation}->{'Incident'} = 'Zdarzenie';
    $Self->{Translation}->{'Install Date'} = 'Data instalacji';
    $Self->{Translation}->{'Keybord'} = 'Klawiatura';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'Laptop'} = 'Laptop';
    $Self->{Translation}->{'Last Change'} = 'Ostatnia zmiana';
    $Self->{Translation}->{'Licence Key'} = 'Klucz licencyjny';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = 'Klucz licencyjny::Data wyga¶niêcia';
    $Self->{Translation}->{'Licence Key::Quantity'} = 'Klucz licencyjny::Ilo¶æ';
    $Self->{Translation}->{'Licence Type'} = 'Typ licencji';
    $Self->{Translation}->{'Maintenance'} = 'Utrzymanie';
    $Self->{Translation}->{'Maximum number of one element'} = 'Maksymalna liczba wyst±pieñ pojednyczego elemetntu';
    $Self->{Translation}->{'Media'} = 'No¶nik';
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
    $Self->{Translation}->{'Other Equipment'} = 'Pozosta³e wyposa¿enie';
    $Self->{Translation}->{'Outlet'} = 'Punkt sprzeda¿y';
    $Self->{Translation}->{'PCMCIA Card'} = 'Karta PCMCIA';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Per Node'} = 'Na urz±dzenie';
    $Self->{Translation}->{'Per Processor'} = 'Na procesor';
    $Self->{Translation}->{'Per Server'} = 'Na serwer';
    $Self->{Translation}->{'Per User'} = 'Na u¿ytkownika';
    $Self->{Translation}->{'Phone 1'} = 'Telefon 1';
    $Self->{Translation}->{'Phone 2'} = 'Telefon 2';
    $Self->{Translation}->{'Pilot'} = 'Pilota¿';
    $Self->{Translation}->{'Planned'} = 'Planowany';
    $Self->{Translation}->{'Printer'} = 'Drukarka';
    $Self->{Translation}->{'Production'} = 'Produkcja';
    $Self->{Translation}->{'Quantity'} = 'Ilo¶æ';
    $Self->{Translation}->{'Rack'} = 'Rack';
    $Self->{Translation}->{'Ram'} = 'RAM';
    $Self->{Translation}->{'Repair'} = 'Naprawa';
    $Self->{Translation}->{'Retired'} = 'Wycofany';
    $Self->{Translation}->{'Review'} = 'Przegl±d';
    $Self->{Translation}->{'Room'} = 'Pokój';
    $Self->{Translation}->{'Router'} = 'Ruter';
    $Self->{Translation}->{'Scanner'} = 'Skaner';
    $Self->{Translation}->{'Search Config Items'} = 'Szukaj CI';
    $Self->{Translation}->{'Security Device'} = 'Urz±dzenie zabezpieczaj±ce';
    $Self->{Translation}->{'Serial Number'} = 'Numer seryjny';
    $Self->{Translation}->{'Server'} = 'Serwer';
    $Self->{Translation}->{'Server Application'} = 'Aplikacja serwerowa';
    $Self->{Translation}->{'Server OS'} = 'System serwerowy';
    $Self->{Translation}->{'Show Versions'} = 'Poka¿ wersje';
    $Self->{Translation}->{'Single Licence'} = 'Pojedyñcza licencja';
    $Self->{Translation}->{'Subnet Mask'} = 'Maska sieci';
    $Self->{Translation}->{'Switch'} = 'Switch';
    $Self->{Translation}->{'Telco'} = 'Telco';
    $Self->{Translation}->{'Test/QA'} = 'Test/QA';
    $Self->{Translation}->{'The deployment state of this config item'} = 'Stan wdro¿enia tego CI';
    $Self->{Translation}->{'The incident state of this config item'} = 'Stan zdarzenia tego CI';
    $Self->{Translation}->{'Time Restricted'} = 'Czasowo ograniczona';
    $Self->{Translation}->{'USB Device'} = 'Urz±dzenie USB';
    $Self->{Translation}->{'Unlimited'} = 'Bez limitu';
    $Self->{Translation}->{'User Tool'} = 'Narzêdzie u¿ytkownika';
    $Self->{Translation}->{'Volume Licence'} = 'Zbiorcza licencja';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'WLAN Access Point'} = 'Access Point';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Data wyga¶niêcia gwarancji';
    $Self->{Translation}->{'Workplace'} = 'Miejsce pracy';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Zarz±dzanie CI';
    $Self->{Translation}->{'Change class definition'} = 'Zmieñ definicjê klasy';
    $Self->{Translation}->{'Config Item'} = 'CI';
    $Self->{Translation}->{'ITSM ConfigItem'} = 'CI';
    $Self->{Translation}->{'Class'} = 'Klasa';
    $Self->{Translation}->{'Definition'} = 'Definicja';
    $Self->{Translation}->{'Hardware'} = 'Sprzêt';
    $Self->{Translation}->{'Computer'} = 'Komputer';
    $Self->{Translation}->{'Network'} = 'Sieæ';
    $Self->{Translation}->{'Software'} = 'Oprogramowanie';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Filter for Classes'} = 'Filtr dla klas';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'Zaznacz klasê na li¶cie aby utworzyæ nowe CI.';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'Nazwa tego CI';
    $Self->{Translation}->{'Deployment State'} = 'Stan wdro¿enia';
    $Self->{Translation}->{'Incident State'} = 'Stan zdarzenia';

    # Template: AgentITSMConfigItemHistory

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Ustawienia kontekstu';
    $Self->{Translation}->{'Config Items per page'} = 'Liczba CI na stronie';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'Deployment State Type'} = 'Typ stanu wdro¿enia';
    $Self->{Translation}->{'Current Incident State'} = 'Aktualny stan';
    $Self->{Translation}->{'Current Incident State Type'} = 'Aktualny typ stanu';
    $Self->{Translation}->{'Last Changed'} = 'Ostatnia zmiana';

    # Template: AgentITSMConfigItemPrint
    $Self->{Translation}->{'ConfigItem'} = 'CI';
    $Self->{Translation}->{'ConfigItem-Info'} = 'CI-Info';
    $Self->{Translation}->{'Current Deployment State'} = 'Aktualny stan wdro¿enia';
    $Self->{Translation}->{'Last changed'} = 'Ostatnio zmienione';
    $Self->{Translation}->{'Last changed by'} = 'Ostatnio zmienione przez';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Search-Template'} = 'Szukaj-szablon';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Uwzglêdniæ poprzednie wersje?';
    $Self->{Translation}->{'Config Item Search Result: Class'} = 'Wynik wyszukiwania CI: klasa';

    # Template: AgentITSMConfigItemSearchResultPrint
    $Self->{Translation}->{'CreateTime'} = 'Czas utworzenia';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'CI';
    $Self->{Translation}->{'Show one version'} = 'Poka¿ jedn± wersjê!';
    $Self->{Translation}->{'Show all versions'} = 'Poka¿ wszystkie wersje';
    $Self->{Translation}->{'Version Incident State'} = 'Stan zdarzenia wersji';
    $Self->{Translation}->{'Version Number'} = 'Numer wersji';
    $Self->{Translation}->{'Created By'} = 'Utworzone przez';
    $Self->{Translation}->{'Changed On'} = 'Zmienione';
    $Self->{Translation}->{'Resize'} = 'Zmieñ rozmiar';
    $Self->{Translation}->{'Show or hide the content.'} = 'Poka¿ ukryt± tre¶æ.';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Szczegó³y wersji CI';
    $Self->{Translation}->{'Property'} = 'W³a¶ciwo¶æ';
    $Self->{Translation}->{'Configuration Item Information'} = 'Informacje o CI';

    # SysConfig
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} = '';
    $Self->{Translation}->{'Configuration Item Limit'} = 'Limit liczby CI';
    $Self->{Translation}->{'Configuration Item limit per page'} = 'Limit liczby CI na stronê';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} = '';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = 'Tworzenie i zarz±dzanie definicjami elementów konfiguracji.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} = '';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} = '';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected'} = '';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} = '';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = '';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} = '';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} = '';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} = '';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} = '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} = '';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} = '';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuraton item zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} = '';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} = '';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #

}

1;
