# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Language::zh_CN_ITSMConfigurationManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = '管理配置项';
    $Self->{Translation}->{'Change class definition'} = '修改类定义';
    $Self->{Translation}->{'Config Item Class'} = '配置项类';
    $Self->{Translation}->{'Definition'} = '定义';
    $Self->{Translation}->{'Change'} = '变更';

    # Template: AgentDashboardITSMConfigItemGeneric
    $Self->{Translation}->{'Incident State'} = '故障状态';
    $Self->{Translation}->{'Deployment State'} = '部署状态';
    $Self->{Translation}->{'Class'} = '类';
    $Self->{Translation}->{'Deployment State Type'} = '部署状态类型';
    $Self->{Translation}->{'Current Incident State'} = '当前的故障状态';
    $Self->{Translation}->{'Current Incident State Type'} = '当前的故障状态类型';
    $Self->{Translation}->{'Last changed'} = '最后修改';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = '配置项';
    $Self->{Translation}->{'Filter for Classes'} = '类过滤器';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = '先从列表中选择类，然后创建新的配置项。';

    # Template: AgentITSMConfigItemBulk
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = 'ITSM 配置项 批量操作';
    $Self->{Translation}->{'Deployment state'} = '部署状态';
    $Self->{Translation}->{'Incident state'} = '事件状态';
    $Self->{Translation}->{'Link to another'} = '链接到其他';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = '无效的配置项编号！';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = '将要链接的另外一个配置项编号。';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = '你真的想要删除这个配置项吗?';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = '为这个配置项命名';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        '编号为(s):%s的配置项已经使用了此名字';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = '配置项：%s 的历史信息';
    $Self->{Translation}->{'History Content'} = '历史值';
    $Self->{Translation}->{'Createtime'} = '创建时间';
    $Self->{Translation}->{'Zoom view'} = '详情视图';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = '上下文设置';
    $Self->{Translation}->{'Config Items per page'} = '每页配置项个数';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = '一个通用的ITSM配置项表格';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Run Search'} = '搜索';
    $Self->{Translation}->{'Also search in previous versions?'} = '同时搜索以前的版本吗?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = '配置项';
    $Self->{Translation}->{'Configuration Item Information'} = '配置项信息';
    $Self->{Translation}->{'Current Deployment State'} = '当前的部署状态';
    $Self->{Translation}->{'Last changed by'} = '最后修改人';
    $Self->{Translation}->{'Show one version'} = '显示一个版本';
    $Self->{Translation}->{'Show all versions'} = '显示所有版本';
    $Self->{Translation}->{'Version Incident State'} = '版本故障状态';
    $Self->{Translation}->{'Version Deployment State'} = '版本部署状态';
    $Self->{Translation}->{'Version Number'} = '版本号';
    $Self->{Translation}->{'Configuration Item Version Details'} = '配置项版本详情';
    $Self->{Translation}->{'Property'} = '属性';

    # Perl Module: Kernel/Modules/AgentITSMConfigItem.pm
    $Self->{Translation}->{'No access to Class is given!'} = '没有类的访问权限！';
    $Self->{Translation}->{'Overview: ITSM ConfigItem'} = 'ITSM配置项概览';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemBulk.pm
    $Self->{Translation}->{'No ConfigItemID is given!'} = '没有指定配置项ID！';
    $Self->{Translation}->{'You need at least one selected Configuration Item!'} = '您至少需要一个选定的配置项！';
    $Self->{Translation}->{'You don\'t have write access to this configuration item: %s.'} =
        '你没有此配置项的写权限：%s。';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemDelete.pm
    $Self->{Translation}->{'Config item "%s" not found in database!'} = '在数据库中找不到配置项“%s”！';
    $Self->{Translation}->{'Was not able to delete the configitem ID %s!'} = '无法删除配置项ID %s！';
    $Self->{Translation}->{'No version found for ConfigItemID %s!'} = '找不到配置项ID%s的版本！';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemEdit.pm
    $Self->{Translation}->{'No ConfigItemID, DuplicateID or ClassID is given!'} = '没有指定配置项ID、DuplicateID或ClassID！';
    $Self->{Translation}->{'No access is given!'} = '没有访问权限！';
    $Self->{Translation}->{'No definition was defined for class %s!'} = '没有类 %s的定义！';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemHistory.pm
    $Self->{Translation}->{'Can\'t show history, no ConfigItemID is given!'} = '不能显示历史信息，因为没有指定配置项ID！';
    $Self->{Translation}->{'Can\'t show history, no access rights given!'} = '无法显示历史记录，因为没有访问权限！';
    $Self->{Translation}->{'New ConfigItem (ID=%s)'} = '新建配置项（ID=%s）';
    $Self->{Translation}->{'New version (ID=%s)'} = '新建版本（ID=%s）';
    $Self->{Translation}->{'Deployment state updated (new=%s, old=%s)'} = '部署状态已更新（新=%s，旧=%s）';
    $Self->{Translation}->{'Incident state updated (new=%s, old=%s)'} = '故障状态已更新（新=%s，旧=%s）';
    $Self->{Translation}->{'ConfigItem (ID=%s) deleted'} = '配置项（ID=%s）已删除';
    $Self->{Translation}->{'Link to %s (type=%s) added'} = '到%s链接的（类型=%s）已添加';
    $Self->{Translation}->{'Link to %s (type=%s) deleted'} = '到%s链接的（类型=%s）已删除';
    $Self->{Translation}->{'ConfigItem definition updated (ID=%s)'} = '配置项定义已更新（ID=%s）';
    $Self->{Translation}->{'Name updated (new=%s, old=%s)'} = '名称已更新（新=%s，旧=%s）';
    $Self->{Translation}->{'Attribute %s updated from "%s" to "%s"'} = '属性%s已从“%s”更新为“%s”';
    $Self->{Translation}->{'Version %s deleted'} = '版本%s 已删除';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'No ConfigItemID or VersionID is given!'} = '没有指定配置项ID或版本ID！';
    $Self->{Translation}->{'Can\'t show config item, no access rights given!'} = '无法显示配置项，因为没有访问权限！';
    $Self->{Translation}->{'ConfigItemID %s not found in database!'} = '在数据库中找不到配置项ID %s！';
    $Self->{Translation}->{'VersionID %s not found in database!'} = '在数据库中找不到版本ID %s！';
    $Self->{Translation}->{'ConfigItem'} = '配置项';
    $Self->{Translation}->{'printed by %s at %s'} = '打印人：%s ，打印日期：%s';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'Invalid ClassID!'} = '无效的类ID！';
    $Self->{Translation}->{'No ClassID is given!'} = '没有指定类ID！';
    $Self->{Translation}->{'No access rights for this class given!'} = '没有这个指定类的访问权限！';
    $Self->{Translation}->{'No Result!'} = '无结果！';
    $Self->{Translation}->{'Config Item Search Results'} = '配置项搜索结果';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemZoom.pm
    $Self->{Translation}->{'Can\'t show item, no access rights for ConfigItem are given!'} =
        '无法显示配置项，因为没有给定配置项的访问权限！';
    $Self->{Translation}->{'operational'} = '正常';
    $Self->{Translation}->{'warning'} = '警告';
    $Self->{Translation}->{'incident'} = '故障';
    $Self->{Translation}->{'The deployment state of this config item'} = '配置项部署状态';
    $Self->{Translation}->{'The incident state of this config item'} = '配置项故障状态';

    # Perl Module: Kernel/Output/HTML/Dashboard/ITSMConfigItemGeneric.pm
    $Self->{Translation}->{'Shown config items'} = '已显示的配置项';

    # Perl Module: Kernel/Output/HTML/ITSMConfigItem/LayoutDate.pm
    $Self->{Translation}->{'Between'} = '时间区间';

    # Perl Module: Kernel/System/ImportExport/ObjectBackend/ITSMConfigItem.pm
    $Self->{Translation}->{'Maximum number of one element'} = '单个元素的最大数量';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = '空字段表示保持当前值';
    $Self->{Translation}->{'Skipped'} = '跳过的';

    # Perl Module: var/packagesetup/ITSMConfigurationManagement.pm
    $Self->{Translation}->{'Model'} = '型号';
    $Self->{Translation}->{'Customer Company'} = '客户单位';
    $Self->{Translation}->{'Serial Number'} = '序列号';
    $Self->{Translation}->{'CPU'} = 'CPU';
    $Self->{Translation}->{'Ram'} = '内存';
    $Self->{Translation}->{'Hard Disk'} = '硬盘';
    $Self->{Translation}->{'Capacity'} = '容量';
    $Self->{Translation}->{'Network Adapter'} = '网卡';
    $Self->{Translation}->{'IP over DHCP'} = '从DHCP获取IP';
    $Self->{Translation}->{'IP Address'} = 'IP地址';
    $Self->{Translation}->{'Graphic Adapter'} = '显卡';
    $Self->{Translation}->{'Other Equipment'} = '其它设备';
    $Self->{Translation}->{'Warranty Expiration Date'} = '保修过期日期';
    $Self->{Translation}->{'Install Date'} = '安装日期';
    $Self->{Translation}->{'Phone 1'} = '电话1';
    $Self->{Translation}->{'Phone 2'} = '电话2';
    $Self->{Translation}->{'E-Mail'} = 'E-Mail';
    $Self->{Translation}->{'Network Address'} = '网络地址';
    $Self->{Translation}->{'Subnet Mask'} = '子网掩码';
    $Self->{Translation}->{'Gateway'} = '网关';
    $Self->{Translation}->{'Licence Type'} = '许可类别';
    $Self->{Translation}->{'Licence Key'} = '许可密钥';
    $Self->{Translation}->{'Quantity'} = '数量';
    $Self->{Translation}->{'Expiration Date'} = '过期日期';
    $Self->{Translation}->{'Media'} = '介质';

    # Database XML Definition: ITSMConfigurationManagement.sopm
    $Self->{Translation}->{'Computer'} = '计算机';
    $Self->{Translation}->{'Hardware'} = '硬件';
    $Self->{Translation}->{'Network'} = '网络';
    $Self->{Translation}->{'Software'} = '软件';
    $Self->{Translation}->{'Expired'} = '已过期';
    $Self->{Translation}->{'Maintenance'} = '维护';
    $Self->{Translation}->{'Pilot'} = '试验';
    $Self->{Translation}->{'Planned'} = '已计划';
    $Self->{Translation}->{'Repair'} = '修复';
    $Self->{Translation}->{'Retired'} = '报废';
    $Self->{Translation}->{'Review'} = '复审';
    $Self->{Translation}->{'Test/QA'} = '测试/品质保证';
    $Self->{Translation}->{'Laptop'} = '笔记本';
    $Self->{Translation}->{'Desktop'} = '台式电脑';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Server'} = '服务器';
    $Self->{Translation}->{'Other'} = '其它';
    $Self->{Translation}->{'Monitor'} = '显示器';
    $Self->{Translation}->{'Printer'} = '打印机';
    $Self->{Translation}->{'Switch'} = '交换机';
    $Self->{Translation}->{'Router'} = '路由器';
    $Self->{Translation}->{'WLAN Access Point'} = 'WLAN 无线访问点';
    $Self->{Translation}->{'Security Device'} = '安全设备';
    $Self->{Translation}->{'Backup Device'} = '备份设备';
    $Self->{Translation}->{'Mouse'} = '鼠标';
    $Self->{Translation}->{'Keyboard'} = '键盘';
    $Self->{Translation}->{'Camera'} = '照相机';
    $Self->{Translation}->{'Beamer'} = '投影仪';
    $Self->{Translation}->{'Modem'} = '调解调器';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA卡';
    $Self->{Translation}->{'USB Device'} = 'USB 设备';
    $Self->{Translation}->{'Docking Station'} = '坞站';
    $Self->{Translation}->{'Scanner'} = '扫描仪';
    $Self->{Translation}->{'Building'} = '大厦';
    $Self->{Translation}->{'Office'} = '办公室';
    $Self->{Translation}->{'Floor'} = '楼层';
    $Self->{Translation}->{'Room'} = '房间';
    $Self->{Translation}->{'Rack'} = '机架';
    $Self->{Translation}->{'Workplace'} = '工作间';
    $Self->{Translation}->{'Outlet'} = '插座';
    $Self->{Translation}->{'IT Facility'} = 'IT设施';
    $Self->{Translation}->{'LAN'} = '局域网';
    $Self->{Translation}->{'WLAN'} = '无线网络';
    $Self->{Translation}->{'Telco'} = '电话公司';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Client Application'} = '客户端应用程序';
    $Self->{Translation}->{'Middleware'} = '中间件';
    $Self->{Translation}->{'Server Application'} = '服务器应用程序';
    $Self->{Translation}->{'Client OS'} = '客户操作系统';
    $Self->{Translation}->{'Server OS'} = '服务器操作系统';
    $Self->{Translation}->{'Admin Tool'} = '管理工具';
    $Self->{Translation}->{'User Tool'} = '用户工具';
    $Self->{Translation}->{'Embedded'} = '嵌入式';
    $Self->{Translation}->{'Single Licence'} = '单一许可';
    $Self->{Translation}->{'Per User'} = '每个用户';
    $Self->{Translation}->{'Per Processor'} = '每个处理器';
    $Self->{Translation}->{'Per Server'} = '每个服务器';
    $Self->{Translation}->{'Per Node'} = '每个节点';
    $Self->{Translation}->{'Volume Licence'} = '批量授权';
    $Self->{Translation}->{'Enterprise Licence'} = '企业许可';
    $Self->{Translation}->{'Developer Licence'} = '开发许可';
    $Self->{Translation}->{'Demo'} = '演示';
    $Self->{Translation}->{'Time Restricted'} = '时间限制';
    $Self->{Translation}->{'Freeware'} = '免费软件';
    $Self->{Translation}->{'Open Source'} = '开源';
    $Self->{Translation}->{'Unlimited'} = '无限制的';

    # JS File: ITSM.Agent.ConfigItem.Zoom
    $Self->{Translation}->{'Ok'} = '确定';

    # SysConfig
    $Self->{Translation}->{'Assigned CIs'} = '已分配的配置项';
    $Self->{Translation}->{'CIs assigned to customer company'} = '已分配给客户单位的配置项';
    $Self->{Translation}->{'CIs assigned to customer user'} = '已分配给客户用户的配置项';
    $Self->{Translation}->{'CMDB Settings'} = 'CMDB设置';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        '检查是否为唯一名称的范围是仅在\'class\'（配置项类）内还是\'global\'(全局)，就是在查找重复配置项名称时的范围。';
    $Self->{Translation}->{'Config Items'} = '配置项';
    $Self->{Translation}->{'Config item add.'} = '添加配置项。';
    $Self->{Translation}->{'Config item edit.'} = '编辑配置项。';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        '服务人员界面用于记录配置项事件到历史的模块。';
    $Self->{Translation}->{'Config item history.'} = '配置项历史。';
    $Self->{Translation}->{'Config item print.'} = '打印配置项。';
    $Self->{Translation}->{'Config item zoom.'} = '配置项详情。';
    $Self->{Translation}->{'ConfigItemNumber'} = 'ConfigItemNumber（配置项编号）';
    $Self->{Translation}->{'Configuration Item Limit'} = '配置项限制';
    $Self->{Translation}->{'Configuration Item limit per page.'} = '每个页面上的配置项限制。';
    $Self->{Translation}->{'Configuration Management Database.'} = '配置管理数据库。';
    $Self->{Translation}->{'Configuration item bulk module.'} = '配置项批处理模块。';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        '服务人员界面的配置项搜索后端路由。';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = '创建和管理配置项定义';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '定义链接对象小部件(LinkObject::ViewMode = \"complex\")设置按钮中的操作。请注意，这些操作必须已经在以下JS和CSS文件中注册：Core.AllocationList.css、Core.UI.AllocationList.js、 Core.UI.Table.Sort.js、Core.Agent.TableFilters.js和Core.Agent.LinkObject.js。';
    $Self->{Translation}->{'Defines Required permissions to create ITSM configuration items using the Generic Interface.'} =
        '定义使用通用接口创建ITSM配置项所需的权限。';
    $Self->{Translation}->{'Defines Required permissions to delete ITSM configuration items using the Generic Interface.'} =
        '定义使用通用接口删除ITSM配置项所需的权限。';
    $Self->{Translation}->{'Defines Required permissions to get ITSM configuration items using the Generic Interface.'} =
        '定义使用通用接口获取ITSM配置项所需的权限。';
    $Self->{Translation}->{'Defines Required permissions to search ITSM configuration items using the Generic Interface.'} =
        '定义使用通用接口搜索ITSM配置项所需的权限。';
    $Self->{Translation}->{'Defines Required permissions to update ITSM configuration items using the Generic Interface.'} =
        '定义使用通用接口更新ITSM配置项所需的权限。';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        '定义显示配置项列表简洁视图的概览模块。';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        '为每个配置项类定义独立的正则表达式，以检查配置项名称并显示相应的错误消息。';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        '定义\'ITSMConfigItem\'类的默认子对象。';
    $Self->{Translation}->{'Defines the number of rows for the CI definition editor in the admin interface.'} =
        '定义在系统管理面板中修改配置项定义的编辑器的行数。';
    $Self->{Translation}->{'Defines the order of incident states from high (e.g. cricital) to low (e.g. functional).'} =
        '定义故障状态从高（如紧急）到低（如正常）的顺序。';
    $Self->{Translation}->{'Defines the relevant deployment states where linked tickets can affect the status of a CI.'} =
        '定义关联的部署状态，即链接的工单可以影响配置项状态的情况。';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItem screen.'} =
        '定义AgentITSMConfigItem（服务人员配置项）窗口的搜索限制';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItemSearch screen.'} =
        '定义AgentITSMConfigItemSearch（服务人员配置项搜索）窗口的搜索限制';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected.'} =
        '定义配置项概览显示的字段。这个选项不会影响字段的位置。注意：如果选择“全部”，则“Class（类）”字段总是会显示。';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} =
        '定义配置项搜索中显示的字段。这个选项不会影响字段的位置。';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item overview depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        '定义配置项概览视图中按配置项类分类显示的字段。每个条目均需以类名为前缀再加上双冒号（如计算机::）。有一些配置项属性是所有配置项都有的（例如，对于计算机类：计算机::名称、计算机::CurDeplState当前部署状态、计算机::CreateTime创建时间）。要显示在配置项定义中定义的独特的配置项属性，必须使用下面的方案（例如：对于计算机类：计算机::硬盘::1、计算机::硬盘::容量::1、计算机::硬盘::2、计算机::硬盘::2计算机::硬盘::2）。如果一个配置项类没有条目存在，则使用在ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns中设置的默认字段。';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item search depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        '定义按配置项类分类的配置项搜索结果中显示的字段。每个条目均需以类名为前缀再加上双冒号（如计算机::）。有一些配置项属性是所有配置项都有的（例如，对于计算机类：计算机::名称、计算机::CurDeplState当前部署状态、计算机::CreateTime创建时间）。要显示在配置项定义中定义的独特的配置项属性，必须使用下面的方案（例如：对于计算机类：计算机::硬盘::1、计算机::硬盘::容量::1、计算机::硬盘::2、计算机::硬盘::2计算机::硬盘::2）。如果一个配置项类没有条目存在，则使用在ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns中设置的默认字段。';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item widget depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting AgentCustomerInformationCenter::Backend###0060-CIC-ITSMConfigItemCustomerCompany (key DefaultColumns).'} =
        '定义配置项小部件中按配置项类分类显示的字段。每个条目均需以类名为前缀再加上双冒号（如计算机::）。有一些配置项属性是所有配置项都有的（例如，对于计算机类：Computer::Name、Computer::CurDeplState当前部署状态、Computer::CreateTime创建时间）。要显示在配置项定义中定义的独特的配置项属性，必须使用下面的方案（例如：对于计算机类：Computer::HardDisk::1【计算机::硬盘::1】、Computer::HardDisk::1::Capacity::1【计算机::硬盘::容量::1】、 Computer::HardDisk::2【计算机::硬盘::2】、Computer::HardDisk::2::Capacity::1【计算机::硬盘::2::容量::1】）。如果一个配置项类没有条目存在，则使用在AgentCustomerInformationCenter::Backend###0060-CIC-ITSMConfigItemCustomerCompany 中设置的默认字段(DefaultColumns键)。';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view for all CI classes. If there is no entry, then the default columns are shown.'} =
        '在所有配置项类的链接表复杂视图中定义要显示的配置项字段。 如果没有条目，则显示默认字段。';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view, depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown.'} =
        '定义链接表复合视图中按配置项类分类显示的字段。每个条目均需以类名为前缀再加上双冒号（如计算机::）。有一些配置项属性是所有配置项都有的（例如，对于计算机类：计算机::名称、计算机::CurDeplState当前部署状态、计算机::CreateTime创建时间）。要显示在配置项定义中定义的独特的配置项属性，必须使用下面的方案（例如：对于计算机类：计算机::硬盘::1、计算机::硬盘::容量::1、计算机::硬盘::2、计算机::硬盘::2计算机::硬盘::2）。如果一个配置项类没有条目存在，则使用在ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns中设置的默认字段。';
    $Self->{Translation}->{'Defines which type of link (named from the ticket perspective) can affect the status of a linked CI.'} =
        '定义哪一类(从工单角度命名的)链接可以影响一个链接的配置项的状态。';
    $Self->{Translation}->{'Defines which type of ticket can affect the status of a linked CI.'} =
        '定义哪一类工单可以影响一个链接的配置项的状态。';
    $Self->{Translation}->{'Delete Configuration Item'} = '删除配置项';
    $Self->{Translation}->{'Deployment State Color'} = '部署状态的颜色';
    $Self->{Translation}->{'Duplicate'} = '复制';
    $Self->{Translation}->{'Enables configuration item bulk action feature for the agent frontend to work on more than one configuration item at a time.'} =
        '在服务人员界面启用配置项批量操作功能，可以一次处理多个配置项。';
    $Self->{Translation}->{'Enables configuration item bulk action feature only for the listed groups.'} =
        '只有列表中的组才有权限使用配置项批量操作功能。';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        '启用/禁用检查配置项唯一名称功能。在启用这个选项前，您应该检查系统中是否已经存在重名的配置项，您可以使用这个脚本来检查重名情况：bin/otrs.ITSMConfigItemListDuplicates.pl。';
    $Self->{Translation}->{'Event module to set configitem-status on ticket-configitem-link.'} =
        '在工单-配置项的链接中设置配置项-状态的事件模块。';
    $Self->{Translation}->{'ITSM config item overview.'} = 'ITSM配置项概览。';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = '用于检查配置项类的组权限的模块。';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        '用于检查配置项的组权限的模块。';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = '用于生成ITSM配置项统计的模块';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        '用于导入/导出模块的对象后端模块注册。';
    $Self->{Translation}->{'Overview.'} = '概览。';
    $Self->{Translation}->{'Parameters for the dashboard backend of the customer company config item overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.'} =
        '服务人员界面客户客户单位配置项概览的仪表板后端的参数。"Limit（限制）" 是默认的显示条目数，“Group”（组）用于到本插件的访问权限限制（如 Group:admin;group1;group2）。“Default（默认）”代表这个插件是默认启用还是需要用户手动启用。“CacheTTL”是本插件的缓存过期时间（单位：分钟）。';
    $Self->{Translation}->{'Parameters for the deployment states color in the preferences view of the agent interface.'} =
        '服务人员界面偏好设置视图中用于部署状态颜色的参数。';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        '服务人员界面偏好设置视图中用于部署状态的参数。';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        '目录属性样例-权限组的参数。';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        '显示配置项的页面参数。';
    $Self->{Translation}->{'Permission Group'} = '权限组';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} =
        '服务人员界面使用ITSM配置项窗口需要的权限。';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} =
        '服务人员界面使用ITSM配置项搜索窗口需要的权限。';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} =
        '服务人员界面使用ITSM配置项详情窗口需要的权限。';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} =
        '服务人员界面使用添加ITSM配置项窗口需要的权限。';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} =
        '服务人员界面使用编辑ITSM配置项窗口需要的权限。';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} =
        '服务人员界面使用ITSM配置项历史窗口需要的权限。';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} =
        '服务人员界面使用ITSM配置项打印窗口需要的权限。';
    $Self->{Translation}->{'Required privileges to delete config items.'} = '删除配置项所需的权限。';
    $Self->{Translation}->{'Search config items.'} = '搜索配置项。';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        '选择配置项号码生成器模块。“AutoIncrement自动增量”使用系统ID、配置项类ID和计数器来增加配置项号，格式为：系统ID.配置项类ID.计数器，如1205000004、1205000005。';
    $Self->{Translation}->{'Set the incident state of a CI automatically when a Ticket is Linked to a CI.'} =
        '当一个工单链接到一个配置项时自动设置这个配置项的故障状态。';
    $Self->{Translation}->{'Sets the deployment state in the configuration item bulk screen of the agent interface.'} =
        '在服务人员界面配置项批量操作窗口设置部署状态。';
    $Self->{Translation}->{'Sets the incident state in the configuration item bulk screen of the agent interface.'} =
        '在服务人员界面配置项批量操作窗口设置事件状态。';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        '在服务人员界面配置项详情视图中，在菜单中显示一个允许链接配置项到另一对象的链接。';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the configuration item overview of the agent interface.'} =
        '在服务人员界面配置项概览视图中，在菜单中显示一个允许访问配置项历史的链接。';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        '在服务人员界面配置项详情视图中，在菜单中显示一个允许访问配置项历史的链接。';
    $Self->{Translation}->{'Shows a link in the menu to delete a configuration item in its zoom view of the agent interface.'} =
        '在服务人员界面配置项详情视图中，在菜单中显示一个删除配置项的链接。';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the configuration item overview of the agent interface.'} =
        '在服务人员界面配置项概览视图中，在菜单中显示一个复制配置项的链接。';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        '在服务人员界面配置项详情视图中，在菜单中显示一个复制配置项的链接。';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        '在服务人员界面配置项详情视图中，在菜单中显示一个编辑配置项的链接。';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuration item zoom view of the agent interface.'} =
        '在服务人员界面配置项详情视图中，在菜单中显示一个返回链接。';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        '在服务人员界面配置项详情视图中，在菜单中显示一个打印配置项的链接。';
    $Self->{Translation}->{'Shows a link in the menu to zoom into a configuration item in the configuration item overview of the agent interface.'} =
        '在服务人员界面配置项概览视图中，在菜单中显示一个查看配置项详情的链接。';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        '在服务人员界面显示配置项历史（倒序）。';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        '配置项标识符，如ConfigItem#、MyConfigItem#，默认是ConfigItem#。';
    $Self->{Translation}->{'class'} = '类';
    $Self->{Translation}->{'global'} = '全局';
    $Self->{Translation}->{'postproductive'} = '闲置';
    $Self->{Translation}->{'preproductive'} = '准备投产';
    $Self->{Translation}->{'productive'} = '投产';


    push @{ $Self->{JavaScriptStrings} // [] }, (
    'No',
    'Ok',
    'Please enter at least one search value or * to find anything.',
    'Settings',
    'Submit',
    'Yes',
    );

}

1;
