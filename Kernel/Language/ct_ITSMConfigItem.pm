# --
# Kernel/Language/ct_ITSMConfigItem.pm - the catalan translation of ITSMConfigItem
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2008 Sistemes OTIC (ibsalut) - Antonio Linde
# --
# $Id: ct_ITSMConfigItem.pm,v 1.6 2010-09-21 17:09:44 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ct_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.6 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = 'Element de configuració';
    $Lang->{'Config Item-Area'}       = 'Àrea-Element de configuració';
    $Lang->{'Config Item Management'} = 'Gestió d\'elements de configuració';
    $Lang->{'Change Definition'}      = 'Canviar definició';
    $Lang->{'Class'}                  = 'Classe';
    $Lang->{'Show Versions'}          = 'Mostrar versions';
    $Lang->{'Hide Versions'}          = 'Ocultar versions';
    $Lang->{'Last changed by'}        = 'Últim canvi per';
    $Lang->{'Last changed'}           = 'Últim canvi';
    $Lang->{'Change of definition failed! See System Log for details.'}
        = 'Canvi de definició ha fallat! Veure el registre del sistema per a més detalls.';
    $Lang->{'Also search in previous versions?'} = 'Cercar també en versions anteriors?';
    $Lang->{'Config Items shown'}                = 'Elements de configuració mostrats';
    $Lang->{'Config Items available'}            = 'Elements de configuració disponibles';
    $Lang->{'Search Config Items'}               = 'Cercar elements de configuració';
    $Lang->{'Deployment State'}                  = 'Estat del desplegament';
    $Lang->{'Current Deployment State'}          = 'Estat actual del desplegament';
    $Lang->{'Incident State'}                    = 'Estat de l\'incident';
    $Lang->{'Current Incident State'}            = 'Estat actual de l\'incident';
    $Lang->{'The name of this config item'}      = 'El nom d\'aquest element de configuració';
    $Lang->{'The deployment state of this config item'}
        = 'L\'estat del desplegament d\aquest element de configuració';
    $Lang->{'The incident state of this config item'}
        = 'L\'estat de l\'incident d\'aquest element de configuració';
    $Lang->{'Last Change'}                   = 'Últim canvi';
    $Lang->{'Duplicate'}                     = 'Duplicar';
    $Lang->{'Expired'}                       = 'Expirat';
    $Lang->{'Inactive'}                      = 'Inactiu';
    $Lang->{'Maintenance'}                   = 'Manteniment';
    $Lang->{'Pilot'}                         = 'Pilot';
    $Lang->{'Planned'}                       = 'Planificat';
    $Lang->{'Production'}                    = 'Producció';
    $Lang->{'Repair'}                        = 'Reparar';
    $Lang->{'Retired'}                       = 'Retirat';
    $Lang->{'Review'}                        = 'Revisar';
    $Lang->{'Test/QA'}                       = 'Provar/QA';
    $Lang->{'Operational'}                   = 'Operatiu';
    $Lang->{'Incident'}                      = 'Incident';
    $Lang->{'Desktop'}                       = 'Ordinador';
    $Lang->{'Laptop'}                        = 'Portàtil';
    $Lang->{'Other'}                         = 'Altres';
    $Lang->{'PDA'}                           = 'PDA';
    $Lang->{'Phone'}                         = 'Telèfon';
    $Lang->{'Server'}                        = 'Servidor';
    $Lang->{'Backup Device'}                 = 'Dispositiu de còpies de seguretat';
    $Lang->{'Beamer'}                        = 'Projector';
    $Lang->{'Camera'}                        = 'Càmera';
    $Lang->{'Docking Station'}               = 'Unitat d\'expansió';
    $Lang->{'Keybord'}                       = 'Teclat';
    $Lang->{'Modem'}                         = 'Mòdem';
    $Lang->{'Monitor'}                       = 'Monitor';
    $Lang->{'Mouse'}                         = 'Ratolí';
    $Lang->{'Other'}                         = 'Altres';
    $Lang->{'PCMCIA Card'}                   = 'Targeta PCMCIA';
    $Lang->{'Printer'}                       = 'Impressora';
    $Lang->{'Router'}                        = 'Encaminador';
    $Lang->{'Scanner'}                       = 'Escàner';
    $Lang->{'Security Device'}               = 'Dispositiu de seguretat';
    $Lang->{'Switch'}                        = 'Commutador';
    $Lang->{'USB Device'}                    = 'Dispositiu USB';
    $Lang->{'WLAN Access Point'}             = 'Punt d\'accés WLAN';
    $Lang->{'GSM'}                           = 'GSM';
    $Lang->{'LAN'}                           = 'LAN';
    $Lang->{'Other'}                         = 'Altres';
    $Lang->{'Telco'}                         = 'Telco';
    $Lang->{'WLAN'}                          = 'WLAN';
    $Lang->{'Admin Tool'}                    = 'Eina d\'administració';
    $Lang->{'Client Application'}            = 'Aplicació client';
    $Lang->{'Client OS'}                     = 'Sistema Operatiu client';
    $Lang->{'Embedded'}                      = 'Integrat';
    $Lang->{'Middleware'}                    = 'Middleware';
    $Lang->{'Other'}                         = 'Altres';
    $Lang->{'Server Application'}            = 'Aplicació servidor';
    $Lang->{'Server OS'}                     = 'Sistema Operatiu servidor';
    $Lang->{'User Tool'}                     = 'Eina d\'usuari';
    $Lang->{'Concurrent Users'}              = 'Usuaris concurrents';
    $Lang->{'Demo'}                          = 'Demo';
    $Lang->{'Developer Licence'}             = 'Llicència de desenvolupament';
    $Lang->{'Enterprise Licence'}            = 'Llicència corporativa';
    $Lang->{'Freeware'}                      = 'Freeware';
    $Lang->{'Open Source'}                   = 'Open Source';
    $Lang->{'Per Node'}                      = 'Per Node';
    $Lang->{'Per Processor'}                 = 'Per Processador';
    $Lang->{'Per Server'}                    = 'Per Servidor';
    $Lang->{'Per User'}                      = 'Per Usuari';
    $Lang->{'Single Licence'}                = 'Llicència Individual';
    $Lang->{'Time Restricted'}               = 'Restricció de temps';
    $Lang->{'Unlimited'}                     = 'Il·limitat';
    $Lang->{'Volume Licence'}                = 'Llicència per volum';
    $Lang->{'Model'}                         = 'Model';
    $Lang->{'Serial Number'}                 = 'Nombre de sèrie';
    $Lang->{'Operating System'}              = 'Sistema Operatiu';
    $Lang->{'CPU'}                           = 'CPU';
    $Lang->{'Ram'}                           = 'Ram';
    $Lang->{'Hard Disk'}                     = 'Disc dur';
    $Lang->{'Hard Disk::Capacity'}           = 'Disc dur::Capacitat';
    $Lang->{'Capacity'}                      = 'Capacitat';
    $Lang->{'FQDN'}                          = 'FQDN';
    $Lang->{'Network Adapter'}               = 'Adaptador de xarxa';
    $Lang->{'Network Adapter::IP over DHCP'} = 'Adaptador de xarxa::IP per DHCP';
    $Lang->{'Network Adapter::IP Address'}   = 'Adaptador de xarxa::Direcció IP';
    $Lang->{'IP over DHCP'}                  = 'IP per DHCP';
    $Lang->{'IP Address'}                    = 'Direcció IP';
    $Lang->{'Graphic Adapter'}               = 'Adaptador gràfic';
    $Lang->{'Other Equipment'}               = 'Alter equipament';
    $Lang->{'Warranty Expiration Date'}      = 'Data de fi de la garantia';
    $Lang->{'Install Date'}                  = 'Data d\'instal·lació';
    $Lang->{'Network Address'}               = 'Direcció de xarxa';
    $Lang->{'Network Address::Subnet Mask'}  = 'Direcció de xarxa::Màscara de subxarxa';
    $Lang->{'Network Address::Gateway'}      = 'Direcció de xarxa::Porta d\'enllaç';
    $Lang->{'Subnet Mask'}                   = 'Màscara de subxarxa';
    $Lang->{'Gateway'}                       = 'Porta d\'enllaç';
    $Lang->{'Licence Type'}                  = 'Tipus de llicència';
    $Lang->{'Licence Key'}                   = 'Clau de llicència';
    $Lang->{'Licence Key::Quantity'}         = 'Clau de llicència::Cuantitat';
    $Lang->{'Licence Key::Expiration Date'}  = 'Clau de llicència::Data d\'expiració';
    $Lang->{'Quantity'}                      = 'Cuantitat';
    $Lang->{'Expiration Date'}               = 'Data d\'expiració';
    $Lang->{'Media'}                         = 'Medi';
    $Lang->{'Maximum number of one element'} = 'Nombre màxim d\'un element';
    $Lang->{'Identifier'}                    = 'Identificador';
    $Lang->{'Phone 1'}                       = '';
    $Lang->{'Phone 2'}                       = '';
    $Lang->{'Address'}                       = '';
    $Lang->{'Building'}                      = '';
    $Lang->{'Floor'}                         = '';
    $Lang->{'IT Facility'}                   = '';
    $Lang->{'Office'}                        = '';
    $Lang->{'Outlet'}                        = '';
    $Lang->{'Rack'}                          = '';
    $Lang->{'Room'}                          = '';
    $Lang->{'Workplace'}                     = '';
    $Lang->{'CIHistory::ConfigItemCreate'}              = '';
    $Lang->{'CIHistory::VersionCreate'}                 = '';
    $Lang->{'CIHistory::DeploymentStateUpdate'}         = '';
    $Lang->{'CIHistory::IncidentStateUpdate'}           = '';
    $Lang->{'CIHistory::ConfigItemDelete'}              = '';
    $Lang->{'CIHistory::LinkAdd'}                       = '';
    $Lang->{'CIHistory::LinkDelete'}                    = '';
    $Lang->{'CIHistory::DefinitionUpdate'}              = '';
    $Lang->{'CIHistory::NameUpdate'}                    = '';
    $Lang->{'CIHistory::ValueUpdate'}                   = '';
    $Lang->{'CIHistory::VersionDelete'}                 = '';
    $Lang->{'Frontend module registration for the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to go back in the configuraton item zoom view of the agent interface.'} = '';
    $Lang->{'Presents a link in the menu to go show versions in the configuraton item zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} = '';
    $Lang->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} = '';
    $Lang->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} = '';
    $Lang->{'Module to genetare ITSM config item statistics.'} = '';
    $Lang->{'Object backend module registration for the import/export module.'} = '';
    $Lang->{'Config item event module that enables logging to history in the agent interface.'} = '';
    $Lang->{'Shows the config item history (reverse ordered) in the agent interface.'} = '';
    $Lang->{'Parameters for the deployment states in the preferences view of the agent interface.'} = '';
    $Lang->{'Module to check the group responsible for a class.'} = '';
    $Lang->{'Module to check the group responsible for a configuration item.'} = '';
    $Lang->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} = '';
    $Lang->{'Configuration item search backend router of the agent interface.'} = '';
    $Lang->{'Parameters for the pages (in which the configuration items are shown).'} = '';
    $Lang->{'Configuration Item Limit'} = '';
    $Lang->{'Configuration Item limit per page'} = '';

    return 1;
}

1;
