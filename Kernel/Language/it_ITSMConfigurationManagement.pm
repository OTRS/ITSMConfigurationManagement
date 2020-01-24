# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Language::it_ITSMConfigurationManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Gestione degli elementi di configurazione';
    $Self->{Translation}->{'Change class definition'} = 'Modifica la definizione della classe';
    $Self->{Translation}->{'Config Item Class'} = 'Config Item Class';
    $Self->{Translation}->{'Definition'} = 'Definizione';
    $Self->{Translation}->{'Change'} = 'Modifica';

    # Template: AgentDashboardITSMConfigItemGeneric
    $Self->{Translation}->{'Incident State'} = 'Stato dell\'incidente';
    $Self->{Translation}->{'Deployment State'} = 'Stato di implementazione';
    $Self->{Translation}->{'Class'} = 'Classe';
    $Self->{Translation}->{'Deployment State Type'} = 'Tipo di stato di distribuzione';
    $Self->{Translation}->{'Current Incident State'} = 'Stato attuale dell\'incidente';
    $Self->{Translation}->{'Current Incident State Type'} = 'Tipo di stato dell\'incidente corrente';
    $Self->{Translation}->{'Last changed'} = 'Ultima modifica';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = 'Elemento di configurazione';
    $Self->{Translation}->{'Filter for Classes'} = 'Filtro per classi';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'Selezionare una classe dall\'elenco per creare un nuovo elemento di configurazione.';

    # Template: AgentITSMConfigItemBulk
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = 'Azione in blocco di ITSM ConfigItem';
    $Self->{Translation}->{'Deployment state'} = 'Stato di distribuzione';
    $Self->{Translation}->{'Incident state'} = 'Stato dell\'incidente';
    $Self->{Translation}->{'Link to another'} = 'Collega a un altro';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = 'Numero articolo di configurazione non valido!';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = 'Il numero di un altro elemento di configurazione con cui collegarsi.';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = 'Vuoi davvero eliminare questo elemento di configurazione?';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'Il nome di questo elemento di configurazione';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        'Il nome è già in uso da ConfigItems con i seguente/i numer(o)i: %s';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = 'Storia della voce di configurazione: %s';
    $Self->{Translation}->{'History Content'} = 'Contenuto dello storico';
    $Self->{Translation}->{'Createtime'} = 'Istante di creazione';
    $Self->{Translation}->{'Zoom view'} = 'Vista di Dettaglio';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Impostazioni di contesto';
    $Self->{Translation}->{'Config Items per page'} = 'Config. articoli per pagina';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = 'Una tabella di elementi di configurazione ITSM generica';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Run Search'} = 'Esegui ricerca';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Cercare anche in versioni precedenti?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'Elemento di configurazione';
    $Self->{Translation}->{'Configuration Item Information'} = 'Informazioni sull\'elemento di configurazione';
    $Self->{Translation}->{'Current Deployment State'} = 'Stato attuale di implementazione';
    $Self->{Translation}->{'Last changed by'} = 'Ultima modifica di';
    $Self->{Translation}->{'Show one version'} = 'Mostra una versione';
    $Self->{Translation}->{'Show all versions'} = 'Mostra tutte le versioni';
    $Self->{Translation}->{'Version Incident State'} = 'Stato incidente versione';
    $Self->{Translation}->{'Version Deployment State'} = 'Stato di distribuzione della versione';
    $Self->{Translation}->{'Version Number'} = 'Numero di versione';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Dettagli della versione dell\'elemento di configurazione';
    $Self->{Translation}->{'Property'} = 'Proprietà';

    # Perl Module: Kernel/Modules/AgentITSMConfigItem.pm
    $Self->{Translation}->{'No access to Class is given!'} = 'Non è concesso l\'accesso alla classe!';
    $Self->{Translation}->{'Overview: ITSM ConfigItem'} = 'Panoramica: ITSM ConfigItem';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemBulk.pm
    $Self->{Translation}->{'No ConfigItemID is given!'} = 'Non viene fornito ConfigItemID!';
    $Self->{Translation}->{'You need at least one selected Configuration Item!'} = 'È necessario almeno un elemento di configurazione selezionato!';
    $Self->{Translation}->{'You don\'t have write access to this configuration item: %s.'} =
        'Non hai accesso in scrittura a questo elemento di configurazione: %s.';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemDelete.pm
    $Self->{Translation}->{'Config item "%s" not found in database!'} = 'Voce di configurazione "%s" non trovata nel database!';
    $Self->{Translation}->{'Was not able to delete the configitem ID %s!'} = 'Impossibile eliminare l\'ID di configurazione %s!';
    $Self->{Translation}->{'No version found for ConfigItemID %s!'} = 'Nessuna versione trovata per ConfigItemID %s!';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemEdit.pm
    $Self->{Translation}->{'No ConfigItemID, DuplicateID or ClassID is given!'} = 'Non viene fornito ConfigItemID, DuplicateID o ClassID!';
    $Self->{Translation}->{'No access is given!'} = 'Nessun accesso è concesso!';
    $Self->{Translation}->{'No definition was defined for class %s!'} = 'Nessuna definizione è stata definita per la classe %s!';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemHistory.pm
    $Self->{Translation}->{'Can\'t show history, no ConfigItemID is given!'} = 'Impossibile mostrare la cronologia, non viene fornito ConfigItemID!';
    $Self->{Translation}->{'Can\'t show history, no access rights given!'} = 'Impossibile mostrare la cronologia, nessun diritto di accesso concesso!';
    $Self->{Translation}->{'New ConfigItem (ID=%s)'} = 'Nuovo ConfigItem (ID =%s)';
    $Self->{Translation}->{'New version (ID=%s)'} = 'Nuova versione (ID =%s)';
    $Self->{Translation}->{'Deployment state updated (new=%s, old=%s)'} = 'Stato di distribuzione aggiornato (nuovo=%s, vecchio=%s)';
    $Self->{Translation}->{'Incident state updated (new=%s, old=%s)'} = 'Stato dell\'incidente aggiornato (nuovo=%s, vecchio= %s)';
    $Self->{Translation}->{'ConfigItem (ID=%s) deleted'} = 'ConfigItem (ID=%s) elimina';
    $Self->{Translation}->{'Link to %s (type=%s) added'} = 'Collegamento a %s (tipo=%s) aggiunta';
    $Self->{Translation}->{'Link to %s (type=%s) deleted'} = 'Collegamento a %s (tipo=%s) eliminata';
    $Self->{Translation}->{'ConfigItem definition updated (ID=%s)'} = 'Definizione di ConfigItem aggiornata (ID=%s)';
    $Self->{Translation}->{'Name updated (new=%s, old=%s)'} = 'Nome aggiornato (nuovo=%s, vecchio=%s)';
    $Self->{Translation}->{'Attribute %s updated from "%s" to "%s"'} = 'Attributo %s aggiornato da "%s" a "%s"';
    $Self->{Translation}->{'Version %s deleted'} = 'Versione %s eliminata';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'No ConfigItemID or VersionID is given!'} = 'Non viene fornito ConfigItemID o VersionID!';
    $Self->{Translation}->{'Can\'t show config item, no access rights given!'} = 'Impossibile mostrare l\'elemento di configurazione, nessun diritto di accesso concesso!';
    $Self->{Translation}->{'ConfigItemID %s not found in database!'} = 'ConfigItemID %s non trovato nel database!';
    $Self->{Translation}->{'VersionID %s not found in database!'} = 'VersionID %s non trovato nel database!';
    $Self->{Translation}->{'ConfigItem'} = 'ConfigItem';
    $Self->{Translation}->{'printed by %s at %s'} = 'stampato da %s a %s';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'Invalid ClassID!'} = 'ClassID non valido!';
    $Self->{Translation}->{'No ClassID is given!'} = 'Nessun ClassID è dato!';
    $Self->{Translation}->{'No access rights for this class given!'} = 'Nessun diritto di accesso per questa classe dato!';
    $Self->{Translation}->{'No Result!'} = 'Nessun risultato!';
    $Self->{Translation}->{'Config Item Search Results'} = 'Configura i risultati della ricerca degli elementi';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemZoom.pm
    $Self->{Translation}->{'Can\'t show item, no access rights for ConfigItem are given!'} =
        'Impossibile mostrare l\'elemento, non viene concesso alcun diritto di accesso per ConfigItem!';
    $Self->{Translation}->{'operational'} = 'operativo';
    $Self->{Translation}->{'warning'} = 'avvertimento';
    $Self->{Translation}->{'incident'} = 'incidente';
    $Self->{Translation}->{'The deployment state of this config item'} = 'Lo stato di implementazione di questo elemento di configurazione';
    $Self->{Translation}->{'The incident state of this config item'} = 'Lo stato di incidente di questo elemento di configurazione';

    # Perl Module: Kernel/Output/HTML/Dashboard/ITSMConfigItemGeneric.pm
    $Self->{Translation}->{'Shown config items'} = 'Elementi di configurazione mostrati';

    # Perl Module: Kernel/Output/HTML/ITSMConfigItem/LayoutDate.pm
    $Self->{Translation}->{'Between'} = 'fra';

    # Perl Module: Kernel/System/ImportExport/ObjectBackend/ITSMConfigItem.pm
    $Self->{Translation}->{'Maximum number of one element'} = 'Numero massimo di un elemento';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'I campi vuoti indicano che i valori correnti sono mantenuti';
    $Self->{Translation}->{'Skipped'} = 'Saltato';

    # Perl Module: var/packagesetup/ITSMConfigurationManagement.pm
    $Self->{Translation}->{'Model'} = 'Modello';
    $Self->{Translation}->{'Customer Company'} = 'Società cliente';
    $Self->{Translation}->{'Serial Number'} = 'Numero seriale';
    $Self->{Translation}->{'CPU'} = 'CPU';
    $Self->{Translation}->{'Ram'} = 'Ram';
    $Self->{Translation}->{'Hard Disk'} = 'Disco fisso';
    $Self->{Translation}->{'Capacity'} = 'Capacità';
    $Self->{Translation}->{'Network Adapter'} = 'Scheda di rete';
    $Self->{Translation}->{'IP over DHCP'} = 'IP su DHCP';
    $Self->{Translation}->{'IP Address'} = 'Indirizzo IP';
    $Self->{Translation}->{'Graphic Adapter'} = 'Scheda grafica';
    $Self->{Translation}->{'Other Equipment'} = 'Altri apparati';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Data di scadenza della garanzia';
    $Self->{Translation}->{'Install Date'} = 'Data di installazione';
    $Self->{Translation}->{'Phone 1'} = 'Telefono 1';
    $Self->{Translation}->{'Phone 2'} = 'Telefono 2';
    $Self->{Translation}->{'E-Mail'} = 'E-Mail';
    $Self->{Translation}->{'Network Address'} = 'Indirizzo di rete';
    $Self->{Translation}->{'Subnet Mask'} = 'Maschera di rete';
    $Self->{Translation}->{'Gateway'} = 'Gateway';
    $Self->{Translation}->{'Licence Type'} = 'Tipo di licenza';
    $Self->{Translation}->{'Licence Key'} = 'Chiave di licenza';
    $Self->{Translation}->{'Quantity'} = 'Quantità';
    $Self->{Translation}->{'Expiration Date'} = 'Data di scadenza';
    $Self->{Translation}->{'Media'} = 'Supporto';

    # Database XML Definition: ITSMConfigurationManagement.sopm
    $Self->{Translation}->{'Computer'} = 'Computer';
    $Self->{Translation}->{'Hardware'} = 'Hardware';
    $Self->{Translation}->{'Network'} = 'Rete';
    $Self->{Translation}->{'Software'} = 'Software';
    $Self->{Translation}->{'Expired'} = 'Scaduto';
    $Self->{Translation}->{'Maintenance'} = 'Manutenzione';
    $Self->{Translation}->{'Pilot'} = 'Pilot';
    $Self->{Translation}->{'Planned'} = 'Pianificato';
    $Self->{Translation}->{'Repair'} = 'Riparazione';
    $Self->{Translation}->{'Retired'} = 'Ritirato';
    $Self->{Translation}->{'Review'} = 'Revisionato';
    $Self->{Translation}->{'Test/QA'} = 'Test';
    $Self->{Translation}->{'Laptop'} = 'Portatile';
    $Self->{Translation}->{'Desktop'} = 'Desktop';
    $Self->{Translation}->{'PDA'} = 'Palmare';
    $Self->{Translation}->{'Server'} = 'Server';
    $Self->{Translation}->{'Other'} = 'Altro';
    $Self->{Translation}->{'Monitor'} = 'Monitor';
    $Self->{Translation}->{'Printer'} = 'Stampante';
    $Self->{Translation}->{'Switch'} = 'Switch';
    $Self->{Translation}->{'Router'} = 'Router';
    $Self->{Translation}->{'WLAN Access Point'} = 'WLAN Access Point';
    $Self->{Translation}->{'Security Device'} = 'Dispositivo di sicurezza';
    $Self->{Translation}->{'Backup Device'} = 'Dispositivo di copia';
    $Self->{Translation}->{'Mouse'} = 'Mouse';
    $Self->{Translation}->{'Keyboard'} = 'Tastiera';
    $Self->{Translation}->{'Camera'} = 'Videocamera';
    $Self->{Translation}->{'Beamer'} = 'Beamer';
    $Self->{Translation}->{'Modem'} = 'Modem';
    $Self->{Translation}->{'PCMCIA Card'} = 'Scheda PCMCIA';
    $Self->{Translation}->{'USB Device'} = 'Dispositivo USB';
    $Self->{Translation}->{'Docking Station'} = 'Docking Station';
    $Self->{Translation}->{'Scanner'} = 'Scanner';
    $Self->{Translation}->{'Building'} = 'Edificio';
    $Self->{Translation}->{'Office'} = 'Ufficio';
    $Self->{Translation}->{'Floor'} = 'Piano';
    $Self->{Translation}->{'Room'} = 'Stanza';
    $Self->{Translation}->{'Rack'} = 'Armadio';
    $Self->{Translation}->{'Workplace'} = 'Posto di lavoro';
    $Self->{Translation}->{'Outlet'} = 'Presa';
    $Self->{Translation}->{'IT Facility'} = 'Strumento IT';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'Telco'} = 'Telco';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Client Application'} = 'Applicazione client';
    $Self->{Translation}->{'Middleware'} = 'Middleware';
    $Self->{Translation}->{'Server Application'} = 'Applicazione server';
    $Self->{Translation}->{'Client OS'} = 'SO Cliente';
    $Self->{Translation}->{'Server OS'} = 'SO server';
    $Self->{Translation}->{'Admin Tool'} = 'Strumenti di amministrazione';
    $Self->{Translation}->{'User Tool'} = 'Strumenti utente';
    $Self->{Translation}->{'Embedded'} = 'Integrato';
    $Self->{Translation}->{'Single Licence'} = 'Licenza singola';
    $Self->{Translation}->{'Per User'} = 'Per utente';
    $Self->{Translation}->{'Per Processor'} = 'Per processore';
    $Self->{Translation}->{'Per Server'} = 'Per server';
    $Self->{Translation}->{'Per Node'} = 'Per nodo';
    $Self->{Translation}->{'Volume Licence'} = 'Licenza per volume';
    $Self->{Translation}->{'Enterprise Licence'} = 'Licenza aziendale';
    $Self->{Translation}->{'Developer Licence'} = 'Licenza di sviluppo';
    $Self->{Translation}->{'Demo'} = 'Dimostrativo';
    $Self->{Translation}->{'Time Restricted'} = 'Limitata nel tempo';
    $Self->{Translation}->{'Freeware'} = 'Freeware';
    $Self->{Translation}->{'Open Source'} = 'Open Source';
    $Self->{Translation}->{'Unlimited'} = 'Illimitata';

    # JS File: ITSM.Agent.ConfigItem.Zoom
    $Self->{Translation}->{'Ok'} = 'Ok';

    # SysConfig
    $Self->{Translation}->{'Assigned CIs'} = 'CIs assegnati';
    $Self->{Translation}->{'CIs assigned to customer company'} = 'CIs assegnati alla società cliente';
    $Self->{Translation}->{'CIs assigned to customer user'} = 'CIs assegnati all\'utenza cliente';
    $Self->{Translation}->{'CMDB Settings'} = 'Impostazioni CMDB';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        'Cerca un nome univoco solo all\'interno della stessa classe ConfigItem (\'class\') o globalmente (\'global\'), il che significa che ogni ConfigItem esistente viene preso in considerazione quando si cercano duplicati.';
    $Self->{Translation}->{'Config Items'} = 'Elementi di configurazione';
    $Self->{Translation}->{'Config item add.'} = 'Aggiungi elemento di configurazione.';
    $Self->{Translation}->{'Config item edit.'} = 'Modifica elemento di configurazione.';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        'Modulo eventi elemento di configurazione che consente la registrazione nella cronologia nell\'interfaccia agenti.';
    $Self->{Translation}->{'Config item history.'} = 'Configura cronologia articoli.';
    $Self->{Translation}->{'Config item print.'} = 'Stampa elemento di configurazione.';
    $Self->{Translation}->{'Config item zoom.'} = 'Configura lo zoom dell\'oggetto.';
    $Self->{Translation}->{'ConfigItemNumber'} = 'ConfigItemNumber';
    $Self->{Translation}->{'Configuration Item Limit'} = 'Limite elemento di configurazione';
    $Self->{Translation}->{'Configuration Item limit per page.'} = 'Limite elemento di configurazione per pagina.';
    $Self->{Translation}->{'Configuration Management Database.'} = 'Database di gestione della configurazione.';
    $Self->{Translation}->{'Configuration item bulk module.'} = 'Modulo di massa elemento di configurazione.';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        '';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = 'Crea e gestisci le definizioni per gli elementi di configurazione.';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to create ITSM configuration items using the Generic Interface.'} =
        'Definisce i permessi necessari per creare elementi di configurazione ITSM utilizzando l\'interfaccia generica.';
    $Self->{Translation}->{'Defines Required permissions to delete ITSM configuration items using the Generic Interface.'} =
        'Definisce i permessi necessari per eliminare gli elementi di configurazione ITSM utilizzando l\'interfaccia generica.';
    $Self->{Translation}->{'Defines Required permissions to get ITSM configuration items using the Generic Interface.'} =
        'Definisce i permessi necessari per ottenere gli elementi di configurazione ITSM utilizzando l\'interfaccia generica.';
    $Self->{Translation}->{'Defines Required permissions to search ITSM configuration items using the Generic Interface.'} =
        'Definisce i permessi necessari per la ricerca degli elementi di configurazione ITSM utilizzando l\'interfaccia generica.';
    $Self->{Translation}->{'Defines Required permissions to update ITSM configuration items using the Generic Interface.'} =
        'Definisce i permessi necessari per aggiornare gli elementi di configurazione ITSM utilizzando l\'interfaccia generica.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        'Definisce un modulo di panoramica per mostrare la vista ridotta di un elenco di elementi di configurazione.';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        'Definisce le espressioni regolari singolarmente per ciascuna classe ConfigItem per controllare il nome ConfigItem e mostrare i messaggi di errore corrispondenti.';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        'Definisce il sotto-oggetto predefinito della classe \'ITSMConfigItem\'.';
    $Self->{Translation}->{'Defines the number of rows for the CI definition editor in the admin interface.'} =
        'Definisce il numero di righe per CI l\'editor delle definizioni degli elementi della configurazione nell\'interfaccia di amministrazione.';
    $Self->{Translation}->{'Defines the order of incident states from high (e.g. cricital) to low (e.g. functional).'} =
        'Definisce l\'ordine degli stati degli incidenti da alto (es. critico) a basso (es. funzionale).';
    $Self->{Translation}->{'Defines the relevant deployment states where linked tickets can affect the status of a CI.'} =
        'Definisce gli stati di distribuzione pertinenti in cui i ticket collegati possono influire sullo stato di un CI.';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItem screen.'} =
        'Definisce il limite di ricerca per la schermata AgentITSMConfigItem.';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItemSearch screen.'} =
        'Definisce il limite di ricerca per la schermata AgentITSMConfigItemSearch.';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected.'} =
        'Definisce le colonne visualizzate nella panoramica degli elementi di configurazione. Questa opzione non ha alcun effetto sulla posizione della colonna. Nota: la colonna Classe è sempre disponibile se è selezionato il filtro "Tutto".';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} =
        'Definisce le colonne visualizzate nella ricerca degli elementi di configurazione. Questa opzione non ha alcun effetto sulla posizione della colonna.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item overview depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'Definisce le colonne mostrate degli elementi della configurazione nella panoramica degli elementi di configurazione in base alla classe CI. Ogni voce deve essere preceduta da un nome di classe e due punti (ad esempio Computer::). Esistono alcuni attributi CI comuni a tutti gli elementi della configurazione (esempio per la classe Computer:Computer::Nome, Computer::CurDeplState, Computer::CreateTime). Per mostrare singoli attributi CI come definiti nella definizione CI, è necessario utilizzare il seguente schema (esempio per la classe Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacità::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacità::1. Se non è presente alcuna voce per una classe CI, le colonne predefinite vengono visualizzate come definito nell\'impostazione ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item search depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'Definisce le colonne mostrate degli elementi della configurazione nella ricerca degli elementi di configurazione in base alla classe CI. Ogni voce deve essere preceduta da un nome di classe e due punti (ad esempio Computer::). Esistono alcuni attributi CI comuni a tutti gli elementi della configurazione (esempio per la classe Computer:Computer::Nome, Computer::CurDeplState, Computer::CreateTime). Per mostrare singoli attributi CI come definiti nella definizione CI, è necessario utilizzare il seguente schema (esempio per la classe Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. Se non è presente alcuna voce per una classe CI, le colonne predefinite vengono visualizzate come definito nell\'impostazione ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item widget depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting AgentCustomerInformationCenter::Backend###0060-CIC-ITSMConfigItemCustomerCompany (key DefaultColumns).'} =
        'Definisce le colonne visualizzate degli elementi della configurazione nel widget dell\'elemento di configurazione in base alla classe CI. Ogni voce deve essere preceduta da un nome di classe e due punti (ad esempio Computer::). Esistono alcuni attributi CI comuni a tutti gli elementi della configurazione (esempio per la classe Computer: Computer::Nome, Computer::CurDeplState, Computer::CreateTime). Per mostrare singoli attributi CI come definiti nella definizione CI, è necessario utilizzare il seguente schema (esempio per la classe Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer:::HardDisk::2, Computer::HardDisk::2::Capacity::1. Se non è presente alcuna voce per una classe CI, le colonne predefinite vengono visualizzate come definito nell\'impostazione AgentCustomerInformationCenter::Backend###0060-CIC-ITSMConfigItemCustomerCompany (chiave DefaultColumns).';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view for all CI classes. If there is no entry, then the default columns are shown.'} =
        'Definisce le colonne di visualizzate degli elementi della configurazione di CIs nella vista complessa della tabella dei collegamenti per tutte le classi CI. Se non è presente alcuna voce, vengono visualizzate le colonne predefinite.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view, depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown.'} =
        'Definisce le colonne visualizzate degli elementi della configurazione nella vista complessa della tabella dei collegamenti, a seconda della classe CI. Ogni voce deve essere preceduta da un nome di classe e due punti (ad esempio Computer::). Esistono alcuni attributi CI comuni a tutti gli elementi della configurazione (esempio per la classe Computer: Computer::Nome, Computer::CurDeplState, Computer::CreateTime). Per mostrare singoli attributi CI come definiti nella definizione CI, è necessario utilizzare il seguente schema (esempio per la classe Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. Se non è presente alcuna voce per una classe CI, vengono visualizzate le colonne predefinite.';
    $Self->{Translation}->{'Defines which type of link (named from the ticket perspective) can affect the status of a linked CI.'} =
        'Definisce quale tipo di collegamento (denominato dalla prospettiva del ticket) può influire sullo stato di un elemento della configurazione collegato CI.';
    $Self->{Translation}->{'Defines which type of ticket can affect the status of a linked CI.'} =
        'Definisce quale tipo di ticket può influire sullo stato di un elemento della configurazione collegato CI. ';
    $Self->{Translation}->{'Delete Configuration Item'} = 'Elimina elemento di configurazione';
    $Self->{Translation}->{'Deployment State Color'} = 'Colore dello stato di distribuzione';
    $Self->{Translation}->{'Duplicate'} = 'Duplicato';
    $Self->{Translation}->{'Enables configuration item bulk action feature for the agent frontend to work on more than one configuration item at a time.'} =
        'Abilita la funzione di azione in blocco degli elementi di configurazione affinché il frontend dell\'agente funzioni su più di un elemento di configurazione alla volta.';
    $Self->{Translation}->{'Enables configuration item bulk action feature only for the listed groups.'} =
        'Abilita la funzione di azione in blocco dell\'elemento di configurazione solo per i gruppi elencati.';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        'Abilita / disabilita la funzionalità per controllare ConfigItems per nomi univoci. Prima di abilitare questa opzione, è necessario controllare il sistema per elementi di configurazione già esistenti con nomi duplicati. Puoi farlo con lo script bin/otrs.ITSMConfigItemListDuplicates.pl.';
    $Self->{Translation}->{'Event module to set configitem-status on ticket-configitem-link.'} =
        'Modulo evento per impostare lo stato di configurazione su ticket-configitem-link.';
    $Self->{Translation}->{'ITSM config item overview.'} = 'Panoramica degli elementi di configurazione ITSM.';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = 'Modulo per controllare il gruppo responsabile per una classe.';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        'Modulo per verificare il gruppo responsabile di un elemento di configurazione.';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = 'Modulo per generare le statistiche degli elementi di configurazione ITSM.';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        'Registrazione del modulo back-end oggetto per il modulo di importazione / esportazione.';
    $Self->{Translation}->{'Overview.'} = 'Vista Globale.';
    $Self->{Translation}->{'Parameters for the dashboard backend of the customer company config item overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.'} =
        'Parametri per il back-end del dashboard della panoramica degli articoli di configurazione della società cliente dell\'interfaccia agenti. "Limite" è il numero di voci visualizzate per impostazione predefinita. "Gruppo" viene utilizzato per limitare l\'accesso al plug-in (ad es. Gruppo: admin; gruppo1; gruppo2;). "Predefinito" determina se il plug-in è abilitato per impostazione predefinita o se l\'utente deve abilitarlo manualmente. "CacheTTLLocal" è il tempo di cache in minuti per il plugin.';
    $Self->{Translation}->{'Parameters for the deployment states color in the preferences view of the agent interface.'} =
        'I parametri per gli stati di distribuzione colorano nella vista delle preferenze dell\'interfaccia agenti.';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        'Parametri per gli stati di distribuzione nella vista delle preferenze dell\'interfaccia agenti.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Parametri per i gruppi di permessi di esempio degli attributi del catalogo generale.';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        'Parametri per le pagine (nelle quali gli elementi di configurazione sono mostrati).';
    $Self->{Translation}->{'Permission Group'} = 'Gruppo di autorizzazioni';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} =
        'Permessi necessari per utilizzare la schermata dell\'elemento di configurazione ITSM nell\'interfaccia agenti.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} =
        'Permessi necessari per utilizzare la schermata di ricerca degli elementi della configurazione ITSM nell\'interfaccia agenti.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} =
        'Permessi necessari per utilizzare la schermata di zoom dell\'elemento di configurazione ITSM nell\'interfaccia agenti.';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} =
        'Permessi necessari per utilizzare la schermata Aggiungi elemento di configurazione ITSM nell\'interfaccia agenti.';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} =
        'Permessi necessari per utilizzare la schermata di modifica dell\'elemento di configurazione ITSM nell\'interfaccia agenti.';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} =
        'Permessi necessari per utilizzare la schermata dell\'elemento di configurazione ITSM della cronologia nell\'interfaccia agenti.';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} =
        'Permessi necessari per utilizzare la schermata di stampa dell\'elemento di configurazione ITSM nell\'interfaccia agenti.';
    $Self->{Translation}->{'Required privileges to delete config items.'} = 'Privilegi richiesti per eliminare gli elementi di configurazione.';
    $Self->{Translation}->{'Search config items.'} = 'Cerca elementi di configurazione.';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        'Seleziona il modulo generatore del numero di elemento di configurazione. "AutoIncrement" incrementa il numero della voce di configurazione, vengono utilizzati SystemID, ConfigItemClassID e il contatore. Il formato è "SystemID.ConfigItemClassID.Counter", ad es. 1205000004, 1205000005.';
    $Self->{Translation}->{'Set the incident state of a CI automatically when a Ticket is Linked to a CI.'} =
        'Imposta automaticamente lo stato dell\'incidente di un elemento della configurazione quando un ticket è collegato a un elemento della configurazione.';
    $Self->{Translation}->{'Sets the deployment state in the configuration item bulk screen of the agent interface.'} =
        'Imposta lo stato di distribuzione nella schermata di massa degli elementi di configurazione dell\'interfaccia agenti.';
    $Self->{Translation}->{'Sets the incident state in the configuration item bulk screen of the agent interface.'} =
        'Imposta lo stato dell\'incidente nella schermata in blocco dell\'articolo di configurazione dell\'interfaccia agenti.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        'Mostra un collegamento nel menu che consente di collegare un elemento di configurazione con un altro oggetto nella vista zoom elemento di configurazione dell\'interfaccia agenti.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the configuration item overview of the agent interface.'} =
        'Mostra un collegamento nel menu per accedere alla cronologia di un elemento di configurazione nella panoramica degli elementi di configurazione dell\'interfaccia agenti.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        'Mostra un collegamento nel menu per accedere alla cronologia di un elemento di configurazione nella vista zoom dell\'interfaccia agenti.';
    $Self->{Translation}->{'Shows a link in the menu to delete a configuration item in its zoom view of the agent interface.'} =
        'Mostra un collegamento nel menu per eliminare un elemento di configurazione nella sua vista zoom dell\'interfaccia agenti.';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the configuration item overview of the agent interface.'} =
        'Mostra un collegamento nel menu per duplicare un elemento di configurazione nella panoramica degli elementi di configurazione dell\'interfaccia agenti.';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        'Mostra un collegamento nel menu per duplicare un elemento di configurazione nella sua vista zoom dell\'interfaccia agenti.';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        'Mostra un collegamento nel menu per modificare un elemento di configurazione nella sua vista zoom dell\'interfaccia agenti.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuration item zoom view of the agent interface.'} =
        'Mostra un collegamento nel menu per tornare indietro nella vista zoom della voce di configurazione dell\'interfaccia agenti.';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        'Mostra un collegamento nel menu per stampare un elemento di configurazione nella sua vista zoom dell\'interfaccia agenti.';
    $Self->{Translation}->{'Shows a link in the menu to zoom into a configuration item in the configuration item overview of the agent interface.'} =
        'Mostra un collegamento nel menu per ingrandire una voce di configurazione nella panoramica delle voci di configurazione dell\'interfaccia agenti.';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        'Mostra la cronologia degli articoli di configurazione (ordine inverso) nell\'interfaccia agenti.';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        'L\'identificatore per un elemento di configurazione, ad es. ConfigItem#, MyConfigItem#. L\'impostazione predefinita è ConfigItem#.';
    $Self->{Translation}->{'class'} = 'classe';
    $Self->{Translation}->{'global'} = 'globale';
    $Self->{Translation}->{'postproductive'} = 'postproductive';
    $Self->{Translation}->{'preproductive'} = 'preproductive';
    $Self->{Translation}->{'productive'} = 'produttiva';


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
