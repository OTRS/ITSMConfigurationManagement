# --
# Kernel/Language/bg_ITSMConfigItem.pm - the bulgarian translation of ITSMConfigItem
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2007-2008 Milen Koutev
# --
# $Id: bg_ITSMConfigItem.pm,v 1.6 2010-09-06 20:31:09 en Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::bg_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.6 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = '';
    $Lang->{'Config Item-Area'}       = '';
    $Lang->{'Config Item Management'} = 'Управление на конфигурационните единици CI';
    $Lang->{'Change Definition'}      = 'Промяна на дефиницията';
    $Lang->{'Class'}                  = 'Клас';
    $Lang->{'Show Versions'}          = 'Покажи Версиите';
    $Lang->{'Hide Versions'}          = 'Скрий Версиите';
    $Lang->{'Last changed by'}        = 'Последно променен от';
    $Lang->{'Last changed'}           = 'Последна промяна';
    $Lang->{'Change of definition failed! See System Log for details.'}
        = 'Промяната на дефинициите е неуспешна! Виж системния журнал за детайли.';
    $Lang->{'Also search in previous versions?'}        = 'Да търси и в предишните версии?';
    $Lang->{'Config Items shown'}                       = 'Показани конфигур.единици';
    $Lang->{'Config Items available'}                   = 'Достъпни конфигур.единици';
    $Lang->{'Search Config Items'}                      = '';
    $Lang->{'Deployment State'}                         = '';
    $Lang->{'Current Deployment State'}                 = '';
    $Lang->{'Incident State'}                           = '';
    $Lang->{'Current Incident State'}                   = '';
    $Lang->{'The name of this config item'}             = '';
    $Lang->{'The deployment state of this config item'} = '';
    $Lang->{'The incident state of this config item'}   = '';
    $Lang->{'Last Change'}                              = 'Последна промяна';
    $Lang->{'Duplicate'}                                = 'Направи копие';
    $Lang->{'Expired'}                                  = 'Изтекли';
    $Lang->{'Inactive'}                                 = 'Неактивни';
    $Lang->{'Maintenance'}                              = 'Поддръжка';
    $Lang->{'Pilot'}                                    = 'Пилот-водач';
    $Lang->{'Planned'}                                  = 'Планиран';
    $Lang->{'Production'}                               = 'Продуктивен';
    $Lang->{'Repair'}                                   = 'Ремонт/Възстановяване';
    $Lang->{'Retired'}                                  = 'Излязъл от употреба';
    $Lang->{'Review'}                                   = 'Преглеждан';
    $Lang->{'Test/QA'}                                  = 'Тест/Качествен контрол';
    $Lang->{'Operational'}                              = '';
    $Lang->{'Incident'}                                 = '';
    $Lang->{'Desktop'}                                  = 'Настолен';
    $Lang->{'Laptop'}                                   = 'Преносим';
    $Lang->{'Other'}                                    = 'Други';
    $Lang->{'PDA'}                                      = 'PDA';
    $Lang->{'Phone'}                                    = 'Телефон';
    $Lang->{'Server'}                                   = 'Сървър';
    $Lang->{'Backup Device'}                            = 'Архивиращо у-во';
    $Lang->{'Beamer'}                                   = 'Бимер';
    $Lang->{'Camera'}                                   = 'Камера';
    $Lang->{'Docking Station'}                          = 'Докинг станция';
    $Lang->{'Keybord'}                                  = 'Клавиатура';
    $Lang->{'Modem'}                                    = 'Модем';
    $Lang->{'Monitor'}                                  = 'Монитор';
    $Lang->{'Mouse'}                                    = 'Мишка';
    $Lang->{'Other'}                                    = 'Други';
    $Lang->{'PCMCIA Card'}                              = 'PCMCIA карта';
    $Lang->{'Printer'}                                  = 'Принтер';
    $Lang->{'Router'}                                   = 'Рутер';
    $Lang->{'Scanner'}                                  = 'Скенер';
    $Lang->{'Security Device'}                          = 'У-во за сигурност';
    $Lang->{'Switch'}                                   = 'Концентратор';
    $Lang->{'USB Device'}                               = 'USB Устройство';
    $Lang->{'WLAN Access Point'}                        = 'WLAN точка за достъп';
    $Lang->{'GSM'}                                      = 'GSM';
    $Lang->{'LAN'}                                      = 'LAN';
    $Lang->{'Other'}                                    = 'Други';
    $Lang->{'Telco'}                                    = 'Telco';
    $Lang->{'WLAN'}                                     = 'WLAN';
    $Lang->{'Admin Tool'}                               = 'Административнен инструмент';
    $Lang->{'Client Application'}                       = 'Потребителски приложения';
    $Lang->{'Client OS'}                                = 'Потребителска Опер.с-ма';
    $Lang->{'Embedded'}                                 = 'Вградена';
    $Lang->{'Middleware'}                               = 'Средно ниво';
    $Lang->{'Other'}                                    = 'Други';
    $Lang->{'Server Application'}                       = 'Сървърно приложение';
    $Lang->{'Server OS'}                                = 'сървърна Опер.с-ма';
    $Lang->{'User Tool'}                                = 'Клиентски инструмент';
    $Lang->{'Concurrent Users'}                         = 'Конкурентни потребители';
    $Lang->{'Demo'}                                     = 'Демо';
    $Lang->{'Developer Licence'}                        = 'Лиценз за разработчици';
    $Lang->{'Enterprise Licence'}                       = 'Ентърпрайс лиценз';
    $Lang->{'Freeware'}                                 = 'Безплатно разпространяван';
    $Lang->{'Open Source'}                              = 'Софтуер с отворен код';
    $Lang->{'Per Node'}                                 = 'Лицензиране на точка';
    $Lang->{'Per Processor'}                            = 'Лицензиране за процесор';
    $Lang->{'Per Server'}                               = 'Лицензиране за сървър';
    $Lang->{'Per User'}                                 = 'Лицензиране за потребител';
    $Lang->{'Single Licence'}                           = 'Единичен лиценз';
    $Lang->{'Time Restricted'}                          = 'Лиценз, ограничен по време';
    $Lang->{'Unlimited'}                                = 'Неограничен лиценз';
    $Lang->{'Volume Licence'}                           = 'Специални обемни програми';
    $Lang->{'Model'}                                    = 'Модел';
    $Lang->{'Serial Number'}                            = 'Сериен Номер';
    $Lang->{'Operating System'}                         = 'Операционна система';
    $Lang->{'CPU'}                                      = 'Процесор';
    $Lang->{'Ram'}                                      = 'Памет';
    $Lang->{'Hard Disk'}                                = 'Твърд диск';
    $Lang->{'Hard Disk::Capacity'}                      = 'Твърд диск::капацитет';
    $Lang->{'Capacity'}                                 = 'Капацитет';
    $Lang->{'FQDN'}                                     = 'FQDN';
    $Lang->{'Network Adapter'}                          = 'Мрежов адаптер';
    $Lang->{'Network Adapter::IP over DHCP'}            = 'Мрежов адаптер::IP от DHCP';
    $Lang->{'Network Adapter::IP Address'}              = 'Мрежов адаптер::IP Адрес';
    $Lang->{'IP over DHCP'}                             = 'IP от DHCP';
    $Lang->{'IP Address'}                               = 'IP адрес';
    $Lang->{'Graphic Adapter'}                          = 'Графична карта';
    $Lang->{'Other Equipment'}                          = 'Друго оборудване';
    $Lang->{'Warranty Expiration Date'}                 = 'Дата на изтичане на гаранцията';
    $Lang->{'Install Date'}                             = 'Дата на инсталация';
    $Lang->{'Network Address'}                          = 'Мрежов адрес';
    $Lang->{'Network Address::Subnet Mask'}             = 'Мрежов адрес::Маска на подмрежата';
    $Lang->{'Network Address::Gateway'}                 = 'Мрежов адрес::Гейт преход';
    $Lang->{'Subnet Mask'}                              = 'Маска на подмрежата';
    $Lang->{'Gateway'}                                  = 'Гейт преход';
    $Lang->{'Licence Type'}                             = 'Тип на лиценза';
    $Lang->{'Licence Key'}                              = 'Лицензен ключ';
    $Lang->{'Licence Key::Quantity'}                    = 'Лицензен ключ::Количество';
    $Lang->{'Licence Key::Expiration Date'}             = 'Лицензен ключ::Дата на изтичане';
    $Lang->{'Quantity'}                                 = 'Количество';
    $Lang->{'Expiration Date'}                          = 'Дата на изтичане';
    $Lang->{'Media'}                                    = 'Медия';
    $Lang->{'Maximum number of one element'}            = '';
    $Lang->{'Identifier'}                               = '';
    $Lang->{'Phone 1'}                                  = '';
    $Lang->{'Phone 2'}                                  = '';
    $Lang->{'Address'}                                  = '';
    $Lang->{'Building'}                                 = '';
    $Lang->{'Floor'}                                    = '';
    $Lang->{'IT Facility'}                              = '';
    $Lang->{'Office'}                                   = '';
    $Lang->{'Outlet'}                                   = '';
    $Lang->{'Rack'}                                     = '';
    $Lang->{'Room'}                                     = '';
    $Lang->{'Workplace'}                                = '';
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
