# --
# Kernel/Language/pt_BR_ITSMConfigItem.pm - the Brazilian translation of ITSMConfigItem
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2010 Cristiano Korndörfer, http://www.dorfer.com.br/
# --
# $Id: pt_BR_ITSMConfigItem.pm,v 1.1 2010-03-01 09:48:20 mb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pt_BR_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = 'Item de Configuração';
    $Lang->{'Config Item-Area'}       = 'Itens de Configuração';
    $Lang->{'Config Item Management'} = 'Gerenciamento de Itens de Configuração';
    $Lang->{'Change Definition'}      = 'Mudar Definição';
    $Lang->{'Class'}                  = 'Classe';
    $Lang->{'Show Versions'}          = 'Visualizar Versões';
    $Lang->{'Hide Versions'}          = 'Ocultar Versões';
    $Lang->{'Last changed by'}        = 'Última modificação por';
    $Lang->{'Last changed'}           = 'Última modificação';
    $Lang->{'Change of definition failed! See System Log for details.'}
        = 'Mudança da definição falhou! Consulte o Log do Sistema para detalhes.';
    $Lang->{'Also search in previous versions?'} = 'Procurar nas verões anteriores também?';
    $Lang->{'Config Items shown'}                = 'Itens de Configuração visualizados';
    $Lang->{'Config Items available'}            = 'Itens de Configuração disponíveis';
    $Lang->{'Search Config Items'}               = 'Pesquisar Itens de Configuração';
    $Lang->{'Deployment State'}                  = 'Estado da Implantação';
    $Lang->{'Current Deployment State'}          = 'Estado da Implantação Atual';
    $Lang->{'Incident State'}                    = 'Estado do Incidente';
    $Lang->{'Current Incident State'}            = 'Estado do Incidente Atual';
    $Lang->{'The name of this config item'}      = 'O nome deste item de configuração';
    $Lang->{'The deployment state of this config item'}
        = 'O estado de implantação deste item de configuração';
    $Lang->{'The incident state of this config item'} = 'O estado de incidente deste item de configuração';
    $Lang->{'Last Change'}                            = 'Última Alteração';
    $Lang->{'Duplicate'}                              = 'Duplicar';
    $Lang->{'Expired'}                                = 'Expirado';
    $Lang->{'Inactive'}                               = 'Inativo';
    $Lang->{'Maintenance'}                            = 'Manutenção';
    $Lang->{'Pilot'}                                  = 'Piloto';
    $Lang->{'Planned'}                                = 'Planejado';
    $Lang->{'Production'}                             = 'Produção';
    $Lang->{'Repair'}                                 = 'Reparo';
    $Lang->{'Retired'}                                = 'Retirado';
    $Lang->{'Review'}                                 = 'Revisão';
    $Lang->{'Test/QA'}                                = 'Teste de Qualidade';
    $Lang->{'Operational'}                            = 'Operacional';
    $Lang->{'Incident'}                               = 'Incidente';
    $Lang->{'Desktop'}                                = '';
    $Lang->{'Laptop'}                                 = '';
    $Lang->{'Other'}                                  = 'Outro';
    $Lang->{'PDA'}                                    = '';
    $Lang->{'Phone'}                                  = 'Telefone';
    $Lang->{'Server'}                                 = 'Servidor';
    $Lang->{'Backup Device'}                          = 'Dispositivo de Backup';
    $Lang->{'Beamer'}                                 = '';
    $Lang->{'Camera'}                                 = '';
    $Lang->{'Docking Station'}                        = '';
    $Lang->{'Keybord'}                                = 'Teclado';
    $Lang->{'Modem'}                                  = '';
    $Lang->{'Monitor'}                                = '';
    $Lang->{'Mouse'}                                  = '';
    $Lang->{'Other'}                                  = 'Outro';
    $Lang->{'PCMCIA Card'}                            = 'Cartão PCMCIA';
    $Lang->{'Printer'}                                = 'Impressora';
    $Lang->{'Router'}                                 = 'Roteador';
    $Lang->{'Scanner'}                                = '';
    $Lang->{'Security Device'}                        = 'Dispositivo de Segurança';
    $Lang->{'Switch'}                                 = '';
    $Lang->{'USB Device'}                             = 'Dispositivo USB';
    $Lang->{'WLAN Access Point'}                      = '';
    $Lang->{'GSM'}                                    = '';
    $Lang->{'LAN'}                                    = 'REDE';
    $Lang->{'Other'}                                  = 'Outro';
    $Lang->{'Telco'}                                  = '';
    $Lang->{'WLAN'}                                   = '';
    $Lang->{'Admin Tool'}                             = 'Ferramenta de Administração';
    $Lang->{'Client Application'}                     = 'Aplicação Cliente';
    $Lang->{'Client OS'}                              = 'SO Cliente';
    $Lang->{'Embedded'}                               = '';
    $Lang->{'Middleware'}                             = '';
    $Lang->{'Other'}                                  = 'Outro';
    $Lang->{'Server Application'}                     = 'Aplicação Servidor';
    $Lang->{'Server OS'}                              = 'SO Servidor';
    $Lang->{'User Tool'}                              = 'Ferramenta do Usuário';
    $Lang->{'Concurrent Users'}                       = 'Usuários Concorrentes';
    $Lang->{'Demo'}                                   = '';
    $Lang->{'Developer Licence'}                      = 'Licença de Desenvolvedor';
    $Lang->{'Enterprise Licence'}                     = 'Licença Corporativa';
    $Lang->{'Freeware'}                               = '';
    $Lang->{'Open Source'}                            = '';
    $Lang->{'Per Node'}                               = 'Por Nó';
    $Lang->{'Per Processor'}                          = 'Por Processador';
    $Lang->{'Per Server'}                             = 'Por Servidor';
    $Lang->{'Per User'}                               = 'Por Usuário';
    $Lang->{'Single Licence'}                         = 'Licença Única';
    $Lang->{'Time Restricted'}                        = 'Tempo Restrito';
    $Lang->{'Unlimited'}                              = 'Ilimitada';
    $Lang->{'Volume Licence'}                         = 'Licença por Volume';
    $Lang->{'Model'}                                  = 'Modelo';
    $Lang->{'Serial Number'}                          = 'Número de Série';
    $Lang->{'Operating System'}                       = 'Sistema Operacional';
    $Lang->{'CPU'}                                    = 'Processador';
    $Lang->{'Ram'}                                    = 'Memória RAM';
    $Lang->{'Hard Disk'}                              = 'Disco Rígido';
    $Lang->{'Hard Disk::Capacity'}                    = 'Disco Rígido::Capacidade';
    $Lang->{'Capacity'}                               = 'Capacidade';
    $Lang->{'FQDN'}                                   = '';
    $Lang->{'Network Adapter'}                        = 'Adaptador de Rede';
    $Lang->{'Network Adapter::IP over DHCP'}          = 'Adaptador de Rede::DHCP';
    $Lang->{'Network Adapter::IP Address'}            = 'Adaptador de Rede::Endereço IP';
    $Lang->{'IP over DHCP'}                           = 'DHCP';
    $Lang->{'IP Address'}                             = 'Endereço IP';
    $Lang->{'Graphic Adapter'}                        = 'Adaptador Gráfico';
    $Lang->{'Other Equipment'}                        = 'Outro Equipamento';
    $Lang->{'Warranty Expiration Date'}               = 'Data de Expiração da Garantia';
    $Lang->{'Install Date'}                           = 'Data Instalação';
    $Lang->{'Network Address'}                        = 'Endereço de Rede';
    $Lang->{'Network Address::Subnet Mask'}           = 'Endereço de Rede::Máscara de Subrede';
    $Lang->{'Network Address::Gateway'}               = 'Endereço de Rede::Roteador Padrão';
    $Lang->{'Subnet Mask'}                            = 'Máscara de Subrede';
    $Lang->{'Gateway'}                                = 'Roteador Padrão';
    $Lang->{'Licence Type'}                           = 'Tipo de Licença';
    $Lang->{'Licence Key'}                            = 'Chave de Licença';
    $Lang->{'Licence Key::Quantity'}                  = 'Chave de Licença::Quantidade';
    $Lang->{'Licence Key::Expiration Date'}           = 'Chave de Licença::Data de Expiração';
    $Lang->{'Quantity'}                               = 'Quantidade';
    $Lang->{'Expiration Date'}                        = 'Data de Expiração';
    $Lang->{'Media'}                                  = 'Mídia';
    $Lang->{'Maximum number of one element'}          = 'Número máximo de um elemento';
    $Lang->{'Identifier'}                             = 'Identificador';
    $Lang->{'Phone 1'}                                = 'Telefone 1';
    $Lang->{'Phone 2'}                                = 'Telefone 2';
    $Lang->{'Address'}                                = 'Endereço';
    $Lang->{'Building'}                               = 'Prédio';
    $Lang->{'Floor'}                                  = 'Andar';
    $Lang->{'IT Facility'}                            = 'Departamento de TI';
    $Lang->{'Office'}                                 = 'Escritório';
    $Lang->{'Outlet'}                                 = 'Tomada';
    $Lang->{'Rack'}                                   = '';
    $Lang->{'Room'}                                   = 'Sala';
    $Lang->{'Workplace'}                              = 'Local de Trabalho';

    return 1;
}

1;
