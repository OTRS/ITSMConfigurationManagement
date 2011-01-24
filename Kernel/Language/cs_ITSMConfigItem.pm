# --
# Kernel/Language/cs_ITSMConfigItem.pm - the czech translation of ITSMConfigItem
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2007-2008 Milen Koutev
# Copyright (C) 2010 O2BS.com, s r.o. Jakub Hanus
# --
# $Id: cs_ITSMConfigItem.pm,v 1.1 2011-01-24 19:57:02 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::cs_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = 'Konfig. Polo¾ka';
    $Lang->{'Config Item-Area'}       = 'Konfig. Polo¾ka-Struktura';
    $Lang->{'Config Item Management'} = 'Správa Konfiguraèních Polo¾ek';
    $Lang->{'Change Definition'}      = 'Zmìna Definice';
    $Lang->{'Class'}                  = 'Tøída';
    $Lang->{'Show Versions'}          = 'Ukázat Verze';
    $Lang->{'Hide Versions'}          = 'Skrıt Verze';
    $Lang->{'Last changed by'}        = 'Poslední zmìna od';
    $Lang->{'Last changed'}           = 'Poslední zmìna';
    $Lang->{'Change of definition failed! See System Log for details.'} = 'Zmìna definice neúspì¹ná! Viz Systémovı Log pro podrobnosti.';
    $Lang->{'Also search in previous versions?'}        = 'Hledat také v pøedchozích verzích?';
    $Lang->{'Config Items shown'}                       = 'Zobrazené Konfig. Polo¾ky';
    $Lang->{'Config Items available'}                   = 'Dostupné Konfig. Polo¾ky';
    $Lang->{'Search Config Items'}                      = 'Vyhledat Konfig. Polo¾ky';
    $Lang->{'Deployment State'}                         = 'Stav Nasazení';
    $Lang->{'Current Deployment State'}                 = 'Aktuální Stav Nasazení';
    $Lang->{'Incident State'}                           = 'Stav Incidentu';
    $Lang->{'Current Incident State'}                   = 'Aktuální Stav Incidentu';
    $Lang->{'The name of this config item'}             = 'Jméno této Konfig. Polo¾ky';
    $Lang->{'The deployment state of this config item'} = 'Stav Nasazení této Konfig. Polo¾ky';
    $Lang->{'The incident state of this config item'}   = 'Stav Incidentu této Konfig. Polo¾ky';

    $Lang->{'Last Change'}                              = 'Poslední zmìna';
    $Lang->{'Duplicate'}                                = 'Duplikace';
    $Lang->{'Expired'}                                  = 'Propadnuté';
    $Lang->{'Inactive'}                                 = 'Neaktivní';
    $Lang->{'Maintenance'}                              = 'Údr¾ba';
    $Lang->{'Pilot'}                                    = 'Øídící';
    $Lang->{'Planned'}                                  = 'Naplánováno';
    $Lang->{'Production'}                               = 'Produkèní';
    $Lang->{'Repair'}                                   = 'Oprava/Obnovení';
    $Lang->{'Retired'}                                  = 'Mimo provoz';
    $Lang->{'Review'}                                   = 'Pøehled';
    $Lang->{'Test/QA'}                                  = 'Test/Kontrola kvality';
    $Lang->{'Operational'}                              = 'Operaèní';
    $Lang->{'Incident'}                                 = 'Incident';
    $Lang->{'Desktop'}                                  = 'Stolní';
    $Lang->{'Laptop'}                                   = 'Mobilní';
    $Lang->{'Other'}                                    = 'Jiné';
    $Lang->{'PDA'}                                      = 'PDA';
    $Lang->{'Phone'}                                    = 'Telefon';
    $Lang->{'Server'}                                   = 'Server';
    $Lang->{'Backup Device'}                            = 'Zálohovácí Zaøízení';
    $Lang->{'Beamer'}                                   = 'Beamer';
    $Lang->{'Camera'}                                   = 'Kamera';
    $Lang->{'Docking Station'}                          = 'Dok Stanice';
    $Lang->{'Keybord'}                                  = 'Klávesnice';
    $Lang->{'Modem'}                                    = 'Modem';
    $Lang->{'Monitor'}                                  = 'Monitor';
    $Lang->{'Mouse'}                                    = 'My¹';
    $Lang->{'Other'}                                    = 'Jiné';
    $Lang->{'PCMCIA Card'}                              = 'PCMCIA karta';
    $Lang->{'Printer'}                                  = 'Tiskárna';
    $Lang->{'Router'}                                   = 'Router';
    $Lang->{'Scanner'}                                  = 'Skener';
    $Lang->{'Security Device'}                          = 'Bezpeènostní Zaøízení';
    $Lang->{'Switch'}                                   = 'Switch';
    $Lang->{'USB Device'}                               = 'USB Zaøízení';
    $Lang->{'WLAN Access Point'}                        = 'Pøístupovı Bod WLAN';
    $Lang->{'GSM'}                                      = 'GSM';
    $Lang->{'LAN'}                                      = 'LAN';
    $Lang->{'Other'}                                    = 'Jiné';
    $Lang->{'Telco'}                                    = 'Telco';
    $Lang->{'WLAN'}                                     = 'WLAN';
    $Lang->{'Admin Tool'}                               = 'Administraèní nástroj';
    $Lang->{'Client Application'}                       = 'U¾ivatelské Aplikace';
    $Lang->{'Client OS'}                                = 'U¾ivatelskı Operaèní Systém';
    $Lang->{'Embedded'}                                 = 'Vestavìnı';
    $Lang->{'Middleware'}                               = 'Støední úroveò';
    $Lang->{'Other'}                                    = 'Jiné';
    $Lang->{'Server Application'}                       = 'Serverová Aplikace';
    $Lang->{'Server OS'}                                = 'Serverovı Operaèní Systém';
    $Lang->{'User Tool'}                                = 'U¾ivatelskı Nástroj';
    $Lang->{'Concurrent Users'}                         = 'Konkurenèní U¾ivatelé';
    $Lang->{'Demo'}                                     = 'Demo';
    $Lang->{'Developer Licence'}                        = 'Licence Vıvojáøe';
    $Lang->{'Enterprise Licence'}                       = 'Podniková Licence ';
    $Lang->{'Freeware'}                                 = 'Freeware';
    $Lang->{'Open Source'}                              = 'Software s Otevøenım Kódem';
    $Lang->{'Per Node'}                                 = 'na Uzel';
    $Lang->{'Per Processor'}                            = 'na Procesor';
    $Lang->{'Per Server'}                               = 'na Server';
    $Lang->{'Per User'}                                 = 'na U¾ivatele';
    $Lang->{'Single Licence'}                           = 'Jednoduchá Licence';
    $Lang->{'Time Restricted'}                          = 'Èasovì omezená Licence';
    $Lang->{'Unlimited'}                                = 'Neomezená';
    $Lang->{'Volume Licence'}                           = 'Svazková Licence';
    $Lang->{'Model'}                                    = 'Model';
    $Lang->{'Serial Number'}                            = 'Sériové Èíslo';
    $Lang->{'Operating System'}                         = 'Operaèní Systém';
    $Lang->{'CPU'}                                      = 'Procesor';
    $Lang->{'Ram'}                                      = 'RAM';
    $Lang->{'Hard Disk'}                                = 'Pevnı Disk';
    $Lang->{'Hard Disk::Capacity'}                      = 'Pevnı Disk::Kapacita';
    $Lang->{'Capacity'}                                 = 'Kapacita';
    $Lang->{'FQDN'}                                     = 'FQDN';
    $Lang->{'Network Adapter'}                          = 'Sí»ovı Adapter';
    $Lang->{'Network Adapter::IP over DHCP'}            = 'Sí»ovı Adapter::IP z DHCP';
    $Lang->{'Network Adapter::IP Address'}              = 'Sí»ovı Adapter::IP adresa';
    $Lang->{'IP over DHCP'}                             = 'IP z DHCP';
    $Lang->{'IP Address'}                               = 'IP Adresa';
    $Lang->{'Graphic Adapter'}                          = 'Grafická Karta';
    $Lang->{'Other Equipment'}                          = 'Jiné Vybavení';
    $Lang->{'Warranty Expiration Date'}                 = 'Konec platnosti záruky';
    $Lang->{'Install Date'}                             = 'Datum Instalace';
    $Lang->{'Network Address'}                          = 'Sí»ová Adresa';
    $Lang->{'Network Address::Subnet Mask'}             = 'Sí»ová Adresa::Maska Podsítì';
    $Lang->{'Network Address::Gateway'}                 = 'Sí»ová Adresa::Gateway';
    $Lang->{'Subnet Mask'}                              = 'Maska Podsítì';
    $Lang->{'Gateway'}                                  = 'Gateway';
    $Lang->{'Licence Type'}                             = 'Druh licence';
    $Lang->{'Licence Key'}                              = 'Licenèní Klíè';
    $Lang->{'Licence Key::Quantity'}                    = 'Licenèní Klíè::Mno¾ství';
    $Lang->{'Licence Key::Expiration Date'}             = 'Licenèní Klíè::Konec Platnosti';
    $Lang->{'Quantity'}                                 = 'Mno¾ství';
    $Lang->{'Expiration Date'}                          = 'Konec Platnosti';
    $Lang->{'Media'}                                    = 'Médium';
    $Lang->{'Maximum number of one element'}            = 'Max poèet jedné Polo¾ky';
    $Lang->{'Identifier'}                               = 'Identifikátor';
    $Lang->{'Phone 1'}                                  = 'Telefon 1';
    $Lang->{'Phone 2'}                                  = 'Telefon 2';
    $Lang->{'Address'}                                  = 'Adresa';
    $Lang->{'Building'}                                 = 'Budova';
    $Lang->{'Floor'}                                    = 'podla¾í';
    $Lang->{'IT Facility'}                              = 'IT Pøíslu¹enství';
    $Lang->{'Office'}                                   = 'Kanceláø';
    $Lang->{'Outlet'}                                   = 'Filiálka';
    $Lang->{'Rack'}                                     = 'Rack';
    $Lang->{'Room'}                                     = 'Místnost';
    $Lang->{'Workplace'}                                = 'Pracovi¹tì';
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
