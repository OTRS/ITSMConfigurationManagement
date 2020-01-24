# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Language::pt_ITSMConfigurationManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Gestão de Itens de Configuração';
    $Self->{Translation}->{'Change class definition'} = 'Mudar definição de classe';
    $Self->{Translation}->{'Config Item Class'} = '';
    $Self->{Translation}->{'Definition'} = 'Definição';
    $Self->{Translation}->{'Change'} = 'Alterar';

    # Template: AgentDashboardITSMConfigItemGeneric
    $Self->{Translation}->{'Incident State'} = 'Estado de Incidente';
    $Self->{Translation}->{'Deployment State'} = 'Estado de Implementação';
    $Self->{Translation}->{'Class'} = 'Classe';
    $Self->{Translation}->{'Deployment State Type'} = 'Tipo de Estado de Implementação';
    $Self->{Translation}->{'Current Incident State'} = 'Estado do Incidente Atual';
    $Self->{Translation}->{'Current Incident State Type'} = 'Estado Atual de Incidente por tipo';
    $Self->{Translation}->{'Last changed'} = 'Última modificação';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = 'Item de Configuração';
    $Self->{Translation}->{'Filter for Classes'} = 'Filtro para Classes';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'Selecione uma classe a partir da lista para criar um novo item de configuração.';

    # Template: AgentITSMConfigItemBulk
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = '';
    $Self->{Translation}->{'Deployment state'} = 'Estado de Implementação';
    $Self->{Translation}->{'Incident state'} = 'Estado de incidente';
    $Self->{Translation}->{'Link to another'} = '';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = '';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = '';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = '';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'O nome deste item de configuração';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        '';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = '';
    $Self->{Translation}->{'History Content'} = 'Histórico do conteúdo';
    $Self->{Translation}->{'Createtime'} = 'Hora de criação';
    $Self->{Translation}->{'Zoom view'} = 'Vista de detalhe';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Configurações de Contexto';
    $Self->{Translation}->{'Config Items per page'} = 'Itens de configuração por página';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = '';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Run Search'} = 'Executar Pesquisa';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Procurar nas versões anteriores também?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'Item de configuração';
    $Self->{Translation}->{'Configuration Item Information'} = 'Informação do Item de Configuração';
    $Self->{Translation}->{'Current Deployment State'} = 'Estado de Implementação Atual';
    $Self->{Translation}->{'Last changed by'} = 'Última modificação por';
    $Self->{Translation}->{'Show one version'} = 'Visualizar uma versão';
    $Self->{Translation}->{'Show all versions'} = 'Visualizar todas as versões';
    $Self->{Translation}->{'Version Incident State'} = 'Estado da Versão de Incidentes';
    $Self->{Translation}->{'Version Deployment State'} = '';
    $Self->{Translation}->{'Version Number'} = 'Número da versão';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Detalhes da Versão do Item de Configuração';
    $Self->{Translation}->{'Property'} = 'Propriedade';

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
    $Self->{Translation}->{'New ConfigItem (ID=%s)'} = '';
    $Self->{Translation}->{'New version (ID=%s)'} = '';
    $Self->{Translation}->{'Deployment state updated (new=%s, old=%s)'} = '';
    $Self->{Translation}->{'Incident state updated (new=%s, old=%s)'} = '';
    $Self->{Translation}->{'ConfigItem (ID=%s) deleted'} = '';
    $Self->{Translation}->{'Link to %s (type=%s) added'} = '';
    $Self->{Translation}->{'Link to %s (type=%s) deleted'} = '';
    $Self->{Translation}->{'ConfigItem definition updated (ID=%s)'} = '';
    $Self->{Translation}->{'Name updated (new=%s, old=%s)'} = '';
    $Self->{Translation}->{'Attribute %s updated from "%s" to "%s"'} = '';
    $Self->{Translation}->{'Version %s deleted'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'No ConfigItemID or VersionID is given!'} = '';
    $Self->{Translation}->{'Can\'t show config item, no access rights given!'} = '';
    $Self->{Translation}->{'ConfigItemID %s not found in database!'} = '';
    $Self->{Translation}->{'VersionID %s not found in database!'} = '';
    $Self->{Translation}->{'ConfigItem'} = 'Item de configuração';
    $Self->{Translation}->{'printed by %s at %s'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'Invalid ClassID!'} = '';
    $Self->{Translation}->{'No ClassID is given!'} = '';
    $Self->{Translation}->{'No access rights for this class given!'} = '';
    $Self->{Translation}->{'No Result!'} = 'Sem resultado!';
    $Self->{Translation}->{'Config Item Search Results'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemZoom.pm
    $Self->{Translation}->{'Can\'t show item, no access rights for ConfigItem are given!'} =
        '';
    $Self->{Translation}->{'operational'} = '';
    $Self->{Translation}->{'warning'} = '';
    $Self->{Translation}->{'incident'} = '';
    $Self->{Translation}->{'The deployment state of this config item'} = 'O estado de implementação do item de configuração';
    $Self->{Translation}->{'The incident state of this config item'} = 'O estado de incidente deste item de configuração';

    # Perl Module: Kernel/Output/HTML/Dashboard/ITSMConfigItemGeneric.pm
    $Self->{Translation}->{'Shown config items'} = '';

    # Perl Module: Kernel/Output/HTML/ITSMConfigItem/LayoutDate.pm
    $Self->{Translation}->{'Between'} = 'Entre';

    # Perl Module: Kernel/System/ImportExport/ObjectBackend/ITSMConfigItem.pm
    $Self->{Translation}->{'Maximum number of one element'} = 'Número máximo de um elemento';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'Os campos vazios indicam que os valores atuais são mantidos';
    $Self->{Translation}->{'Skipped'} = 'Desconsiderados';

    # Perl Module: var/packagesetup/ITSMConfigurationManagement.pm
    $Self->{Translation}->{'Model'} = 'Modelo';
    $Self->{Translation}->{'Customer Company'} = '';
    $Self->{Translation}->{'Serial Number'} = 'Número de Série';
    $Self->{Translation}->{'CPU'} = 'Processador';
    $Self->{Translation}->{'Ram'} = 'Memória RAM';
    $Self->{Translation}->{'Hard Disk'} = 'Disco Rígido';
    $Self->{Translation}->{'Capacity'} = 'Capacidade';
    $Self->{Translation}->{'Network Adapter'} = 'Adaptador de Rede';
    $Self->{Translation}->{'IP over DHCP'} = 'DHCP';
    $Self->{Translation}->{'IP Address'} = 'Endereço IP';
    $Self->{Translation}->{'Graphic Adapter'} = 'Adaptador Gráfico';
    $Self->{Translation}->{'Other Equipment'} = 'Outro Equipamento';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Data de Expiração da Garantia';
    $Self->{Translation}->{'Install Date'} = 'Data Instalação';
    $Self->{Translation}->{'Phone 1'} = 'Telefone 1';
    $Self->{Translation}->{'Phone 2'} = 'Telefone 2';
    $Self->{Translation}->{'E-Mail'} = '';
    $Self->{Translation}->{'Network Address'} = 'Endereço de Rede';
    $Self->{Translation}->{'Subnet Mask'} = 'Máscara de rede';
    $Self->{Translation}->{'Gateway'} = '';
    $Self->{Translation}->{'Licence Type'} = 'Tipo de Licença';
    $Self->{Translation}->{'Licence Key'} = 'Chave de Licença';
    $Self->{Translation}->{'Quantity'} = 'QuantAntiguidade';
    $Self->{Translation}->{'Expiration Date'} = 'Data de Expiração';
    $Self->{Translation}->{'Media'} = 'Media';

    # Database XML Definition: ITSMConfigurationManagement.sopm
    $Self->{Translation}->{'Computer'} = '';
    $Self->{Translation}->{'Hardware'} = '';
    $Self->{Translation}->{'Network'} = '';
    $Self->{Translation}->{'Software'} = '';
    $Self->{Translation}->{'Expired'} = 'Expirado';
    $Self->{Translation}->{'Maintenance'} = 'Manutenção';
    $Self->{Translation}->{'Pilot'} = 'Piloto';
    $Self->{Translation}->{'Planned'} = 'Planeado';
    $Self->{Translation}->{'Repair'} = 'Reparação';
    $Self->{Translation}->{'Retired'} = 'Retirado';
    $Self->{Translation}->{'Review'} = 'Revisão';
    $Self->{Translation}->{'Test/QA'} = 'Teste de Qualidade';
    $Self->{Translation}->{'Laptop'} = 'portátil';
    $Self->{Translation}->{'Desktop'} = 'Área ';
    $Self->{Translation}->{'PDA'} = '';
    $Self->{Translation}->{'Server'} = 'Servidor';
    $Self->{Translation}->{'Other'} = 'Outro';
    $Self->{Translation}->{'Monitor'} = '';
    $Self->{Translation}->{'Printer'} = 'Impressora';
    $Self->{Translation}->{'Switch'} = 'Switch';
    $Self->{Translation}->{'Router'} = 'Router';
    $Self->{Translation}->{'WLAN Access Point'} = '';
    $Self->{Translation}->{'Security Device'} = 'Dispositivo de Segurança';
    $Self->{Translation}->{'Backup Device'} = 'Dispositivo de Backup';
    $Self->{Translation}->{'Mouse'} = 'rato';
    $Self->{Translation}->{'Keyboard'} = 'Teclado';
    $Self->{Translation}->{'Camera'} = 'Câmara';
    $Self->{Translation}->{'Beamer'} = 'Projetor';
    $Self->{Translation}->{'Modem'} = '';
    $Self->{Translation}->{'PCMCIA Card'} = 'Placa PCMCIA';
    $Self->{Translation}->{'USB Device'} = 'Dispositivo USB';
    $Self->{Translation}->{'Docking Station'} = '';
    $Self->{Translation}->{'Scanner'} = 'Scanner';
    $Self->{Translation}->{'Building'} = 'Prédio';
    $Self->{Translation}->{'Office'} = 'Gabinete';
    $Self->{Translation}->{'Floor'} = 'Piso';
    $Self->{Translation}->{'Room'} = 'Sala';
    $Self->{Translation}->{'Rack'} = '';
    $Self->{Translation}->{'Workplace'} = 'Local de Trabalho';
    $Self->{Translation}->{'Outlet'} = 'Tomada';
    $Self->{Translation}->{'IT Facility'} = 'Departamento de TI';
    $Self->{Translation}->{'LAN'} = 'REDE';
    $Self->{Translation}->{'WLAN'} = '';
    $Self->{Translation}->{'Telco'} = 'Telecomunicações';
    $Self->{Translation}->{'GSM'} = '';
    $Self->{Translation}->{'Client Application'} = 'Aplicação Cliente';
    $Self->{Translation}->{'Middleware'} = '';
    $Self->{Translation}->{'Server Application'} = 'Servidor Aplicacional ';
    $Self->{Translation}->{'Client OS'} = 'SO Cliente';
    $Self->{Translation}->{'Server OS'} = 'SO Servidor';
    $Self->{Translation}->{'Admin Tool'} = 'Ferramenta de Administração';
    $Self->{Translation}->{'User Tool'} = 'Ferramenta de Utilizador';
    $Self->{Translation}->{'Embedded'} = 'Integrado';
    $Self->{Translation}->{'Single Licence'} = 'Licença Única';
    $Self->{Translation}->{'Per User'} = 'Por Utilizador';
    $Self->{Translation}->{'Per Processor'} = 'Por Processador';
    $Self->{Translation}->{'Per Server'} = 'Por Servidor';
    $Self->{Translation}->{'Per Node'} = 'Por Posto';
    $Self->{Translation}->{'Volume Licence'} = 'Licença por Volume';
    $Self->{Translation}->{'Enterprise Licence'} = 'Licença Corporativa';
    $Self->{Translation}->{'Developer Licence'} = 'Licença de desenvolvimento';
    $Self->{Translation}->{'Demo'} = 'Demonstração';
    $Self->{Translation}->{'Time Restricted'} = 'Tempo Restrito';
    $Self->{Translation}->{'Freeware'} = 'Livre';
    $Self->{Translation}->{'Open Source'} = 'Código aberto';
    $Self->{Translation}->{'Unlimited'} = 'Ilimitada';

    # JS File: ITSM.Agent.ConfigItem.Zoom
    $Self->{Translation}->{'Ok'} = 'Ok';

    # SysConfig
    $Self->{Translation}->{'Assigned CIs'} = '';
    $Self->{Translation}->{'CIs assigned to customer company'} = '';
    $Self->{Translation}->{'CIs assigned to customer user'} = '';
    $Self->{Translation}->{'CMDB Settings'} = '';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        '';
    $Self->{Translation}->{'Config Items'} = 'Itens de Configuração';
    $Self->{Translation}->{'Config item add.'} = '';
    $Self->{Translation}->{'Config item edit.'} = '';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        'Módulo de evento de item de configuração que permite registar o histórico da interface do agente.';
    $Self->{Translation}->{'Config item history.'} = '';
    $Self->{Translation}->{'Config item print.'} = '';
    $Self->{Translation}->{'Config item zoom.'} = '';
    $Self->{Translation}->{'ConfigItemNumber'} = '';
    $Self->{Translation}->{'Configuration Item Limit'} = 'Limite de Items de Configuração';
    $Self->{Translation}->{'Configuration Item limit per page.'} = '';
    $Self->{Translation}->{'Configuration Management Database.'} = '';
    $Self->{Translation}->{'Configuration item bulk module.'} = '';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        'Router de pesquisa de item de configuração da interface do agente.';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = 'Criar e gerir as definições de Itens de Configuração.';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        'Definir Acções onde um botão de configurações está disponível na widget the objectos ligados (LinkObject::ViewMode = "complex").  Estas Acções devem estar registadas nos seguintes ficheiros JS e CSS: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.';
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
        'Define um módulo de vista geral para mostrar a vista pequena da lista de itens de configuração.';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        '';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        'Define o subobjeto por omissão da classe \'ITSMConfigItem\'.';
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
        'Define as colunas mostradas na busca de item de configuração. Esta opção não tem efeito sobre a posição da coluna.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item overview depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item search depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item widget depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting AgentCustomerInformationCenter::Backend###0060-CIC-ITSMConfigItemCustomerCompany (key DefaultColumns).'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view for all CI classes. If there is no entry, then the default columns are shown.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view, depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown.'} =
        '';
    $Self->{Translation}->{'Defines which type of link (named from the ticket perspective) can affect the status of a linked CI.'} =
        '';
    $Self->{Translation}->{'Defines which type of ticket can affect the status of a linked CI.'} =
        '';
    $Self->{Translation}->{'Delete Configuration Item'} = '';
    $Self->{Translation}->{'Deployment State Color'} = '';
    $Self->{Translation}->{'Duplicate'} = 'Duplicar';
    $Self->{Translation}->{'Enables configuration item bulk action feature for the agent frontend to work on more than one configuration item at a time.'} =
        '';
    $Self->{Translation}->{'Enables configuration item bulk action feature only for the listed groups.'} =
        '';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        '';
    $Self->{Translation}->{'Event module to set configitem-status on ticket-configitem-link.'} =
        '';
    $Self->{Translation}->{'ITSM config item overview.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = 'Módulo para verificar o grupo responsável por uma classe.';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        'Módulo para verificar o grupo responsável por um item de configuração.';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = 'Módulo para gerar estatísticas do item de configuração ITSM.';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        'Modulo de registo de objeto para o módulo de importação/exportação.';
    $Self->{Translation}->{'Overview.'} = 'Visão Geral.';
    $Self->{Translation}->{'Parameters for the dashboard backend of the customer company config item overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.'} =
        '';
    $Self->{Translation}->{'Parameters for the deployment states color in the preferences view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        'Parâmetros de estado de implementação nas preferências de visualização da interface de agente.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Parâmetros do grupos de permissão de exemplo dos atributos do catálogo geral.';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        'Parâmetros das páginas (nas quais os itens de configuração são visualizados).';
    $Self->{Translation}->{'Permission Group'} = '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} =
        'Permissões necessárias para usar o formulário de item de configuração ITSM de agente.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} =
        'Permissões necessárias para usar o formulário de pesquisa de item de configuração ITSM de agente.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} =
        'Permissões necessárias para usar o formulário de detalhes do item de configuração ITSM de agente.';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} =
        'Permissões necessárias para usar o formulário de adição de item de configuração ITSM de agente.';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} =
        'Permissões necessárias para usar o formulário de edição de item de configuração ITSM de agente.';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} =
        'Permissões necessárias para usar o formulário de histórico de item de configuração ITSM de agente.';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} =
        'Permissões necessárias para usar o formulário de impressão de item de configuração ITSM na interface do agente.';
    $Self->{Translation}->{'Required privileges to delete config items.'} = '';
    $Self->{Translation}->{'Search config items.'} = '';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        'Seleciona o módulo de geração de número de item de configuração. "Autoincremento" incrementa o número do item de configuração, o SystemID, o ConfigItemClassID e o Counter são utilizados. O formato é "SystemID.ConfigItemClassID.Counter", por exemplo, 1205000004, 1205000005.';
    $Self->{Translation}->{'Set the incident state of a CI automatically when a Ticket is Linked to a CI.'} =
        '';
    $Self->{Translation}->{'Sets the deployment state in the configuration item bulk screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Sets the incident state in the configuration item bulk screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        'Mostra um link no menu que permite associar um item de configuração a outro objeto na vista de detalhes do item de configuração de agente.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the configuration item overview of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        'Mostra um link no menu para aceder o histórico de item de configuração na vista de agente.';
    $Self->{Translation}->{'Shows a link in the menu to delete a configuration item in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the configuration item overview of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        'Mostra um link no menu para duplicar um item de configuração na vista de agente.';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        'Mostra um link no menu para editar um item de configuração na vista de agente.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuration item zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        'Mostra um link no menu para imprimir um item de configuração na vista de detalhes de agente.';
    $Self->{Translation}->{'Shows a link in the menu to zoom into a configuration item in the configuration item overview of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        'Mostra o histórico do item configuração (ordem inversa) no interface de agente.';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        '';
    $Self->{Translation}->{'class'} = '';
    $Self->{Translation}->{'global'} = '';
    $Self->{Translation}->{'postproductive'} = '';
    $Self->{Translation}->{'preproductive'} = '';
    $Self->{Translation}->{'productive'} = '';


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
