# --
# Kernel/Language/ru_ITSMConfigItem.pm - the russian translation of ITSMConfigItem
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2008 Egor Tsilenko <bg8s at symlink.ru>
# --
# $Id: ru_ITSMConfigItem.pm,v 1.6 2010-09-21 17:09:44 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ru_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.6 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = 'Основные средства';
    $Lang->{'Config Item-Area'}       = 'Обзор основных средств';
    $Lang->{'Config Item Management'} = 'Управление основными средствами';
    $Lang->{'Change Definition'}      = 'Изменить описание';
    $Lang->{'Class'}                  = 'Класс';
    $Lang->{'Show Versions'}          = 'Показать версии';
    $Lang->{'Hide Versions'}          = 'Скрыть версии';
    $Lang->{'Last changed by'}        = 'Автор последнего изменения';
    $Lang->{'Last changed'}           = 'Время последнего изменения';
    $Lang->{'Change of definition failed! See System Log for details.'}
        = 'Невозможно изменить описание! Для подробной информации смотри System Log.';
    $Lang->{'Also search in previous versions?'} = 'Искать в предыдущих версиях?';
    $Lang->{'Config Items shown'}                = 'Показано основных средств';
    $Lang->{'Config Items available'}            = 'Доступно основных средств';
    $Lang->{'Search Config Items'}               = 'Поиск основных средств';
    $Lang->{'Deployment State'}                  = 'Состояние использования';
    $Lang->{'Current Deployment State'}          = 'Текущее состояние использования';
    $Lang->{'Incident State'}                    = 'Состояние инцидента';
    $Lang->{'Current Incident State'}            = 'Текущее состояние инцидента';
    $Lang->{'The name of this config item'}      = 'Имя этого учетного элемента';
    $Lang->{'The deployment state of this config item'}
        = 'Состояние использования этого основного средства';
    $Lang->{'The incident state of this config item'} = 'Статус';
    $Lang->{'Last Change'}                            = 'Время последнего изменения';
    $Lang->{'Duplicate'}                              = 'Резерв';
    $Lang->{'Expired'}                                = 'Устарело';
    $Lang->{'Inactive'}                               = 'Неактивно';
    $Lang->{'Maintenance'}                            = 'Техническое обслуживание';
    $Lang->{'Pilot'}                                  = 'Эксперимент';
    $Lang->{'Planned'}                                = 'Запланированно';
    $Lang->{'Production'}                             = 'Производство';
    $Lang->{'Repair'}                                 = 'Ремонт';
    $Lang->{'Retired'}                                = 'Списано';
    $Lang->{'Review'}                                 = 'Экспертиза';
    $Lang->{'Test/QA'}                                = 'Тестирование';
    $Lang->{'Operational'}                            = 'В эксплуатации';
    $Lang->{'Incident'}                               = 'Инцидент';
    $Lang->{'Desktop'}                                = 'Настольный ПК';
    $Lang->{'Laptop'}                                 = 'Ноутбук';
    $Lang->{'Other'}                                  = 'Другое';
    $Lang->{'PDA'}                                    = 'PDA';
    $Lang->{'Phone'}                                  = 'Телефон';
    $Lang->{'Server'}                                 = 'Сервер';
    $Lang->{'Backup Device'}                          = 'Устройство бэкапа';
    $Lang->{'Beamer'}                                 = 'Проектор';
    $Lang->{'Camera'}                                 = 'Камера';
    $Lang->{'Docking Station'}                        = 'Док-станция';
    $Lang->{'Keybord'}                                = 'Клавиатура';
    $Lang->{'Modem'}                                  = 'Модем';
    $Lang->{'Monitor'}                                = 'Монитор';
    $Lang->{'Mouse'}                                  = 'Мышка';
    $Lang->{'Other'}                                  = 'Другое';
    $Lang->{'PCMCIA Card'}                            = 'PCMCIA карта';
    $Lang->{'Printer'}                                = 'Принтер';
    $Lang->{'Router'}                                 = 'Маршрутизатор';
    $Lang->{'Scanner'}                                = 'Сканер';
    $Lang->{'Security Device'}                        = 'Смарт-карта';
    $Lang->{'Switch'}                                 = 'Коммутатор';
    $Lang->{'USB Device'}                             = 'USB устройство';
    $Lang->{'WLAN Access Point'}                      = 'WLAN точка доступа';
    $Lang->{'GSM'}                                    = 'GSM';
    $Lang->{'LAN'}                                    = 'Сетевая карта';
    $Lang->{'Other'}                                  = 'Другое';
    $Lang->{'Telco'}                                  = '';
    $Lang->{'WLAN'}                                   = 'WLAN';
    $Lang->{'Admin Tool'}                             = 'Системные утилиты';
    $Lang->{'Client Application'}                     = 'Клиентское приложение';
    $Lang->{'Client OS'}                              = 'Клиентская ОС';
    $Lang->{'Embedded'}                               = 'Встроенный';
    $Lang->{'Middleware'}                             = 'Промежуточное ПО';
    $Lang->{'Other'}                                  = 'Другое';
    $Lang->{'Server Application'}                     = 'Серверное приложение';
    $Lang->{'Server OS'}                              = 'Серверная ОС';
    $Lang->{'User Tool'}                              = 'Пользовательские утилиты';
    $Lang->{'Concurrent Users'}                       = 'Конкурентая лицензия';
    $Lang->{'Demo'}                                   = 'Демо-версия';
    $Lang->{'Developer Licence'}                      = 'Лицензия для разработчика';
    $Lang->{'Enterprise Licence'}                     = 'Корпоративная лицензия';
    $Lang->{'Freeware'}                               = 'Бесплатное ПО';
    $Lang->{'Open Source'}                            = 'ПО с открытым кодом';
    $Lang->{'Per Node'}                               = 'На ноду(узел)';
    $Lang->{'Per Processor'}                          = 'На ЦПУ';
    $Lang->{'Per Server'}                             = 'На сервер';
    $Lang->{'Per User'}                               = 'На пользователя';
    $Lang->{'Single Licence'}                         = 'Однократная лицензия';
    $Lang->{'Time Restricted'}                        = 'Ограниченная по времени';
    $Lang->{'Unlimited'}                              = 'Без ограничений';
    $Lang->{'Volume Licence'}                         = 'Корпоративная лицензия';
    $Lang->{'Model'}                                  = 'Модель';
    $Lang->{'Serial Number'}                          = 'Серийный номер';
    $Lang->{'Operating System'}                       = 'Операционная система';
    $Lang->{'CPU'}                                    = 'ЦПУ';
    $Lang->{'Ram'}                                    = 'ОЗУ';
    $Lang->{'Hard Disk'}                              = 'Жесткий диск';
    $Lang->{'Hard Disk::Capacity'}                    = 'Жесткий диск::Объем';
    $Lang->{'Capacity'}                               = 'Объем';
    $Lang->{'FQDN'}                                   = 'FQDN';
    $Lang->{'Network Adapter'}                        = 'Сетевой адаптер';
    $Lang->{'Network Adapter::IP over DHCP'}          = 'Сетевой адаптер::IP по DHCP';
    $Lang->{'Network Adapter::IP Address'}            = 'Сетевой адаптер::IP адрес';
    $Lang->{'IP over DHCP'}                           = 'IP по DHCP';
    $Lang->{'IP Address'}                             = 'IP адрес';
    $Lang->{'Graphic Adapter'}                        = 'Видео адаптер';
    $Lang->{'Other Equipment'}                        = 'Другое оборудование';
    $Lang->{'Warranty Expiration Date'}               = 'Срок истечения гарантии';
    $Lang->{'Install Date'}                           = 'Дата установки';
    $Lang->{'Network Address'}                        = 'Сетевой адрес';
    $Lang->{'Network Address::Subnet Mask'}           = 'Сетевой адрес::Маска подсети';
    $Lang->{'Network Address::Gateway'}               = 'Сетевой адрес::Шлюз';
    $Lang->{'Subnet Mask'}                            = 'Маска подсети';
    $Lang->{'Gateway'}                                = 'Шлюз';
    $Lang->{'Licence Type'}                           = 'Тип лицензии';
    $Lang->{'Licence Key'}                            = 'Лицензионный ключ';
    $Lang->{'Licence Key::Quantity'}                  = 'Лицензионный ключ::Количество';
    $Lang->{'Licence Key::Expiration Date'}           = 'Лицензионный ключ::Срок лицензии';
    $Lang->{'Quantity'}                               = 'Количество';
    $Lang->{'Expiration Date'}                        = 'Срок лицензии';
    $Lang->{'Media'}                                  = 'Мультимедийные средства';
    $Lang->{'Maximum number of one element'}          = 'Максимальное количество одного элемента';
    $Lang->{'Identifier'}                             = 'Идентификатор';
    $Lang->{'Phone 1'}                                = '';
    $Lang->{'Phone 2'}                                = '';
    $Lang->{'Address'}                                = '';
    $Lang->{'Building'}                               = '';
    $Lang->{'Floor'}                                  = '';
    $Lang->{'IT Facility'}                            = '';
    $Lang->{'Office'}                                 = '';
    $Lang->{'Outlet'}                                 = '';
    $Lang->{'Rack'}                                   = '';
    $Lang->{'Room'}                                   = '';
    $Lang->{'Workplace'}                              = '';
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
