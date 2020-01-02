# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Language::sr_Latn_ITSMConfigurationManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Upravljanje konfiguracionim stavkama';
    $Self->{Translation}->{'Change class definition'} = 'Definicija klase promene';
    $Self->{Translation}->{'Config Item Class'} = 'Klasa konfiguracione stavke';
    $Self->{Translation}->{'Definition'} = 'Definicija';
    $Self->{Translation}->{'Change'} = 'Promeni';

    # Template: AgentDashboardITSMConfigItemGeneric
    $Self->{Translation}->{'Incident State'} = 'Stanje incidenta';
    $Self->{Translation}->{'Deployment State'} = 'Status raspoređivanja';
    $Self->{Translation}->{'Class'} = 'Klasa';
    $Self->{Translation}->{'Deployment State Type'} = 'Tip statusa raspoređivanja';
    $Self->{Translation}->{'Current Incident State'} = 'Trenutno stanje incidenta';
    $Self->{Translation}->{'Current Incident State Type'} = 'Tip trenutnog statusa incidenta';
    $Self->{Translation}->{'Last changed'} = 'Zadnji put promenjeno';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = 'Konfiguraciona stavka';
    $Self->{Translation}->{'Filter for Classes'} = 'Filter za klase';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'Izaberite klasu iz liste radi kreiranja nove konfiguracione stavke.';

    # Template: AgentITSMConfigItemBulk
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = 'ITSM masovna akcija na tiketu';
    $Self->{Translation}->{'Deployment state'} = 'Status raspoređivanja';
    $Self->{Translation}->{'Incident state'} = 'Stanje incidenta';
    $Self->{Translation}->{'Link to another'} = 'Poveži sa drugim';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = 'Neispravan broj konfiguracione stavke!';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = 'Broj druge konfiguracione stavke za povezivanje.';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = 'Da li stvarno želite da obrišete ovu konfiguracionu stavku?';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'Naziv ove konfiguracione stavke';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        'Naziv je već u upotrebi na konfiguracionim stavkama broj: %s';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = 'Istorijat konfiguracione stavke: %s';
    $Self->{Translation}->{'History Content'} = 'Sadržaj istorije';
    $Self->{Translation}->{'Createtime'} = 'Vreme kreiranja';
    $Self->{Translation}->{'Zoom view'} = 'Uvećani pregled';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Podešavanje konteksta';
    $Self->{Translation}->{'Config Items per page'} = 'Konfiguracione stavke po strani';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = 'Generička tabela ITSM konfiguracione stavke';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Run Search'} = 'Pokreni pretragu';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Pretražite i u prethotnim verzijama?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'Konfiguraciona stavka';
    $Self->{Translation}->{'Configuration Item Information'} = 'Informacija o konfiguracionoj stavki';
    $Self->{Translation}->{'Current Deployment State'} = 'Trenutni status raspoređivanja';
    $Self->{Translation}->{'Last changed by'} = 'Promenio';
    $Self->{Translation}->{'Show one version'} = 'Prikaži jednu verziju';
    $Self->{Translation}->{'Show all versions'} = 'Pokaži sve verzije';
    $Self->{Translation}->{'Version Incident State'} = 'Verzija - status incidenta';
    $Self->{Translation}->{'Version Deployment State'} = 'Verzija - status primene';
    $Self->{Translation}->{'Version Number'} = 'Broj verzije';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Detalji verzije konfiguracione stavke';
    $Self->{Translation}->{'Property'} = 'Svojstvo';

    # Perl Module: Kernel/Modules/AgentITSMConfigItem.pm
    $Self->{Translation}->{'No access to Class is given!'} = 'Nije dat pristup klasi!';
    $Self->{Translation}->{'Overview: ITSM ConfigItem'} = 'Pregled: ITSM konfiguracione stavke';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemBulk.pm
    $Self->{Translation}->{'No ConfigItemID is given!'} = 'Nije dat ConfigItemID!';
    $Self->{Translation}->{'You need at least one selected Configuration Item!'} = 'Potrebna je bar jedna izabrana konfiguraciona stavka!';
    $Self->{Translation}->{'You don\'t have write access to this configuration item: %s.'} =
        'Nemate pravo upisa za ovu konfiguracionu stavku: %s.';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemDelete.pm
    $Self->{Translation}->{'Config item "%s" not found in database!'} = 'Konfiguraciona stavka "%s" nije nađena u bazi podataka!';
    $Self->{Translation}->{'Was not able to delete the configitem ID %s!'} = 'Nije bilo moguće obrisati ConfigItemID %s!';
    $Self->{Translation}->{'No version found for ConfigItemID %s!'} = 'Nije pronađena verzija za ConfigItemID %s!';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemEdit.pm
    $Self->{Translation}->{'No ConfigItemID, DuplicateID or ClassID is given!'} = 'Nisu dati ConfigItemID, DuplicateID ili ClassID!';
    $Self->{Translation}->{'No access is given!'} = 'Nije dat pristup!';
    $Self->{Translation}->{'No definition was defined for class %s!'} = 'Nije pronađena definicija za klasu %s!';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemHistory.pm
    $Self->{Translation}->{'Can\'t show history, no ConfigItemID is given!'} = 'Ne može se prikazati istorijat, jer nije dat ConfigItemID!';
    $Self->{Translation}->{'Can\'t show history, no access rights given!'} = 'Ne može se prikazati istorijat, nije dozvoljen pristup!';
    $Self->{Translation}->{'New ConfigItem (ID=%s)'} = 'Nova konfiguraciona stavka (ID=%s)';
    $Self->{Translation}->{'New version (ID=%s)'} = 'Nova verzija (ID=%s)';
    $Self->{Translation}->{'Deployment state updated (new=%s, old=%s)'} = 'Ažurirano stanje rasporeda (novo=%s, staro=%s) ';
    $Self->{Translation}->{'Incident state updated (new=%s, old=%s)'} = 'Ažurirano stanje incidenta (novo=%s, staro=%s)';
    $Self->{Translation}->{'ConfigItem (ID=%s) deleted'} = 'Obrisana konfiguraciona stavka (ID=%s)';
    $Self->{Translation}->{'Link to %s (type=%s) added'} = 'Povezano sa %s (tip=%s)';
    $Self->{Translation}->{'Link to %s (type=%s) deleted'} = 'Obrisana veza sa %s (tip=%s)';
    $Self->{Translation}->{'ConfigItem definition updated (ID=%s)'} = 'Ažurirana definicija konfiguracione stavke (ID=%s)';
    $Self->{Translation}->{'Name updated (new=%s, old=%s)'} = 'Ažuriran naziv (novi=%s, stari=%s)';
    $Self->{Translation}->{'Attribute %s updated from "%s" to "%s"'} = 'Ažuriran atribut%s sa "%s" na "%s"';
    $Self->{Translation}->{'Version %s deleted'} = 'Verzija %s je obrisana';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'No ConfigItemID or VersionID is given!'} = 'Nisu dati ConfigItemID ili VersionID!';
    $Self->{Translation}->{'Can\'t show config item, no access rights given!'} = 'Ne može se prikazati konfiguraciona stavka, nije dat pristup!';
    $Self->{Translation}->{'ConfigItemID %s not found in database!'} = 'ID konfiguracione stavke %s nije nađen u bazi podataka!';
    $Self->{Translation}->{'VersionID %s not found in database!'} = 'Id verzije %s nije nađen u bazi podataka!';
    $Self->{Translation}->{'ConfigItem'} = 'Konfiguraciona stavka';
    $Self->{Translation}->{'printed by %s at %s'} = 'štampanu od strane %s u %s';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'Invalid ClassID!'} = 'Neispravan ID klase!';
    $Self->{Translation}->{'No ClassID is given!'} = 'Nije dat ID klase!';
    $Self->{Translation}->{'No access rights for this class given!'} = 'Nije dat pristup ovoj klasi!';
    $Self->{Translation}->{'No Result!'} = 'Nema rezultata!';
    $Self->{Translation}->{'Config Item Search Results'} = 'Rezultat pretrage konfiguracionih stavki';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemZoom.pm
    $Self->{Translation}->{'Can\'t show item, no access rights for ConfigItem are given!'} =
        'Ne može se prikazati stavka, nije dat pristup za ovu konfiguracionu stavku!';
    $Self->{Translation}->{'operational'} = 'operativni';
    $Self->{Translation}->{'warning'} = 'upozorenje';
    $Self->{Translation}->{'incident'} = 'incident';
    $Self->{Translation}->{'The deployment state of this config item'} = 'Status primene ove konfiguracione stavke';
    $Self->{Translation}->{'The incident state of this config item'} = 'Status incidenta ove konfiguracione stavke';

    # Perl Module: Kernel/Output/HTML/Dashboard/ITSMConfigItemGeneric.pm
    $Self->{Translation}->{'Shown config items'} = 'Prikazane konfiguracione stavke';

    # Perl Module: Kernel/Output/HTML/ITSMConfigItem/LayoutDate.pm
    $Self->{Translation}->{'Between'} = 'Između';

    # Perl Module: Kernel/System/ImportExport/ObjectBackend/ITSMConfigItem.pm
    $Self->{Translation}->{'Maximum number of one element'} = 'Maksimalni broj jednog elementa';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'Prazna polja ukazuju da će aktuelne vrednosti biti zadržane';
    $Self->{Translation}->{'Skipped'} = 'Preskočeno';

    # Perl Module: var/packagesetup/ITSMConfigurationManagement.pm
    $Self->{Translation}->{'Model'} = 'Model';
    $Self->{Translation}->{'Customer Company'} = 'Firma klijenta';
    $Self->{Translation}->{'Serial Number'} = 'Serijski broj';
    $Self->{Translation}->{'CPU'} = 'Procesor';
    $Self->{Translation}->{'Ram'} = 'RAM';
    $Self->{Translation}->{'Hard Disk'} = 'Hard disk';
    $Self->{Translation}->{'Capacity'} = 'Kapacitet';
    $Self->{Translation}->{'Network Adapter'} = 'Mrežni adapter';
    $Self->{Translation}->{'IP over DHCP'} = 'IP preko DHCP';
    $Self->{Translation}->{'IP Address'} = 'IP adresa';
    $Self->{Translation}->{'Graphic Adapter'} = 'Grafički adapter';
    $Self->{Translation}->{'Other Equipment'} = 'Druga oprema';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Datum isticanja garancije';
    $Self->{Translation}->{'Install Date'} = 'Datum instalacije';
    $Self->{Translation}->{'Phone 1'} = 'Telefon 1';
    $Self->{Translation}->{'Phone 2'} = 'Telefon 2';
    $Self->{Translation}->{'E-Mail'} = 'Imejl';
    $Self->{Translation}->{'Network Address'} = 'Mrežna adresa';
    $Self->{Translation}->{'Subnet Mask'} = 'Podmrežna maska';
    $Self->{Translation}->{'Gateway'} = 'Mrežni prolaz';
    $Self->{Translation}->{'Licence Type'} = 'Tip licence';
    $Self->{Translation}->{'Licence Key'} = 'Licencni ključ';
    $Self->{Translation}->{'Quantity'} = 'Količina';
    $Self->{Translation}->{'Expiration Date'} = 'Datum isticanja';
    $Self->{Translation}->{'Media'} = 'Medija';

    # Database XML Definition: ITSMConfigurationManagement.sopm
    $Self->{Translation}->{'Computer'} = 'Računar';
    $Self->{Translation}->{'Hardware'} = 'Hardver';
    $Self->{Translation}->{'Network'} = 'Mreža';
    $Self->{Translation}->{'Software'} = 'Softver';
    $Self->{Translation}->{'Expired'} = 'Isteklo';
    $Self->{Translation}->{'Maintenance'} = 'Održavanje';
    $Self->{Translation}->{'Pilot'} = 'Pilot';
    $Self->{Translation}->{'Planned'} = 'Planirano';
    $Self->{Translation}->{'Repair'} = 'Na popravci';
    $Self->{Translation}->{'Retired'} = 'Rashodovano';
    $Self->{Translation}->{'Review'} = 'Recenzija';
    $Self->{Translation}->{'Test/QA'} = 'Test/QA';
    $Self->{Translation}->{'Laptop'} = 'Laptop';
    $Self->{Translation}->{'Desktop'} = 'Desktop';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Server'} = 'Server';
    $Self->{Translation}->{'Other'} = 'Drugo';
    $Self->{Translation}->{'Monitor'} = 'Monitor';
    $Self->{Translation}->{'Printer'} = 'Štampač';
    $Self->{Translation}->{'Switch'} = 'Svič';
    $Self->{Translation}->{'Router'} = 'Ruter';
    $Self->{Translation}->{'WLAN Access Point'} = 'WLAN pristupna tačka';
    $Self->{Translation}->{'Security Device'} = 'Sigurnosni uređaj';
    $Self->{Translation}->{'Backup Device'} = 'Uređaj za rezervne kopije';
    $Self->{Translation}->{'Mouse'} = 'Miš';
    $Self->{Translation}->{'Keyboard'} = 'Tastatura';
    $Self->{Translation}->{'Camera'} = 'Kamera';
    $Self->{Translation}->{'Beamer'} = 'Projektor';
    $Self->{Translation}->{'Modem'} = 'Modem';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA kartica';
    $Self->{Translation}->{'USB Device'} = 'USB uređaj';
    $Self->{Translation}->{'Docking Station'} = 'Priključna stanica';
    $Self->{Translation}->{'Scanner'} = 'Skener';
    $Self->{Translation}->{'Building'} = 'Zgrada';
    $Self->{Translation}->{'Office'} = 'Kancelarija';
    $Self->{Translation}->{'Floor'} = 'Sprat';
    $Self->{Translation}->{'Room'} = 'Soba';
    $Self->{Translation}->{'Rack'} = 'Rek';
    $Self->{Translation}->{'Workplace'} = 'Radno mesto';
    $Self->{Translation}->{'Outlet'} = 'Utičnica';
    $Self->{Translation}->{'IT Facility'} = 'IT objekat';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'Telco'} = 'Telco';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Client Application'} = 'Klijentska aplikacija';
    $Self->{Translation}->{'Middleware'} = 'Posrednički program';
    $Self->{Translation}->{'Server Application'} = 'Serverska aplikacija';
    $Self->{Translation}->{'Client OS'} = 'Klijentski OS';
    $Self->{Translation}->{'Server OS'} = 'Serverski OS';
    $Self->{Translation}->{'Admin Tool'} = 'Administrativni alat';
    $Self->{Translation}->{'User Tool'} = 'Korisnički alat';
    $Self->{Translation}->{'Embedded'} = 'Ugrađen';
    $Self->{Translation}->{'Single Licence'} = 'Pojedinačna licenca';
    $Self->{Translation}->{'Per User'} = 'Po korisniku';
    $Self->{Translation}->{'Per Processor'} = 'Po procesoru';
    $Self->{Translation}->{'Per Server'} = 'Po serveru';
    $Self->{Translation}->{'Per Node'} = 'Po čvoru';
    $Self->{Translation}->{'Volume Licence'} = 'Količinske licence';
    $Self->{Translation}->{'Enterprise Licence'} = 'Kompanijska licenca';
    $Self->{Translation}->{'Developer Licence'} = 'Razvojna licenca';
    $Self->{Translation}->{'Demo'} = 'Demonstracioni';
    $Self->{Translation}->{'Time Restricted'} = 'Vremenski ograničeno';
    $Self->{Translation}->{'Freeware'} = 'Besplatni **';
    $Self->{Translation}->{'Open Source'} = 'Otvoreni kod';
    $Self->{Translation}->{'Unlimited'} = 'Neograničeno';

    # JS File: ITSM.Agent.ConfigItem.Zoom
    $Self->{Translation}->{'Ok'} = 'U redu';

    # SysConfig
    $Self->{Translation}->{'Assigned CIs'} = 'Dodeljene konfiguracione stavke';
    $Self->{Translation}->{'CIs assigned to customer company'} = 'Konfiguracione stavke dodeljene firmi klijenta';
    $Self->{Translation}->{'CIs assigned to customer user'} = 'Konfiguracione stavke dodeljene klijentu korisniku';
    $Self->{Translation}->{'CMDB Settings'} = 'CMDB podešavanja';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        'Provera jedinstvenog imena samo u okviru iste klase konfiguracionih stavki (\'klasa\') ili globalno (\'globalno\'), što znači da je svaka postojeća Konfiguraciona stavka uzeta u obzir u proveri duplikata.';
    $Self->{Translation}->{'Config Items'} = 'Konfiguracione stavke';
    $Self->{Translation}->{'Config item add.'} = 'Dodavanje konfiguracione stavke.';
    $Self->{Translation}->{'Config item edit.'} = 'Uređivanje konfiguracione stavke.';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        'Modul događaja konfiguracionih stavki koji omogućava beleženje u istorijat u interfejsu operatera.';
    $Self->{Translation}->{'Config item history.'} = 'Istorijat konfiguracione stavke.';
    $Self->{Translation}->{'Config item print.'} = 'Štampa konfiguracione stavke';
    $Self->{Translation}->{'Config item zoom.'} = 'Detaljni prikaz konfiguracine stavke.';
    $Self->{Translation}->{'ConfigItemNumber'} = 'Broj konfiguracione stavke';
    $Self->{Translation}->{'Configuration Item Limit'} = 'Ograničenje konfiguracione stavke';
    $Self->{Translation}->{'Configuration Item limit per page.'} = 'Ograničenje konfiguracionih stavki po strani.';
    $Self->{Translation}->{'Configuration Management Database.'} = 'Baza podataka upravljanja konfiguracijom.';
    $Self->{Translation}->{'Configuration item bulk module.'} = 'Modul masovne akcije na konfiguracionim stavkama.';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        'Konfiguraciona stavka pretražuje pozadinski ruter u interfejsu operatera.';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = 'Kreiranje i upravljanje definicija za konfiguracione stavke.';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        'Definiše akcije gde je dugme postavki dostupno u povezanom grafičkom elementu objekta (LinkObject::ViewMode = "complex"). Molimo da imate na umu da ove Akcije moraju da budu registrovane u sledećim JS i CSS datotekama: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js i Core.Agent.LinkObject.js.';
    $Self->{Translation}->{'Defines Required permissions to create ITSM configuration items using the Generic Interface.'} =
        'Definiše neophodne dozvole za kreiranje ITSM konfiguracionih stavki korišćenjem generičkog interfejsa.';
    $Self->{Translation}->{'Defines Required permissions to delete ITSM configuration items using the Generic Interface.'} =
        'Određuje potrebne dozvole za brisanje ITSM konfiguracionih stavki kroz generički interfejs.';
    $Self->{Translation}->{'Defines Required permissions to get ITSM configuration items using the Generic Interface.'} =
        'Definiše neophodne dozvole za dobijanje ITSM konfiguracionih stavki korišćenjem generičkog interfejsa.';
    $Self->{Translation}->{'Defines Required permissions to search ITSM configuration items using the Generic Interface.'} =
        'Definiše neophodne dozvole za pretragu ITSM konfiguracionih stavki korišćenjem generičkog interfejsa.';
    $Self->{Translation}->{'Defines Required permissions to update ITSM configuration items using the Generic Interface.'} =
        'Definiše neophodne dozvole za ažuriranje ITSM konfiguracionih stavki korišćenjem generičkog interfejsa.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        'Definiše modul pregleda za mali prikaz liste konfiguracionih stavki. ';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        'Određuje regularne izraze za svaku klasu konfiguracione stavke radi provere naziva konfiguracione stavke i prikaza pripadajućih poruka o greškama.';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        'Određuje podrazumevani podobjekat klase ITSM konfiguraciona stavka.';
    $Self->{Translation}->{'Defines the number of rows for the CI definition editor in the admin interface.'} =
        'Određuje broj redova za editor definicije CI u administrativnom interfejsu.';
    $Self->{Translation}->{'Defines the order of incident states from high (e.g. cricital) to low (e.g. functional).'} =
        'Određuje redosled incidentnih stanja od visokog (npr kritično) do niskog (npr funkcionalno).';
    $Self->{Translation}->{'Defines the relevant deployment states where linked tickets can affect the status of a CI.'} =
        'Određuje relevantna stanja raspoređivanja gde povezani tiketi mogu da utiču na status CI.';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItem screen.'} =
        'Definiše granicu pretrage za ekran AgentITSMConfigItem.';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItemSearch screen.'} =
        'Definiše granicu pretrage za ekran AgentITSMConfigItemSearch.';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected.'} =
        'Određuje prikazane kolone u pregledu konfiguracionih stavki. Ova opcije nema uticaj na pozicije kolona. Napomena: ukoliko je izabran filter \'Sve\' klasa kolone je uvek dostupna.';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} =
        'Definiše prikazane kolone u pretrazi konfiguracionih stavki. Ova opcije nema uticaj na pozicije kolona.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item overview depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'Definiše prikazane kolone konfiguracionih stavki u pregledu u zavisnosti od klase. Svaki unos mora sadržati prefiks sa nazivom klase i dvotačkom (npr. Computer::). Postoji par atributa koji su zajednički za sve klase (npr. za klasu Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). Za prikaz pojedinačnih atributa iz definicije, morate koristiti sledeću šemu (primer za klasu Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. Ukoliko ne postoji unos za pojedinačnu klasu, biće prikazane podrazumevane kolone definisane u ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item search depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'Definiše prikazane kolone konfiguracionih stavki u pretrazi u zavisnosti od klase. Svaki unos mora sadržati prefiks sa nazivom klase i dvotačkom (npr. Computer::). Postoji par atributa koji su zajednički za sve klase (npr. za klasu Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). Za prikaz pojedinačnih atributa iz definicije, morate koristiti sledeću šemu (primer za klasu Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. Ukoliko ne postoji unos za pojedinačnu klasu, biće prikazane podrazumevane kolone definisane u ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item widget depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting AgentCustomerInformationCenter::Backend###0060-CIC-ITSMConfigItemCustomerCompany (key DefaultColumns).'} =
        'Definiše prikazane kolone konfiguracionih stavki u dodatku komandne table u zavisnosti od klase. Svaki unos mora sadržati prefiks sa nazivom klase i dvotačkom (npr. Computer::). Postoji par atributa koji su zajednički za sve klase (npr. za klasu Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). Za prikaz pojedinačnih atributa iz definicije, morate koristiti sledeću šemu (primer za klasu Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. Ukoliko ne postoji unos za pojedinačnu klasu, biće prikazane podrazumevane kolone definisane u AgentCustomerInformationCenter::Backend###0060-CIC-ITSMConfigItemCustomerCompany (ključ DefaultColumns).';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view for all CI classes. If there is no entry, then the default columns are shown.'} =
        'Definiše prikazane kolone konfiguracionih stavki u tabeli veza u zavisnosti od klase. Ukoliko ne postoji unos za pojedinačnu klasu, biće prikazane podrazumevane kolone.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view, depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown.'} =
        'Definiše prikazane kolone konfiguracionih stavki u tabeli veza u zavisnosti od klase. Svaki unos mora sadržati prefiks sa nazivom klase i dvotačkom (npr. Computer::). Postoji par atributa koji su zajednički za sve klase (npr. za klasu Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). Za prikaz pojedinačnih atributa iz definicije, morate koristiti sledeću šemu (primer za klasu Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. Ukoliko ne postoji unos za pojedinačnu klasu, biće prikazane podrazumevane kolone.';
    $Self->{Translation}->{'Defines which type of link (named from the ticket perspective) can affect the status of a linked CI.'} =
        'Određuje koji tip veze (gledano iz perspektive tiketa) može da utiče na povezanu CI.';
    $Self->{Translation}->{'Defines which type of ticket can affect the status of a linked CI.'} =
        'Određuje koji tip tiketa može da utiče na status povezane CI.';
    $Self->{Translation}->{'Delete Configuration Item'} = 'Brisanje konfiguracione stavke';
    $Self->{Translation}->{'Deployment State Color'} = 'Boja statusa raspoređivanja';
    $Self->{Translation}->{'Duplicate'} = 'Duplikat';
    $Self->{Translation}->{'Enables configuration item bulk action feature for the agent frontend to work on more than one configuration item at a time.'} =
        'Omogućava masovnu akciju na konfiguracionim stavkama u pristupnom sistemu operatera na više od jedne stavke istovremeno.';
    $Self->{Translation}->{'Enables configuration item bulk action feature only for the listed groups.'} =
        'Aktivira svojstvo masovne akcije na konfigiracionim stavkama samo za izlistane grupe.';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        'Aktivira/deaktivira funkciju za proveru jedinstvenosti imana konfiguracionih stavki. Pre aktiviranja ove opcije trebate proveriti u vašem sistemu postojanje duplikata na postojećim stavkama. To možete uraditi pomoću skripta bin/otrs.ITSMConfigItemListDuplicates.pl. ';
    $Self->{Translation}->{'Event module to set configitem-status on ticket-configitem-link.'} =
        'Modul događaja za podešavanje statusa konfiguracionih stavki prilikom postavljanja veza.';
    $Self->{Translation}->{'ITSM config item overview.'} = 'Pregled ITSM konfiguracione stavke.';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = 'Modul za proveru grupe odgovorne za klasu.';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        'Modul za proveru grupe odgovorne za konfiguracionu stavku.';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = 'Modul za generisanje statistike ITSM konfiguracionih stavki.';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        'Registracija modula objekta za dodatak uvoz/izvoz.';
    $Self->{Translation}->{'Overview.'} = 'Pregled.';
    $Self->{Translation}->{'Parameters for the dashboard backend of the customer company config item overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.'} =
        'Parametri za pozadinski prikaz kontrolne table liste konfiguracionih stavki firme klijenta u interfejsu operatera. "Limit" definiše podrazumevani broj prikazanih stavki. "Group" se koristi da ograniči pristup dodatku (npr. Group: admin;group1;group2;). "Default" određuje da li je dodatak podrazumevano aktiviran ili da je neophodno da ga korisnik manuelno aktivira. "CacheTTLLocal" je vreme u minutima za keširanje dodatka.';
    $Self->{Translation}->{'Parameters for the deployment states color in the preferences view of the agent interface.'} =
        'Parametri za boje statusa primene na prikazu postavki u interfejsu operatera.';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        'Parametri za statuse primene na prikazu postavki u interfejsu operatera.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Parametri za atribute uzorka grupe za dozvole opšteg kataloga';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        'Parametri za stranice (na kojima su konfiguracione stavke prikazane).';
    $Self->{Translation}->{'Permission Group'} = 'Grupa pristupa';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} =
        'Potrebne dozvole za upotrebu ekrana ITSM konfiguracione stavke u interfejsu operatera.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} =
        'Potrebne dozvole za upotrebu ekrana pretrage ITSM konfiguracione stavke u interfejsu operatera.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} =
        'Potrebne dozvole za upotrebu ekrana detalnog prikaza ITSM konfiguracione stavke u interfejsu operatera.';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} =
        'Potrebne dozvole za upotrebu ekrana dodavanja ITSM konfiguracione stavke u interfejsu operatera.';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} =
        'Potrebne dozvole za upotrebu ekrana izmene ITSM konfiguracione stavke u interfejsu operatera.';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} =
        'Potrebne dozvole za upotrebu ekrana istorijata ITSM konfiguracione stavke u interfejsu operatera.';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} =
        'Potrebne dozvole za upotrebu ekrana štampe ITSM konfiguracione stavke u interfejsu operatera.';
    $Self->{Translation}->{'Required privileges to delete config items.'} = 'Potrebna prava za brisanje konfiguracione stavke.';
    $Self->{Translation}->{'Search config items.'} = 'Pretraga konfiguracionih stavki.';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        'Bira modul operatora automatskog uvećanja konfiguracione stavke. Operator automatskog uvećanja povećava broj stavke, SystemID, ConfigItemClassID i korišćeni brojač. Format je "SystemID.ConfigItemClassID.brojač", npr 1205000004, 1205000005.';
    $Self->{Translation}->{'Set the incident state of a CI automatically when a Ticket is Linked to a CI.'} =
        'Postavlja stanje incidenta konfiguracione stavke kada je tiket povezan sa stavkom.';
    $Self->{Translation}->{'Sets the deployment state in the configuration item bulk screen of the agent interface.'} =
        'Određuje status primene na ekranu masovne akcije konfiguracione stavke u interfejsu operatera.';
    $Self->{Translation}->{'Sets the incident state in the configuration item bulk screen of the agent interface.'} =
        'Određuje status incidenta na ekranu masovne akcije konfiguracione stavke u interfejsu operatera.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        'U meniju prikazuje vezu koja omogućava povezivanje konfiguracione stavke sa drugim objektom na detaljnom prikazu konfiguracije u interfejsu operatera.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the configuration item overview of the agent interface.'} =
        'U meniju prikazuje vezu za pristup istorijatu konfiguracione stavke na pregledu konfiguracione stavke u interfejsu operatera.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        'U meniju prikazuje vezu za pristup istorijatu konfiguracione stavke na detaljnom prikazu u interfejsu operatera.';
    $Self->{Translation}->{'Shows a link in the menu to delete a configuration item in its zoom view of the agent interface.'} =
        'U meniju prikazuje vezu za brisanje konfiguracione stavke na njenom detaljnom prikazu u interfejsu operatera.';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the configuration item overview of the agent interface.'} =
        'U meniju prikazuje vezu za umnožavanje konfiguracione stavke na pregledu konfiguracione stavke u interfejsu operatera.';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        'U meniju prikazuje vezu za umnožavanje konfiguracione stavke na njenom detaljnom prikazu u interfejsu operatera.';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        'U meniju prikazuje vezu za izmenu konfiguracione stavke na njenom detaljnom prikazu u interfejsu operatera.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuration item zoom view of the agent interface.'} =
        'U meniju prikazuje vezu za povratak na detaljni prikaz konfiguracione stavke  u interfejsu operatera.';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        'U meniju prikazuje vezu za štampu konfiguracione stavke na njenom detaljnom prikazu u interfejsu operatera.';
    $Self->{Translation}->{'Shows a link in the menu to zoom into a configuration item in the configuration item overview of the agent interface.'} =
        'U meniju prikazuje vezu za detaljni prikaz konfiguracione stavke na pregledu konfiguracione stavke u interfejsu operatera.';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        'Prikazuje istorijat konfiguracione stavke (obrnut redosled) u interfejsu operatera.';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        'Identifikator za konfiguracionu stavku, npr. ConfigItem#, MyConfigItem#. Podrazumevano je ConfigItem#.';
    $Self->{Translation}->{'class'} = 'klasa';
    $Self->{Translation}->{'global'} = 'globalno';
    $Self->{Translation}->{'postproductive'} = 'post-produkcija';
    $Self->{Translation}->{'preproductive'} = 'pre-produkcija';
    $Self->{Translation}->{'productive'} = 'produkcija';


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
