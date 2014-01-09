# --
# Kernel/Language/pt_BR_ITSMConfigItem.pm - translation file
# Copyright (C) 2001-2014 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pt_BR_ITSMConfigItem;

use strict;
use warnings;

sub Data {
    my $Self = shift;

    # Template: AAAITSMConfigItem
    $Self->{Translation}->{'Address'} = 'Endereço';
    $Self->{Translation}->{'Admin Tool'} = 'Ferramenta de Administração';
    $Self->{Translation}->{'Backup Device'} = 'Dispositivo de Backup';
    $Self->{Translation}->{'Beamer'} = 'Projetor';
    $Self->{Translation}->{'Building'} = 'Prédio';
    $Self->{Translation}->{'CIHistory::ConfigItemCreate'} = 'Novo item de configuração (ID=%s)';
    $Self->{Translation}->{'CIHistory::ConfigItemDelete'} = 'Item de configuração (ID=%s) excluído';
    $Self->{Translation}->{'CIHistory::DefinitionUpdate'} = 'Definição do IC atualizada (ID=%s)';
    $Self->{Translation}->{'CIHistory::DeploymentStateUpdate'} = 'Estado de implantação alterado (novo=%s; antigo=%s)';
    $Self->{Translation}->{'CIHistory::IncidentStateUpdate'} = 'Estado de incidente alterado (novo=%s; antigo=%s)';
    $Self->{Translation}->{'CIHistory::LinkAdd'} = 'O link para %s (Typ=%s) foi adicionado';
    $Self->{Translation}->{'CIHistory::LinkDelete'} = 'O link para %s (Typ=%s) excluído';
    $Self->{Translation}->{'CIHistory::NameUpdate'} = 'Nome alterado (novo=%s; antigo=%s)';
    $Self->{Translation}->{'CIHistory::ValueUpdate'} = 'O atributo %s de "%s" para "%s" mudou';
    $Self->{Translation}->{'CIHistory::VersionCreate'} = 'Nova versão criada (ID=%s)';
    $Self->{Translation}->{'CIHistory::VersionDelete'} = 'Versão %s excluída';
    $Self->{Translation}->{'CIHistory::AttachmentAdd'} = 'Anexo (%s) adicionado';
    $Self->{Translation}->{'CIHistory::AttachmentDelete'} = 'Anexo (%s) excluído';
    $Self->{Translation}->{'CPU'} = 'Processador';
    $Self->{Translation}->{'Camera'} = 'Câmera';
    $Self->{Translation}->{'Capacity'} = 'Capacidade';
    $Self->{Translation}->{'Change Definition'} = 'Alterar Definição';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = 'Mudança de definição falhou! Veja o registro do sistema para mais detalhes.';
    $Self->{Translation}->{'Client Application'} = 'Aplicação Cliente';
    $Self->{Translation}->{'Client OS'} = 'SO Cliente';
    $Self->{Translation}->{'Concurrent Users'} = 'Usuários Concorrentes';
    $Self->{Translation}->{'Config Item-Area'} = 'Área Item de Configuração';
    $Self->{Translation}->{'Config Items available'} = 'Itens de Configuração disponíveis';
    $Self->{Translation}->{'Config Items shown'} = 'Itens de Configuração visualizados';
    $Self->{Translation}->{'CMDB'} = 'BDGC';
    $Self->{Translation}->{'Demo'} = 'Demonstração';
    $Self->{Translation}->{'Desktop'} = 'Área ';
    $Self->{Translation}->{'Developer Licence'} = 'Licença de Desenvolvedor';
    $Self->{Translation}->{'Docking Station'} = '';
    $Self->{Translation}->{'Duplicate'} = 'Duplicar';
    $Self->{Translation}->{'Embedded'} = 'Integrado';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'Os campos vazios indicam que os valores atuais são mantidos';
    $Self->{Translation}->{'Enterprise Licence'} = 'Licença Corporativa';
    $Self->{Translation}->{'Expiration Date'} = 'Data de Expiração';
    $Self->{Translation}->{'Expired'} = 'Expirado';
    $Self->{Translation}->{'FQDN'} = '';
    $Self->{Translation}->{'Floor'} = 'Andar';
    $Self->{Translation}->{'Freeware'} = 'Livre';
    $Self->{Translation}->{'GSM'} = '';
    $Self->{Translation}->{'Gateway'} = 'Roteador Padrão';
    $Self->{Translation}->{'Graphic Adapter'} = 'Adaptador Gráfico';
    $Self->{Translation}->{'Hard Disk'} = 'Disco Rígido';
    $Self->{Translation}->{'Hard Disk::Capacity'} = 'Disco Rígido::Capacidade';
    $Self->{Translation}->{'Hide Versions'} = 'Ocultar Versões';
    $Self->{Translation}->{'IP Address'} = 'Endereço IP';
    $Self->{Translation}->{'IP over DHCP'} = 'DHCP';
    $Self->{Translation}->{'IT Facility'} = 'Departamento de TI';
    $Self->{Translation}->{'Inactive'} = 'Inativo';
    $Self->{Translation}->{'Incident'} = 'Incidente';
    $Self->{Translation}->{'Install Date'} = 'Data Instalação';
    $Self->{Translation}->{'Keybord'} = 'Teclado';
    $Self->{Translation}->{'LAN'} = 'REDE';
    $Self->{Translation}->{'Laptop'} = 'Notebook';
    $Self->{Translation}->{'Last Change'} = 'Última Alteração';
    $Self->{Translation}->{'Licence Key'} = 'Chave de Licença';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = 'Chave de Licença::Data de Expiração';
    $Self->{Translation}->{'Licence Key::Quantity'} = 'Chave de Licença::Quantidade';
    $Self->{Translation}->{'Licence Type'} = 'Tipo de Licença';
    $Self->{Translation}->{'Maintenance'} = 'Manutenção';
    $Self->{Translation}->{'Maximum number of one element'} = 'Número máximo de um elemento';
    $Self->{Translation}->{'Media'} = 'Mídia';
    $Self->{Translation}->{'Middleware'} = '';
    $Self->{Translation}->{'Model'} = 'Modelo';
    $Self->{Translation}->{'Modem'} = '';
    $Self->{Translation}->{'Monitor'} = '';
    $Self->{Translation}->{'Mouse'} = '';
    $Self->{Translation}->{'Network Adapter'} = 'Adaptador de Rede';
    $Self->{Translation}->{'Network Adapter::IP Address'} = 'Adaptador de Rede::Endereço IP';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = 'Adaptador de Rede::DHCP';
    $Self->{Translation}->{'Network Address'} = 'Endereço de Rede';
    $Self->{Translation}->{'Network Address::Gateway'} = 'Endereço de Rede::Roteador Padrão';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = 'Endereço de Rede::Máscara de Subrede';
    $Self->{Translation}->{'Open Source'} = 'Código aberto';
    $Self->{Translation}->{'Operating System'} = 'Sistema Operacional';
    $Self->{Translation}->{'Operational'} = 'Operacional';
    $Self->{Translation}->{'Other'} = 'Outro';
    $Self->{Translation}->{'Other Equipment'} = 'Outro Equipamento';
    $Self->{Translation}->{'Outlet'} = 'Tomada';
    $Self->{Translation}->{'PCMCIA Card'} = 'Cartão PCMCIA';
    $Self->{Translation}->{'PDA'} = '';
    $Self->{Translation}->{'Per Node'} = 'Por Nó';
    $Self->{Translation}->{'Per Processor'} = 'Por Processador';
    $Self->{Translation}->{'Per Server'} = 'Por Servidor';
    $Self->{Translation}->{'Per User'} = 'Por Usuário';
    $Self->{Translation}->{'Phone 1'} = 'Telefone 1';
    $Self->{Translation}->{'Phone 2'} = 'Telefone 2';
    $Self->{Translation}->{'Pilot'} = 'Piloto';
    $Self->{Translation}->{'Planned'} = 'Planejado';
    $Self->{Translation}->{'Printer'} = 'Impressora';
    $Self->{Translation}->{'Production'} = 'Produção';
    $Self->{Translation}->{'Quantity'} = 'Quantidade';
    $Self->{Translation}->{'Rack'} = '';
    $Self->{Translation}->{'Ram'} = 'Memória RAM';
    $Self->{Translation}->{'Repair'} = 'Reparo';
    $Self->{Translation}->{'Retired'} = 'Retirado';
    $Self->{Translation}->{'Review'} = 'Revisão';
    $Self->{Translation}->{'Room'} = 'Sala';
    $Self->{Translation}->{'Router'} = 'Roteador';
    $Self->{Translation}->{'Scanner'} = '';
    $Self->{Translation}->{'Search Config Items'} = 'Pesquisar Itens de Configuração';
    $Self->{Translation}->{'Security Device'} = 'Dispositivo de Segurança';
    $Self->{Translation}->{'Serial Number'} = 'Número de Série';
    $Self->{Translation}->{'Server'} = 'Servidor';
    $Self->{Translation}->{'Server Application'} = 'Aplicação Servidor';
    $Self->{Translation}->{'Server OS'} = 'SO Servidor';
    $Self->{Translation}->{'Show Versions'} = 'Visualizar Versões';
    $Self->{Translation}->{'Single Licence'} = 'Licença Única';
    $Self->{Translation}->{'Subnet Mask'} = 'Máscara de Subrede';
    $Self->{Translation}->{'Switch'} = '';
    $Self->{Translation}->{'Telco'} = 'Telecomunicação';
    $Self->{Translation}->{'Test/QA'} = 'Teste de Qualidade';
    $Self->{Translation}->{'The deployment state of this config item'} = 'O estado de implantação deste item de configuração';
    $Self->{Translation}->{'The incident state of this config item'} = 'O estado de incidente deste item de configuração';
    $Self->{Translation}->{'Time Restricted'} = 'Tempo Restrito';
    $Self->{Translation}->{'USB Device'} = 'Dispositivo USB';
    $Self->{Translation}->{'Unlimited'} = 'Ilimitada';
    $Self->{Translation}->{'User Tool'} = 'Ferramenta do Usuário';
    $Self->{Translation}->{'Volume Licence'} = 'Licença por Volume';
    $Self->{Translation}->{'WLAN'} = '';
    $Self->{Translation}->{'WLAN Access Point'} = '';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Data de Expiração da Garantia';
    $Self->{Translation}->{'Workplace'} = 'Local de Trabalho';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Gerenciamento de Itens de Configuração';
    $Self->{Translation}->{'Change class definition'} = 'Mudar definição de classe';
    $Self->{Translation}->{'Config Item'} = 'Item de Configuração';
    $Self->{Translation}->{'Class'} = 'Classe';
    $Self->{Translation}->{'Definition'} = 'Definição';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Filter for Classes'} = 'Filtro para Classes';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'Selecione uma classe a partir da lista para criar um novo item de configuração.';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'O nome deste item de configuração';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        '';
    $Self->{Translation}->{'Deployment State'} = 'Estado de Implantação';
    $Self->{Translation}->{'Incident State'} = 'Estado de Incidente';

    # Template: AgentITSMConfigItemHistory

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Configurações de Contexto';
    $Self->{Translation}->{'Config Items per page'} = 'Itens de configuração por página';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'Deployment State Type'} = 'Tipo de Estado de Implantação';
    $Self->{Translation}->{'Current Incident State'} = 'Estado do Incidente Atual';
    $Self->{Translation}->{'Current Incident State Type'} = 'Estado Atual de Incidente por tipo';
    $Self->{Translation}->{'Last changed'} = 'Última modificação';

    # Template: AgentITSMConfigItemPrint
    $Self->{Translation}->{'ConfigItem'} = 'Item de configuração';
    $Self->{Translation}->{'ConfigItem-Info'} = ' Informação do Item de configuração';
    $Self->{Translation}->{'Current Deployment State'} = 'Estado de Implantação Atual';
    $Self->{Translation}->{'Last changed by'} = 'Última modificação por';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Create New Template'} = 'Criar novo Modelo';
    $Self->{Translation}->{'Run Search'} = 'Executar Pesquisa';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Procurar nas verões anteriores também?';

    # Template: AgentITSMConfigItemSearchResultPrint
    $Self->{Translation}->{'CreateTime'} = 'Tempo de criação';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'Item de configuração';
    $Self->{Translation}->{'Configuration Item Information'} = 'Informação do Item de Configuração';
    $Self->{Translation}->{'Show one version'} = 'Visualizar uma versão';
    $Self->{Translation}->{'Show all versions'} = 'Visualizar todas as versões';
    $Self->{Translation}->{'Version Incident State'} = 'Estado da Versão de Incidentes';
    $Self->{Translation}->{'Version Number'} = 'Número da versão';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Detalhes da Versão do Item de Configuração';
    $Self->{Translation}->{'Linked as'} = 'Associado como';
    $Self->{Translation}->{'Property'} = 'Propriedade';

    # SysConfig
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        '';
    $Self->{Translation}->{'Config Items'} = 'Itens de Configuração';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        'Módulo de evento de item de configuração que permite registrar o histórico da interface do atendente.';
    $Self->{Translation}->{'Configuration Item Limit'} = 'Limite de Item de Configuração';
    $Self->{Translation}->{'Configuration Item limit per page'} = 'Limite de Item de Configuração por página';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        'Roteador de pesquisa de item de configuração da interface do atendente.';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = 'Criar e gerenciar as definições de Itens de Configuração.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        'Define um módulo de visão geral para mostrar a visão pequena da lista de itens de configuração.';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        '';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        'Define o subobjeto padrão da classe \'ITSMConfigItem\'.';
    $Self->{Translation}->{'Defines the number of rows for the CI definition editor in the admin interface.'} =
        '';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItem screen.'} =
        '';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItemSearch screen.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected'} =
        'Define as colunas mostradas na visão geral de item de configuração. Esta opção não tem efeito sobre a posição da coluna. Nota: A coluna de classe está sempre disponível, se o filtro \'All\' é selecionado.';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} =
        'Define as colunas mostradas na busca de item de configuração. Esta opção não tem efeito sobre a posição da coluna.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item overview depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item search depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view, depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown.'} =
        '';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        '';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = 'Módulo para verificar o grupo responsável por uma classe.';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        'Módulo para verificar o grupo responsável por um item de configuração.';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = 'Módulo para gerar estatísticas do item de configuração ITSM.';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        'Modulo de registro de objeto para o módulo de importação/exportação.';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        'Parâmetros de estado de implantação nas preferências de exibição da interface de atendente.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Parâmetros do grupos de permissão de exemplo dos atributos do catálogo geral.';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        'Parâmetros das páginas (nas quais os itens de configuração são mostrados).';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} =
        'Permissões necessárias para usar a tela de item de configuração ITSM na interface de atendente.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} =
        'Permissões necessárias para usar a tela de pesquisa de item de configuração ITSM na interface de atendente.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} =
        'Permissões necessárias para usar a tela de detalhes do item de configuração ITSM na interface de atendente.';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} =
        'Permissões necessárias para usar a tela de adição de item de configuração ITSM na interface de atendente.';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} =
        'Permissões necessárias para usar a tela de edição de item de configuração ITSM na interface de atendente.';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} =
        'Permissões necessárias para usar a tela de histórico de item de configuração ITSM na interface de atendente.';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} =
        'Permissões necessárias para usar a tela de impressão de item de configuração ITSM na interface do atendente.';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        'Seleciona o módulo de geração de número de item de configuração. "Autoincremento" incrementa o número do item de configuração, o SystemID, o ConfigItemClassID e o Counter são usados. O formato é "SystemID.ConfigItemClassID.Counter", por exemplo, 1205000004, 1205000005.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        'Mostra um link no menu que permite associar um item de configuração com um outro objeto na visão de detalhes do item de configuração da interface de atendente.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        'Mostra um link no menu para acessar o histórico de item de configuração na visão de detalhes do mesmo na interface de atendente.';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        'Mostra um link no menu para duplicar um item de configuração na visão de detalhes do mesmo na interface de atendente.';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        'Mostra um link no menu para editar um item de configuração na visão de detalhes do mesmo na interface de atendente.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuraton item zoom view of the agent interface.'} =
        'Mostra um link no menu para retornar à tela de visão de detalhes de item de configuração da interface de atendente.';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        'Mostra um link no menu para imprimir um item de configuração na visão de detalhes do mesmo na interface de atendente.';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        'Mostra o histórico do item configuração (ordem reversa) na interface de atendente.';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        '';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #

}

1;
