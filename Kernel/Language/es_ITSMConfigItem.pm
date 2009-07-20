# --
# Kernel/Language/es_ITSMConfigItem.pm - the spanish translation of ITSMConfigItem
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# Copyright (C) 2008 Aquiles Cohen
# --
# $Id: es_ITSMConfigItem.pm,v 1.6 2009-07-20 13:11:18 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::es_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.6 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = 'Elemento de Configuración';
    $Lang->{'Config Item-Area'}       = 'Area de Configuración de Elementos';
    $Lang->{'Config Item Management'} = 'Gestión de Elementos de Configuración';
    $Lang->{'Change Definition'}      = 'Modificar Definición';
    $Lang->{'Class'}                  = 'Clase';
    $Lang->{'Show Versions'}          = 'Mostrar Versiones';
    $Lang->{'Hide Versions'}          = 'Ocultar Versiones';
    $Lang->{'Last changed by'}        = 'Ultima modificación por';
    $Lang->{'Last changed'}           = 'Ultima modificación';
    $Lang->{'Change of definition failed! See System Log for details.'}
        = 'Actualización de definiciones fallida! Revisar el Log del Sistema para consultar detalles';
    $Lang->{'Also search in previous versions?'} = 'buscar en versiones anteriores?';
    $Lang->{'Config Items shown'}                = 'Elementos de configuración mostrados';
    $Lang->{'Config Items available'}            = 'Elementos de configuración disponibles';
    $Lang->{'Search Config Items'}               = 'Buscar elementos de configuración';
    $Lang->{'Deployment State'}                  = 'Estado de implementación';
    $Lang->{'Current Deployment State'}          = 'Estado actual de implementación';
    $Lang->{'Incident State'}                    = 'Estado del Incidente';
    $Lang->{'Current Incident State'}            = 'Estado Actual del Incidente';
    $Lang->{'The name of this config item'}      = 'El nombre de este elemento de configuración';
    $Lang->{'The deployment state of this config item'}
        = 'El estado de implementación de este elemento de configuración';
    $Lang->{'The incident state of this config item'}
        = 'El estado de este elemento de configuración';
    $Lang->{'Last Change'}                   = 'Ultima modificación';
    $Lang->{'Duplicate'}                     = 'Duplicado';
    $Lang->{'Expired'}                       = 'Expirado';
    $Lang->{'Inactive'}                      = 'Inactivo';
    $Lang->{'Maintenance'}                   = 'Mantenimiento';
    $Lang->{'Pilot'}                         = 'Piloto';
    $Lang->{'Planned'}                       = 'Planificado';
    $Lang->{'Production'}                    = 'Producción';
    $Lang->{'Repair'}                        = 'Reparación';
    $Lang->{'Retired'}                       = 'Retirado';
    $Lang->{'Review'}                        = 'Revisado';
    $Lang->{'Test/QA'}                       = 'Pruebas';
    $Lang->{'Operational'}                   = 'Operacional';
    $Lang->{'Incident'}                      = 'Incidente';
    $Lang->{'Desktop'}                       = '';
    $Lang->{'Laptop'}                        = 'Portatil';
    $Lang->{'Other'}                         = 'Otro';
    $Lang->{'PDA'}                           = 'Agenda Personal';
    $Lang->{'Phone'}                         = 'Teléfono';
    $Lang->{'Server'}                        = 'Servidor';
    $Lang->{'Backup Device'}                 = 'Dispositivo de Copias';
    $Lang->{'Beamer'}                        = 'Video Beam';
    $Lang->{'Camera'}                        = 'Cámara';
    $Lang->{'Docking Station'}               = '';
    $Lang->{'Keybord'}                       = 'Teclado';
    $Lang->{'Modem'}                         = '';
    $Lang->{'Monitor'}                       = '';
    $Lang->{'Mouse'}                         = '';
    $Lang->{'Other'}                         = 'Otro';
    $Lang->{'PCMCIA Card'}                   = 'Tarjeta PCMCIA';
    $Lang->{'Printer'}                       = 'Impresora';
    $Lang->{'Router'}                        = 'Enrutador';
    $Lang->{'Scanner'}                       = 'Escaner';
    $Lang->{'Security Device'}               = 'Dispositivo de seguridad';
    $Lang->{'Switch'}                        = '';
    $Lang->{'USB Device'}                    = 'Dispositivo USB';
    $Lang->{'WLAN Access Point'}             = '';
    $Lang->{'GSM'}                           = '';
    $Lang->{'LAN'}                           = '';
    $Lang->{'Other'}                         = 'Otro';
    $Lang->{'Telco'}                         = '';
    $Lang->{'WLAN'}                          = '';
    $Lang->{'Admin Tool'}                    = 'Herramienta de Administrador';
    $Lang->{'Client Application'}            = 'Aplicación Cliente';
    $Lang->{'Client OS'}                     = 'SO Cliente';
    $Lang->{'Embedded'}                      = 'Embebido';
    $Lang->{'Middleware'}                    = '';
    $Lang->{'Other'}                         = 'Otro';
    $Lang->{'Server Application'}            = 'Aplicación Servidor';
    $Lang->{'Server OS'}                     = 'SO Servidor';
    $Lang->{'User Tool'}                     = 'Herramienta de Usuario';
    $Lang->{'Concurrent Users'}              = 'Usuarios concurrentes';
    $Lang->{'Demo'}                          = 'Demostración';
    $Lang->{'Developer Licence'}             = 'Licencia de Desarrollador';
    $Lang->{'Enterprise Licence'}            = 'Licencia Corporativa';
    $Lang->{'Freeware'}                      = '';
    $Lang->{'Open Source'}                   = '';
    $Lang->{'Per Node'}                      = 'Por Nodo';
    $Lang->{'Per Processor'}                 = 'Por Procesador';
    $Lang->{'Per Server'}                    = 'Por Servidor';
    $Lang->{'Per User'}                      = 'Por Usuario';
    $Lang->{'Single Licence'}                = '';
    $Lang->{'Time Restricted'}               = 'Tiempo restringida';
    $Lang->{'Unlimited'}                     = 'Ilimitada';
    $Lang->{'Volume Licence'}                = 'Licencia por Volumen';
    $Lang->{'Model'}                         = 'Modelo';
    $Lang->{'Serial Number'}                 = 'Numero Serial';
    $Lang->{'Operating System'}              = 'Sistema Operativo';
    $Lang->{'CPU'}                           = '';
    $Lang->{'Ram'}                           = '';
    $Lang->{'Hard Disk'}                     = 'Disco Duro';
    $Lang->{'Hard Disk::Capacity'}           = 'Disco Duro::Capacidad';
    $Lang->{'Capacity'}                      = 'Capacidad';
    $Lang->{'FQDN'}                          = '';
    $Lang->{'Network Adapter'}               = 'Adaptador de Red';
    $Lang->{'Network Adapter::IP over DHCP'} = 'Adaptador de Red::IP Sobre DHCP';
    $Lang->{'Network Adapter::IP Address'}   = 'Adaptador de Red::Dirección IP';
    $Lang->{'IP over DHCP'}                  = 'IP sobre DHCP';
    $Lang->{'IP Address'}                    = 'Dirección IP';
    $Lang->{'Graphic Adapter'}               = 'Tarjeta Gráfica';
    $Lang->{'Other Equipment'}               = 'Otro equipo';
    $Lang->{'Warranty Expiration Date'}      = 'Fecha de Expiración de la Garantía';
    $Lang->{'Install Date'}                  = 'Fecha de Instalación';
    $Lang->{'Network Address'}               = 'Dirección de Red';
    $Lang->{'Network Address::Subnet Mask'}  = 'Dirección de Red::Mascara de Subred';
    $Lang->{'Network Address::Gateway'}      = 'Dirección de Red::Puerta de enlace';
    $Lang->{'Subnet Mask'}                   = 'Mascara de Subred';
    $Lang->{'Gateway'}                       = 'Puerta de enlace';
    $Lang->{'Licence Type'}                  = 'Tipo de Licencia';
    $Lang->{'Licence Key'}                   = 'Clave de Licencia';
    $Lang->{'Licence Key::Quantity'}         = 'Clave de Licencia::Cantidad';
    $Lang->{'Licence Key::Expiration Date'}  = 'Clave de Licencia::Fecha de Expiración';
    $Lang->{'Quantity'}                      = 'Cantidad';
    $Lang->{'Expiration Date'}               = 'Fecha de Expiración';
    $Lang->{'Media'}                         = 'Medio';
    $Lang->{'Maximum number of one element'} = 'Maximo numero de un elemento ';
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
    return 1;
}

1;
