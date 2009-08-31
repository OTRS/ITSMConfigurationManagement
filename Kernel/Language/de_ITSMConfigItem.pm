# --
# Kernel/Language/de_ITSMConfigItem.pm - the german translation of ITSMConfigItem
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: de_ITSMConfigItem.pm,v 1.7 2009-08-31 14:38:00 reb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.7 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = 'Config Item';
    $Lang->{'Config Item-Area'}       = 'Config Item-Bereich';
    $Lang->{'Config Item Management'} = 'Config Item Verwaltung';
    $Lang->{'Change Definition'}      = 'Definition ändern';
    $Lang->{'Class'}                  = 'Klasse';
    $Lang->{'Show Versions'}          = 'Versionen einblenden';
    $Lang->{'Hide Versions'}          = 'Versionen ausblenden';
    $Lang->{'Last changed by'}        = 'Zuletzt geändert von';
    $Lang->{'Last changed'}           = 'Zuletzt geändert';
    $Lang->{'Change of definition failed! See System Log for details.'}
        = 'Ändern der Definition fehlgeschlagen! Im System Log finden Sie weitere Informationen.';
    $Lang->{'Also search in previous versions?'} = 'Auch in früheren Versionen suchen?';
    $Lang->{'Config Items shown'}                = 'Config Items angezeigt';
    $Lang->{'Config Items available'}            = 'Config Items verfügbar';
    $Lang->{'Search Config Items'}               = 'Config Item Suche';
    $Lang->{'Deployment State'}                  = 'Verwendungsstatus';
    $Lang->{'Current Deployment State'}          = 'Aktueller Verwendungsstatus';
    $Lang->{'Incident State'}                    = 'Vorfallsstatus';
    $Lang->{'Current Incident State'}            = 'Aktueller Vorfallsstatus';
    $Lang->{'The name of this config item'}      = 'Der Name dieses Config Items';
    $Lang->{'The deployment state of this config item'}
        = 'Der Verwendungsstatus dieses Config Items';
    $Lang->{'The incident state of this config item'} = 'Der Vorfallsstatus dieses Config Items';
    $Lang->{'Last Change'}                            = 'Letzte Änderung';
    $Lang->{'Duplicate'}                              = 'Duplizieren';
    $Lang->{'Expired'}                                = 'Abgelaufen';
    $Lang->{'Inactive'}                               = 'Inaktiv';
    $Lang->{'Maintenance'}                            = 'In Wartung';
    $Lang->{'Pilot'}                                  = 'Pilotbetrieb';
    $Lang->{'Planned'}                                = 'Geplant';
    $Lang->{'Production'}                             = 'Produktiv';
    $Lang->{'Repair'}                                 = 'In Reparatur';
    $Lang->{'Retired'}                                = 'Außer Dienst';
    $Lang->{'Review'}                                 = 'Unter Review';
    $Lang->{'Test/QA'}                                = 'Test/QS';
    $Lang->{'Operational'}                            = 'Operativ';
    $Lang->{'Incident'}                               = 'Vorfall';
    $Lang->{'Desktop'}                                = 'Desktop';
    $Lang->{'Laptop'}                                 = 'Laptop';
    $Lang->{'Other'}                                  = 'Sonstiges';
    $Lang->{'PDA'}                                    = 'PDA';
    $Lang->{'Phone'}                                  = 'Telefon';
    $Lang->{'Server'}                                 = 'Server';
    $Lang->{'Backup Device'}                          = 'Backup Gerät';
    $Lang->{'Beamer'}                                 = 'Beamer';
    $Lang->{'Camera'}                                 = 'Kamera';
    $Lang->{'Docking Station'}                        = 'Docking Station';
    $Lang->{'Keybord'}                                = 'Tastatur';
    $Lang->{'Modem'}                                  = 'Modem';
    $Lang->{'Monitor'}                                = 'Monitor';
    $Lang->{'Mouse'}                                  = 'Maus';
    $Lang->{'Other'}                                  = 'Sonstiges';
    $Lang->{'PCMCIA Card'}                            = 'PCMCIA Karte';
    $Lang->{'Printer'}                                = 'Drucker';
    $Lang->{'Router'}                                 = 'Router';
    $Lang->{'Scanner'}                                = 'Scanner';
    $Lang->{'Security Device'}                        = 'Sichertheitsgerät';
    $Lang->{'Switch'}                                 = 'Switch';
    $Lang->{'USB Device'}                             = 'USB Gerät';
    $Lang->{'WLAN Access Point'}                      = 'WLAN Access Point';
    $Lang->{'GSM'}                                    = 'GSM';
    $Lang->{'LAN'}                                    = 'LAN';
    $Lang->{'Other'}                                  = 'Sonstiges';
    $Lang->{'Telco'}                                  = 'Telko';
    $Lang->{'WLAN'}                                   = 'WLAN';
    $Lang->{'Admin Tool'}                             = 'Admin Tool';
    $Lang->{'Client Application'}                     = 'Client Anwendung';
    $Lang->{'Client OS'}                              = 'Client Betriebssystem';
    $Lang->{'Embedded'}                               = 'Embedded';
    $Lang->{'Middleware'}                             = 'Middleware';
    $Lang->{'Other'}                                  = 'Sonstiges';
    $Lang->{'Server Application'}                     = 'Server Anwendung';
    $Lang->{'Server OS'}                              = 'Server Betriebssystem';
    $Lang->{'User Tool'}                              = 'User Tool';
    $Lang->{'Concurrent Users'}                       = 'Gleichzeitige User';
    $Lang->{'Demo'}                                   = 'Demo';
    $Lang->{'Developer Licence'}                      = 'Entwickler Lizenz';
    $Lang->{'Enterprise Licence'}                     = 'Enterprise Lizenz';
    $Lang->{'Freeware'}                               = 'Freeware';
    $Lang->{'Open Source'}                            = 'Open Source';
    $Lang->{'Per Node'}                               = 'Pro Knoten';
    $Lang->{'Per Processor'}                          = 'Pro Prozessor';
    $Lang->{'Per Server'}                             = 'Pro Server';
    $Lang->{'Per User'}                               = 'Pro Benutzer';
    $Lang->{'Single Licence'}                         = 'Einzellizenz';
    $Lang->{'Time Restricted'}                        = 'Zeitlich begrenzt';
    $Lang->{'Unlimited'}                              = 'Unlimitiert';
    $Lang->{'Volume Licence'}                         = 'Volumen Lizenz';
    $Lang->{'Model'}                                  = 'Model';
    $Lang->{'Serial Number'}                          = 'Seriennummer';
    $Lang->{'Operating System'}                       = 'Betriebssystem';
    $Lang->{'CPU'}                                    = 'CPU';
    $Lang->{'Ram'}                                    = 'Arbeitsspeicher';
    $Lang->{'Hard Disk'}                              = 'Festplatte';
    $Lang->{'Hard Disk::Capacity'}                    = 'Festplatte::Kapazität';
    $Lang->{'Capacity'}                               = 'Kapazität';
    $Lang->{'FQDN'}                                   = 'FQDN';
    $Lang->{'Network Adapter'}                        = 'Netzwerk Adapter';
    $Lang->{'Network Adapter::IP over DHCP'}          = 'Netzwerk Adapter::IP über DHCP';
    $Lang->{'Network Adapter::IP Address'}            = 'Netzwerk Adapter::IP Addresse';
    $Lang->{'IP over DHCP'}                           = 'IP über DHCP';
    $Lang->{'IP Address'}                             = 'IP Addresse';
    $Lang->{'Graphic Adapter'}                        = 'Grafik Adapter';
    $Lang->{'Other Equipment'}                        = 'Sonstige Ausstattung';
    $Lang->{'Warranty Expiration Date'}               = 'Garantie Ablaufdatum';
    $Lang->{'Install Date'}                           = 'Installationsdatum';
    $Lang->{'Network Address'}                        = 'Netzwerk Addresse';
    $Lang->{'Network Address::Subnet Mask'}           = 'Netzwerk Addresse::Subnetz Maske';
    $Lang->{'Network Address::Gateway'}               = 'Netzwerk Addresse::Gateway';
    $Lang->{'Subnet Mask'}                            = 'Subnetz Maske';
    $Lang->{'Gateway'}                                = 'Gateway';
    $Lang->{'Licence Type'}                           = 'Lizenztyp';
    $Lang->{'Licence Key'}                            = 'Lizenzschlüssel';
    $Lang->{'Licence Key::Quantity'}                  = 'Lizenzschlüssel::Menge';
    $Lang->{'Licence Key::Expiration Date'}           = 'Lizenzschlüssel::Ablaufdatum';
    $Lang->{'Quantity'}                               = 'Menge';
    $Lang->{'Expiration Date'}                        = 'Ablaufdatum';
    $Lang->{'Media'}                                  = 'Medium';
    $Lang->{'Maximum number of one element'}          = 'Maximale Anzahl eines Elements';
    $Lang->{'Identifier'}                             = 'Identifikator';
    $Lang->{'Phone 1'}                                = 'Telefon 1';
    $Lang->{'Phone 2'}                                = 'Telefon 2';
    $Lang->{'Address'}                                = 'Adresse';
    $Lang->{'Building'}                               = 'Gebäude';
    $Lang->{'Floor'}                                  = 'Etage';
    $Lang->{'IT Facility'}                            = 'IT Einrichtung';
    $Lang->{'Office'}                                 = 'Büro';
    $Lang->{'Outlet'}                                 = 'Anschlussdose';
    $Lang->{'Rack'}                                   = 'Rack';
    $Lang->{'Room'}                                   = 'Raum';
    $Lang->{'Workplace'}                              = 'Arbeitsplatz';
    $Lang->{'CIHistory::ConfigItemCreate'}            = 'Neues ConfigItem (ID=%s)';
    $Lang->{'CIHistory::VersionCreate'}               = 'Neue Version erzeugt (ID=%s)';
    $Lang->{'CIHistory::DeploymentStateUpdate'}       = 'Verwendungsstatus geändert (neu=%s; alt=%s)';
    $Lang->{'CIHistory::IncidentStateUpdate'}         = 'Vorfallsstatus geändert (neu=%s; alt=%s)';
    $Lang->{'CIHistory::ConfigItemDelete'}            = 'ConfigItem (ID=%s) gelöscht';
    $Lang->{'CIHistory::LinkAdd'}                     = 'Link auf %s (Typ=%s) hinzugefügt';
    $Lang->{'CIHistory::LinkDelete'}                  = 'Link auf %s (Typ=%s) gelöscht';
    $Lang->{'CIHistory::DefinitionUpdate'}            = 'Definition des ConfigItems aktualisiert (ID=%s)';
    $Lang->{'CIHistory::NameUpdate'}                  = 'Name geändert (neu=%s; alt=%s)';
    $Lang->{'CIHistory::ValueUpdate'}                 = 'Attribut %s von "%s" auf "%s" geändert';
    $Lang->{'CIHistory::VersionDelete'}               = 'Version %s gelöscht';

    return 1;
}

1;
