# --
# Kernel/Language/ru_ITSMConfigItem.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: ru_ITSMConfigItem.pm,v 1.10 2011-06-15 14:02:07 ep Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ru_ITSMConfigItem;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAITSMConfigItem
    $Self->{Translation}->{'Address'} = '';
    $Self->{Translation}->{'Admin Tool'} = 'Системные утилиты';
    $Self->{Translation}->{'Backup Device'} = 'Устройство бэкапа';
    $Self->{Translation}->{'Beamer'} = 'Проектор';
    $Self->{Translation}->{'Building'} = '';
    $Self->{Translation}->{'CIHistory::ConfigItemCreate'} = '';
    $Self->{Translation}->{'CIHistory::ConfigItemDelete'} = '';
    $Self->{Translation}->{'CIHistory::DefinitionUpdate'} = '';
    $Self->{Translation}->{'CIHistory::DeploymentStateUpdate'} = '';
    $Self->{Translation}->{'CIHistory::IncidentStateUpdate'} = '';
    $Self->{Translation}->{'CIHistory::LinkAdd'} = '';
    $Self->{Translation}->{'CIHistory::LinkDelete'} = '';
    $Self->{Translation}->{'CIHistory::NameUpdate'} = '';
    $Self->{Translation}->{'CIHistory::ValueUpdate'} = '';
    $Self->{Translation}->{'CIHistory::VersionCreate'} = '';
    $Self->{Translation}->{'CIHistory::VersionDelete'} = '';
    $Self->{Translation}->{'CPU'} = 'ЦПУ';
    $Self->{Translation}->{'Camera'} = 'Камера';
    $Self->{Translation}->{'Capacity'} = 'Объем';
    $Self->{Translation}->{'Change Definition'} = 'Изменить описание';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = 'Невозможно изменить описание! Для подробной информации смотри System Log.';
    $Self->{Translation}->{'Client Application'} = 'Клиентское приложение';
    $Self->{Translation}->{'Client OS'} = 'Клиентская ОС';
    $Self->{Translation}->{'Concurrent Users'} = 'Конкурентая лицензия';
    $Self->{Translation}->{'Config Item-Area'} = 'Обзор основных средств';
    $Self->{Translation}->{'Config Items available'} = 'Доступно основных средств';
    $Self->{Translation}->{'Config Items shown'} = 'Показано основных средств';
    $Self->{Translation}->{'CMDB'} = '';
    $Self->{Translation}->{'Demo'} = 'Демо-версия';
    $Self->{Translation}->{'Desktop'} = 'Настольный ПК';
    $Self->{Translation}->{'Developer Licence'} = 'Лицензия для разработчика';
    $Self->{Translation}->{'Docking Station'} = 'Док-станция';
    $Self->{Translation}->{'Duplicate'} = 'Резерв';
    $Self->{Translation}->{'Embedded'} = 'Встроенный';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = '';
    $Self->{Translation}->{'Enterprise Licence'} = 'Корпоративная лицензия';
    $Self->{Translation}->{'Expiration Date'} = 'Срок лицензии';
    $Self->{Translation}->{'Expired'} = 'Устарело';
    $Self->{Translation}->{'FQDN'} = 'FQDN';
    $Self->{Translation}->{'Floor'} = '';
    $Self->{Translation}->{'Freeware'} = 'Бесплатное ПО';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Gateway'} = 'Шлюз';
    $Self->{Translation}->{'Graphic Adapter'} = 'Видео адаптер';
    $Self->{Translation}->{'Hard Disk'} = 'Жесткий диск';
    $Self->{Translation}->{'Hard Disk::Capacity'} = 'Жесткий диск::Объем';
    $Self->{Translation}->{'Hide Versions'} = 'Скрыть версии';
    $Self->{Translation}->{'IP Address'} = 'IP адрес';
    $Self->{Translation}->{'IP over DHCP'} = 'IP по DHCP';
    $Self->{Translation}->{'IT Facility'} = '';
    $Self->{Translation}->{'Inactive'} = 'Неактивно';
    $Self->{Translation}->{'Incident'} = 'Инцидент';
    $Self->{Translation}->{'Install Date'} = 'Дата установки';
    $Self->{Translation}->{'Keybord'} = 'Клавиатура';
    $Self->{Translation}->{'LAN'} = 'Сетевая карта';
    $Self->{Translation}->{'Laptop'} = 'Ноутбук';
    $Self->{Translation}->{'Last Change'} = 'Время последнего изменения';
    $Self->{Translation}->{'Licence Key'} = 'Лицензионный ключ';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = 'Лицензионный ключ::Срок лицензии';
    $Self->{Translation}->{'Licence Key::Quantity'} = 'Лицензионный ключ::Количество';
    $Self->{Translation}->{'Licence Type'} = 'Тип лицензии';
    $Self->{Translation}->{'Maintenance'} = 'Техническое обслуживание';
    $Self->{Translation}->{'Maximum number of one element'} = 'Максимальное количество одного элемента';
    $Self->{Translation}->{'Media'} = 'Мультимедийные средства';
    $Self->{Translation}->{'Middleware'} = 'Промежуточное ПО';
    $Self->{Translation}->{'Model'} = 'Модель';
    $Self->{Translation}->{'Modem'} = 'Модем';
    $Self->{Translation}->{'Monitor'} = 'Монитор';
    $Self->{Translation}->{'Mouse'} = 'Мышка';
    $Self->{Translation}->{'Network Adapter'} = 'Сетевой адаптер';
    $Self->{Translation}->{'Network Adapter::IP Address'} = 'Сетевой адаптер::IP адрес';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = 'Сетевой адаптер::IP по DHCP';
    $Self->{Translation}->{'Network Address'} = 'Сетевой адрес';
    $Self->{Translation}->{'Network Address::Gateway'} = 'Сетевой адрес::Шлюз';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = 'Сетевой адрес::Маска подсети';
    $Self->{Translation}->{'Open Source'} = 'ПО с открытым кодом';
    $Self->{Translation}->{'Operating System'} = 'Операционная система';
    $Self->{Translation}->{'Operational'} = 'В эксплуатации';
    $Self->{Translation}->{'Other'} = 'Другое';
    $Self->{Translation}->{'Other Equipment'} = 'Другое оборудование';
    $Self->{Translation}->{'Outlet'} = '';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA карта';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Per Node'} = 'На ноду(узел)';
    $Self->{Translation}->{'Per Processor'} = 'На ЦПУ';
    $Self->{Translation}->{'Per Server'} = 'На сервер';
    $Self->{Translation}->{'Per User'} = 'На пользователя';
    $Self->{Translation}->{'Phone 1'} = '';
    $Self->{Translation}->{'Phone 2'} = '';
    $Self->{Translation}->{'Pilot'} = 'Эксперимент';
    $Self->{Translation}->{'Planned'} = 'Запланированно';
    $Self->{Translation}->{'Printer'} = 'Принтер';
    $Self->{Translation}->{'Production'} = 'Производство';
    $Self->{Translation}->{'Quantity'} = 'Количество';
    $Self->{Translation}->{'Rack'} = '';
    $Self->{Translation}->{'Ram'} = 'ОЗУ';
    $Self->{Translation}->{'Repair'} = 'Ремонт';
    $Self->{Translation}->{'Retired'} = 'Списано';
    $Self->{Translation}->{'Review'} = 'Экспертиза';
    $Self->{Translation}->{'Room'} = '';
    $Self->{Translation}->{'Router'} = 'Маршрутизатор';
    $Self->{Translation}->{'Scanner'} = 'Сканер';
    $Self->{Translation}->{'Search Config Items'} = 'Поиск основных средств';
    $Self->{Translation}->{'Security Device'} = 'Смарт-карта';
    $Self->{Translation}->{'Serial Number'} = 'Серийный номер';
    $Self->{Translation}->{'Server'} = 'Сервер';
    $Self->{Translation}->{'Server Application'} = 'Серверное приложение';
    $Self->{Translation}->{'Server OS'} = 'Серверная ОС';
    $Self->{Translation}->{'Show Versions'} = 'Показать версии';
    $Self->{Translation}->{'Single Licence'} = 'Однократная лицензия';
    $Self->{Translation}->{'Subnet Mask'} = 'Маска подсети';
    $Self->{Translation}->{'Switch'} = 'Коммутатор';
    $Self->{Translation}->{'Telco'} = '';
    $Self->{Translation}->{'Test/QA'} = 'Тестирование';
    $Self->{Translation}->{'The deployment state of this config item'} = 'Состояние использования этого основного средства';
    $Self->{Translation}->{'The incident state of this config item'} = 'Статус';
    $Self->{Translation}->{'Time Restricted'} = 'Ограниченная по времени';
    $Self->{Translation}->{'USB Device'} = 'USB устройство';
    $Self->{Translation}->{'Unlimited'} = 'Без ограничений';
    $Self->{Translation}->{'User Tool'} = 'Пользовательские утилиты';
    $Self->{Translation}->{'Volume Licence'} = 'Корпоративная лицензия';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'WLAN Access Point'} = 'WLAN точка доступа';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Срок истечения гарантии';
    $Self->{Translation}->{'Workplace'} = '';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Управление основными средствами';
    $Self->{Translation}->{'Change class definition'} = '';
    $Self->{Translation}->{'Config Item'} = 'Основные средства';
    $Self->{Translation}->{'Class'} = 'Класс';
    $Self->{Translation}->{'Definition'} = '';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Filter for Classes'} = '';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = '';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'Имя этого учетного элемента';
    $Self->{Translation}->{'Deployment State'} = 'Состояние использования';
    $Self->{Translation}->{'Incident State'} = 'Состояние инцидента';

    # Template: AgentITSMConfigItemHistory

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Config Items per page'} = '';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'Deployment State Type'} = '';
    $Self->{Translation}->{'Current Incident State'} = 'Текущее состояние инцидента';
    $Self->{Translation}->{'Current Incident State Type'} = '';
    $Self->{Translation}->{'Last Changed'} = '';

    # Template: AgentITSMConfigItemPrint
    $Self->{Translation}->{'ConfigItem'} = '';
    $Self->{Translation}->{'ConfigItem-Info'} = '';
    $Self->{Translation}->{'Current Deployment State'} = 'Текущее состояние использования';
    $Self->{Translation}->{'Last changed'} = 'Время последнего изменения';
    $Self->{Translation}->{'Last changed by'} = 'Автор последнего изменения';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Search-Template'} = '';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Искать в предыдущих версиях?';

    # Template: AgentITSMConfigItemSearchResultPrint
    $Self->{Translation}->{'CreateTime'} = '';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = '';
    $Self->{Translation}->{'Show one version'} = '';
    $Self->{Translation}->{'Show all versions'} = '';
    $Self->{Translation}->{'Version Incident State'} = '';
    $Self->{Translation}->{'Version Number'} = '';
    $Self->{Translation}->{'Created By'} = '';
    $Self->{Translation}->{'Changed On'} = '';
    $Self->{Translation}->{'Resize'} = '';
    $Self->{Translation}->{'Show or hide the content.'} = '';
    $Self->{Translation}->{'Configuration Item Version Details'} = '';
    $Self->{Translation}->{'Property'} = '';

    # SysConfig
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} = '';
    $Self->{Translation}->{'Configuration Item Limit'} = '';
    $Self->{Translation}->{'Configuration Item limit per page'} = '';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} = '';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} = '';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} = '';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected'} = '';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} = '';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = '';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} = '';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} = '';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} = '';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} = '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} = '';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} = '';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} = '';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuraton item zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} = '';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} = '';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} = '';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #

}

1;
