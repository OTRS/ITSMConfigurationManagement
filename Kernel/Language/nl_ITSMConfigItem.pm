# --
# Kernel/Language/nl_ITSMConfigItem.pm - the Dutch translation of ITSMConfigItem
# Copyright (C) 2009 Michiel Beijen <michiel 'at' beefreeit.nl>
# --
# $Id: nl_ITSMConfigItem.pm,v 1.2 2010-09-06 20:31:09 en Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::nl_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.2 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = 'Configuratie-item';
    $Lang->{'Config Item-Area'}       = 'Configuratie-item-gebied';
    $Lang->{'Config Item Management'} = 'Configuratie-item beheer';
    $Lang->{'Change Definition'}      = 'Definitie veranderen';
    $Lang->{'Class'}                  = 'Klasse';
    $Lang->{'Show Versions'}          = 'Toon versies';
    $Lang->{'Hide Versions'}          = 'Verberg versies';
    $Lang->{'Last changed by'}        = 'Laaste wijziging door';
    $Lang->{'Last changed'}           = 'Laaste wijziging';
    $Lang->{'Change of definition failed! See System Log for details.'}
        = 'Definitiewijziging mislukt! Zie de System Log voor details.';
    $Lang->{'Also search in previous versions?'} = 'Ook in eerdere versies zoeken?';
    $Lang->{'Config Items shown'}                = 'Getoonde configuratie-items';
    $Lang->{'Config Items available'}            = 'Beschikbare configuratie-items';
    $Lang->{'Deployment State'}                  = 'Status';
    $Lang->{'Current Deployment State'}          = 'Actuele status';
    $Lang->{'Incident State'}                    = 'Incidentstatus';
    $Lang->{'Current Incident State'}            = 'Actuele incidentstatus';
    $Lang->{'The name of this config item'}      = 'De naam van dit configuratie-item';
    $Lang->{'The deployment state of this config item'}
        = 'De status van dit configuratie-item';
    $Lang->{'The incident state of this config item'} = 'De incidentstatus van dit configuratie-item';
    $Lang->{'Last Change'}                            = 'Laatste wijziging';
    $Lang->{'Duplicate'}                              = 'Dupliceren';
    $Lang->{'Expired'}                                = 'Verlopen';
    $Lang->{'Inactive'}                               = 'Inactief';
    $Lang->{'Maintenance'}                            = 'In onderhoud';
    $Lang->{'Pilot'}                                  = 'Pilot';
    $Lang->{'Planned'}                                = 'Geplanned';
    $Lang->{'Production'}                             = 'Produktie';
    $Lang->{'Repair'}                                 = 'In reparatie';
    $Lang->{'Retired'}                                = 'Uitgefaseerd';
    $Lang->{'Review'}                                 = 'Review';
    $Lang->{'Test/QA'}                                = 'Test/QA';
    $Lang->{'Operational'}                            = 'Operationeel';
    $Lang->{'Incident'}                               = 'Incident';
    $Lang->{'Desktop'}                                = 'Desktop';
    $Lang->{'Laptop'}                                 = 'Laptop';
    $Lang->{'Other'}                                  = 'Overige';
    $Lang->{'PDA'}                                    = 'PDA';
    $Lang->{'Phone'}                                  = 'Telefoon';
    $Lang->{'Server'}                                 = 'Server';
    $Lang->{'Backup Device'}                          = 'Backupapparaat';
    $Lang->{'Beamer'}                                 = 'Beamer';
    $Lang->{'Camera'}                                 = 'Camera';
    $Lang->{'Docking Station'}                        = 'Docking station';
    $Lang->{'Keybord'}                                = 'Toetsenbord';
    $Lang->{'Modem'}                                  = 'Modem';
    $Lang->{'Monitor'}                                = 'Monitor';
    $Lang->{'Mouse'}                                  = 'Muis';
    $Lang->{'Other'}                                  = 'Overige';
    $Lang->{'PCMCIA Card'}                            = 'PCMCIA kaart';
    $Lang->{'Printer'}                                = 'Printer';
    $Lang->{'Router'}                                 = 'Router';
    $Lang->{'Scanner'}                                = 'Scanner';
    $Lang->{'Security Device'}                        = 'Security device';
    $Lang->{'Switch'}                                 = 'Switch';
    $Lang->{'USB Device'}                             = 'USB apparaat';
    $Lang->{'WLAN Access Point'}                      = 'WLAN Access Point';
    $Lang->{'GSM'}                                    = 'GSM';
    $Lang->{'LAN'}                                    = 'LAN';
    $Lang->{'Other'}                                  = 'Overige';
    $Lang->{'Telco'}                                  = 'Telco';
    $Lang->{'WLAN'}                                   = 'WLAN';
    $Lang->{'Admin Tool'}                             = 'Admin Tool';
    $Lang->{'Client Application'}                     = 'Clienttoepassing';
    $Lang->{'Client OS'}                              = 'Client besturingssysteem';
    $Lang->{'Embedded'}                               = 'Embedded';
    $Lang->{'Middleware'}                             = 'Middleware';
    $Lang->{'Other'}                                  = 'Overige';
    $Lang->{'Server Application'}                     = 'Servertoepassing';
    $Lang->{'Server OS'}                              = 'Server besturingssysteem';
    $Lang->{'User Tool'}                              = 'User Tool';
    $Lang->{'Concurrent Users'}                       = 'Gelijktijdige gebruikers';
    $Lang->{'Demo'}                                   = 'Demo';
    $Lang->{'Developer Licence'}                      = 'Ontwikkelaarslicentie';
    $Lang->{'Enterprise Licence'}                     = 'Enterpriselicentie';
    $Lang->{'Freeware'}                               = 'Freeware';
    $Lang->{'Open Source'}                            = 'Open Source';
    $Lang->{'Per Node'}                               = 'Per node';
    $Lang->{'Per Processor'}                          = 'Per CPU';
    $Lang->{'Per Server'}                             = 'Per server';
    $Lang->{'Per User'}                               = 'Per gebruiker';
    $Lang->{'Single Licence'}                         = 'Single Licence';
    $Lang->{'Time Restricted'}                        = 'Time restricted';
    $Lang->{'Unlimited'}                              = 'Ongelimiteerd';
    $Lang->{'Volume Licence'}                         = 'Volume Licentie';
    $Lang->{'Model'}                                  = 'Model';
    $Lang->{'Serial Number'}                          = 'Serienummer';
    $Lang->{'Operating System'}                       = 'Besturingssysteem';
    $Lang->{'CPU'}                                    = 'CPU';
    $Lang->{'Ram'}                                    = 'RAM';
    $Lang->{'Hard Disk'}                              = 'Harde schijf';
    $Lang->{'Hard Disk::Capacity'}                    = 'Harde schijf::Capaciteit';
    $Lang->{'Capacity'}                               = 'Capaciteit';
    $Lang->{'FQDN'}                                   = 'FQDN';
    $Lang->{'Network Adapter'}                        = 'Netwerk adapter';
    $Lang->{'Network Adapter::IP over DHCP'}          = 'Netwerk adapter::IP via DHCP';
    $Lang->{'Network Adapter::IP Address'}            = 'Netwerk adapter::IP adres';
    $Lang->{'IP over DHCP'}                           = 'IP via DHCP';
    $Lang->{'IP Address'}                             = 'IP adres';
    $Lang->{'Graphic Adapter'}                        = 'Videokaart';
    $Lang->{'Other Equipment'}                        = 'Overige uitrusting';
    $Lang->{'Warranty Expiration Date'}               = 'Einddatum garantie';
    $Lang->{'Install Date'}                           = 'Installatiedatum';
    $Lang->{'Network Address'}                        = 'Netwerkadres';
    $Lang->{'Network Address::Subnet Mask'}           = 'Netwerkadres::Subnet Mask';
    $Lang->{'Network Address::Gateway'}               = 'Netwerkadres::Gateway';
    $Lang->{'Subnet Mask'}                            = 'Subnet Mask';
    $Lang->{'Gateway'}                                = 'Gateway';
    $Lang->{'Licence Type'}                           = 'Licentietype';
    $Lang->{'Licence Key'}                            = 'Licentiesleutel';
    $Lang->{'Licence Key::Quantity'}                  = 'Licentiesleutel::Hoeveelheid';
    $Lang->{'Licence Key::Expiration Date'}           = 'Licentiesleutel::Expiratiedatum';
    $Lang->{'Quantity'}                               = 'Hoeveelheid';
    $Lang->{'Expiration Date'}                        = 'Expiratiedatum';
    $Lang->{'Media'}                                  = 'Media';
    $Lang->{'Maximum number of one element'}          = 'Maximale hoeveelheid';
    $Lang->{'Identifier'}                             = 'Identificatie';
    $Lang->{'Phone 1'}                                = 'Telefoon 1';
    $Lang->{'Phone 2'}                                = 'Telefoon 2';
    $Lang->{'Address'}                                = 'Adres';
    $Lang->{'Building'}                               = 'Gebouw';
    $Lang->{'Floor'}                                  = 'Etage';
    $Lang->{'IT Facility'}                            = 'Serverruimte';
    $Lang->{'Office'}                                 = 'Kantoor';
    $Lang->{'Outlet'}                                 = 'Aansluiting';
    $Lang->{'Rack'}                                   = 'Rack';
    $Lang->{'Room'}                                   = 'Kamer';
    $Lang->{'Workplace'}                              = 'Werkplek';
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

    return 1;
}

1;
