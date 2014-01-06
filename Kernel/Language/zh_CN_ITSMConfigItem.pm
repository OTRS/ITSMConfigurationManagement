# --
# Kernel/Language/zh_CN_ITSMConfigItem.pm - translation file
# Copyright (C) 2001-2014 OTRS AG, http://otrs.com/
# --
# Copyright (C) 2013 Michael Shi <micshi at 163.com>
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::zh_CN_ITSMConfigItem;

use strict;
use warnings;

sub Data {
    my $Self = shift;

    # Template: AAAITSMConfigItem
    $Self->{Translation}->{'Address'} = '地址';
    $Self->{Translation}->{'Admin Tool'} = '管理工具';
    $Self->{Translation}->{'Backup Device'} = '备份设备';
    $Self->{Translation}->{'Beamer'} = '投影仪';
    $Self->{Translation}->{'Building'} = '大厦';
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
    $Self->{Translation}->{'CIHistory::AttachmentAdd'} = '';
    $Self->{Translation}->{'CIHistory::AttachmentDelete'} = '';
    $Self->{Translation}->{'CPU'} = 'CPU';
    $Self->{Translation}->{'Camera'} = '照相机';
    $Self->{Translation}->{'Capacity'} = '容量';
    $Self->{Translation}->{'Change Definition'} = '修改定义';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = '修改定义失败!详细信息请参考系统日志.';
    $Self->{Translation}->{'Client Application'} = '客户端应用程序';
    $Self->{Translation}->{'Client OS'} = '客户操作系统';
    $Self->{Translation}->{'Concurrent Users'} = '并发用户数';
    $Self->{Translation}->{'Config Item-Area'} = '配置项区域';
    $Self->{Translation}->{'Config Items available'} = '有效的配置项';
    $Self->{Translation}->{'Config Items shown'} = '显示配置项';
    $Self->{Translation}->{'CMDB'} = '';
    $Self->{Translation}->{'Demo'} = '演示';
    $Self->{Translation}->{'Desktop'} = '台式电脑';
    $Self->{Translation}->{'Developer Licence'} = '开发许可';
    $Self->{Translation}->{'Docking Station'} = '坞站';
    $Self->{Translation}->{'Duplicate'} = '复制';
    $Self->{Translation}->{'Embedded'} = '嵌入式';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = '空字段表示当前值被保存';
    $Self->{Translation}->{'Enterprise Licence'} = '企业执照';
    $Self->{Translation}->{'Expiration Date'} = '过期日期';
    $Self->{Translation}->{'Expired'} = '到期';
    $Self->{Translation}->{'FQDN'} = 'FQDN';
    $Self->{Translation}->{'Floor'} = '楼层';
    $Self->{Translation}->{'Freeware'} = '免费软件';
    $Self->{Translation}->{'GSM'} = '';
    $Self->{Translation}->{'Gateway'} = '网关';
    $Self->{Translation}->{'Graphic Adapter'} = '图形处理器';
    $Self->{Translation}->{'Hard Disk'} = '硬盘';
    $Self->{Translation}->{'Hard Disk::Capacity'} = '硬盘::容量';
    $Self->{Translation}->{'Hide Versions'} = '隐藏版本';
    $Self->{Translation}->{'IP Address'} = 'IP地址';
    $Self->{Translation}->{'IP over DHCP'} = '从DHCP获取IP';
    $Self->{Translation}->{'IT Facility'} = 'IT设施';
    $Self->{Translation}->{'Inactive'} = '非活动的';
    $Self->{Translation}->{'Incident'} = '故障';
    $Self->{Translation}->{'Install Date'} = '安装日期';
    $Self->{Translation}->{'Keybord'} = '键盘';
    $Self->{Translation}->{'LAN'} = '';
    $Self->{Translation}->{'Laptop'} = '笔记本';
    $Self->{Translation}->{'Last Change'} = '最后修改于';
    $Self->{Translation}->{'Licence Key'} = '许可密钥';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = '许可密钥::到期日期';
    $Self->{Translation}->{'Licence Key::Quantity'} = '许可密钥::数量';
    $Self->{Translation}->{'Licence Type'} = '许可类别';
    $Self->{Translation}->{'Maintenance'} = '维护';
    $Self->{Translation}->{'Maximum number of one element'} = '此元素的最大数量';
    $Self->{Translation}->{'Media'} = '介质';
    $Self->{Translation}->{'Middleware'} = '中间件';
    $Self->{Translation}->{'Model'} = '型号';
    $Self->{Translation}->{'Modem'} = '调解调器';
    $Self->{Translation}->{'Monitor'} = '显示器';
    $Self->{Translation}->{'Mouse'} = '鼠标';
    $Self->{Translation}->{'Network Adapter'} = '网卡';
    $Self->{Translation}->{'Network Adapter::IP Address'} = '网卡::IP地址';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = '网卡::从DHCP获取IP';
    $Self->{Translation}->{'Network Address'} = '网络地址';
    $Self->{Translation}->{'Network Address::Gateway'} = '网络地址::网关';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = '网络地址::子网掩码';
    $Self->{Translation}->{'Open Source'} = '开源';
    $Self->{Translation}->{'Operating System'} = '操作系统';
    $Self->{Translation}->{'Operational'} = '正常';
    $Self->{Translation}->{'Other'} = '其它';
    $Self->{Translation}->{'Other Equipment'} = '其它设备';
    $Self->{Translation}->{'Outlet'} = '插座';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA卡';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Per Node'} = '每个节点';
    $Self->{Translation}->{'Per Processor'} = '每个处理器';
    $Self->{Translation}->{'Per Server'} = '每个服务器';
    $Self->{Translation}->{'Per User'} = '每个用户';
    $Self->{Translation}->{'Phone 1'} = '电话1';
    $Self->{Translation}->{'Phone 2'} = '电话2';
    $Self->{Translation}->{'Pilot'} = '试验';
    $Self->{Translation}->{'Planned'} = '已计划';
    $Self->{Translation}->{'Printer'} = '打印机';
    $Self->{Translation}->{'Production'} = '生产';
    $Self->{Translation}->{'Quantity'} = '数量';
    $Self->{Translation}->{'Rack'} = '机架';
    $Self->{Translation}->{'Ram'} = '内存';
    $Self->{Translation}->{'Repair'} = '修复';
    $Self->{Translation}->{'Retired'} = '报废';
    $Self->{Translation}->{'Review'} = '复审';
    $Self->{Translation}->{'Room'} = '房间';
    $Self->{Translation}->{'Router'} = '路由器';
    $Self->{Translation}->{'Scanner'} = '扫描仪';
    $Self->{Translation}->{'Search Config Items'} = '搜索配置项';
    $Self->{Translation}->{'Security Device'} = '安全设备';
    $Self->{Translation}->{'Serial Number'} = '序列号';
    $Self->{Translation}->{'Server'} = '服务器';
    $Self->{Translation}->{'Server Application'} = '服务器应用程序';
    $Self->{Translation}->{'Server OS'} = '服务器操作系统';
    $Self->{Translation}->{'Show Versions'} = '显示版本';
    $Self->{Translation}->{'Single Licence'} = '单一许可';
    $Self->{Translation}->{'Subnet Mask'} = '子网掩码';
    $Self->{Translation}->{'Switch'} = '交换机';
    $Self->{Translation}->{'Telco'} = '电话公司';
    $Self->{Translation}->{'Test/QA'} = '测试/QA';
    $Self->{Translation}->{'The deployment state of this config item'} = '配置项部署状态';
    $Self->{Translation}->{'The incident state of this config item'} = '配置项故障状态';
    $Self->{Translation}->{'Time Restricted'} = '时间限制';
    $Self->{Translation}->{'USB Device'} = 'USB 设备';
    $Self->{Translation}->{'Unlimited'} = '无限制的';
    $Self->{Translation}->{'User Tool'} = '用户工具';
    $Self->{Translation}->{'Volume Licence'} = '批量授权';
    $Self->{Translation}->{'WLAN'} = '无线网络';
    $Self->{Translation}->{'WLAN Access Point'} = 'WLAN 无线访问点';
    $Self->{Translation}->{'Warranty Expiration Date'} = '保修过期日期';
    $Self->{Translation}->{'Workplace'} = '车间';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = '管理配置项';
    $Self->{Translation}->{'Change class definition'} = '修改类定义';
    $Self->{Translation}->{'Config Item'} = '配置项';
    $Self->{Translation}->{'Class'} = '类';
    $Self->{Translation}->{'Definition'} = '';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Filter for Classes'} = '过滤类';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = '先从列表中选择类，然后创建新的配置项。';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = '为这个配置项命名';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        '';
    $Self->{Translation}->{'Deployment State'} = '部署状态';
    $Self->{Translation}->{'Incident State'} = '故障状态';

    # Template: AgentITSMConfigItemHistory

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = '上下文设置';
    $Self->{Translation}->{'Config Items per page'} = '每页配置项个数';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'Deployment State Type'} = '部署状态类型';
    $Self->{Translation}->{'Current Incident State'} = '当前的故障状态';
    $Self->{Translation}->{'Current Incident State Type'} = '当前的故障状态类型';
    $Self->{Translation}->{'Last changed'} = '最后修改';

    # Template: AgentITSMConfigItemPrint
    $Self->{Translation}->{'ConfigItem'} = '配置项';
    $Self->{Translation}->{'ConfigItem-Info'} = '';
    $Self->{Translation}->{'Current Deployment State'} = '当前的部署状态';
    $Self->{Translation}->{'Last changed by'} = '最后修改于';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Create New Template'} = '创建模板';
    $Self->{Translation}->{'Run Search'} = '搜索';
    $Self->{Translation}->{'Also search in previous versions?'} = '同时搜索以前的版本?';

    # Template: AgentITSMConfigItemSearchResultPrint
    $Self->{Translation}->{'CreateTime'} = '创建时间';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = '配置项';
    $Self->{Translation}->{'Configuration Item Information'} = '配置项信息';
    $Self->{Translation}->{'Show one version'} = '显示一个版本';
    $Self->{Translation}->{'Show all versions'} = '显示所有版本';
    $Self->{Translation}->{'Version Incident State'} = '版本故障状态';
    $Self->{Translation}->{'Version Number'} = '版本号';
    $Self->{Translation}->{'Configuration Item Version Details'} = '配置项版本详情';
    $Self->{Translation}->{'Property'} = '属性';

    # SysConfig
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        '';
    $Self->{Translation}->{'Config Items'} = '配置项';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        '';
    $Self->{Translation}->{'Configuration Item Limit'} = '';
    $Self->{Translation}->{'Configuration Item limit per page'} = '';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        '';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = '创建和管理配置项定义';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        '';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        '';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        '';
    $Self->{Translation}->{'Defines the number of rows for the CI definition editor in the admin interface.'} =
        '';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItem screen.'} =
        '';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItemSearch screen.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item overview depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item search depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view, depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown.'} =
        '';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        '';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        '';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = '';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        '';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        '';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuraton item zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        '';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        '';

    # Missed Translation Items
    $Self->{Translation}->{'ITSM ConfigItem'} ='ITSM配置项',
    $Self->{Translation}->{'Computer'} ='计算机',
    $Self->{Translation}->{'Hardware'} ='硬件',
    $Self->{Translation}->{'Network'} ='网络',
    $Self->{Translation}->{'Software'} ='软件',
    $Self->{Translation}->{'ConfigItem#'} = '配置项#',
    $Self->{Translation}->{'Config Items'} = '配置项',
    $Self->{Translation}->{'ConfigItem Type'} = '配置项类型',
    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #

}

1;
