# --
# Kernel/Language/zh_CN_ITSMConfigItem.pm - the Chinese simple translation of ITSMConfigItem
# Copyright (C) 2009 Never Min <never at qnofae.org>
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: zh_CN_ITSMConfigItem.pm,v 1.2 2009-10-14 20:47:42 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::zh_CN_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.2 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = '配置项';
    $Lang->{'Config Item-Area'}       = '配置项区域';
    $Lang->{'Config Item Management'} = '管理配置项';
    $Lang->{'Change Definition'}      = '修改定义';
    $Lang->{'Class'}                  = '级别';
    $Lang->{'Show Versions'}          = '显示版本';
    $Lang->{'Hide Versions'}          = '隐藏版本';
    $Lang->{'Last changed by'}        = '最后修改于';
    $Lang->{'Last changed'}           = '最后修改';
    $Lang->{'Change of definition failed! See System Log for details.'}        = '修改定义失败!详细信息请参考系统日志.';
    $Lang->{'Also search in previous versions?'} = '同时搜索以前的版本?';
    $Lang->{'Config Items shown'}                = '显示配置项';
    $Lang->{'Config Items available'}            = '有效的配置项';
    $Lang->{'Search Config Items'}               = '搜索配置项';
    $Lang->{'Deployment State'}                  = '部署状态';
    $Lang->{'Current Deployment State'}          = '当前的部署状态';
    $Lang->{'Incident State'}                    = '事件状态';
    $Lang->{'Current Incident State'}            = '当前的事件状态';
    $Lang->{'The name of this config item'}      = '为这个配置项命名';
    $Lang->{'The deployment state of this config item'}        = '应用这个部署状态到配置项';
    $Lang->{'The incident state of this config item'} = '应用这个事件状态到配置项';
    $Lang->{'Last Change'}                            = '最后更改';
    $Lang->{'Duplicate'}                              = '复制';
    $Lang->{'Expired'}                                = '到期';
    $Lang->{'Inactive'}                               = '非活动的';
    $Lang->{'Maintenance'}                            = '维护';
    $Lang->{'Pilot'}                                  = '引导';
    $Lang->{'Planned'}                                = '已规划';
    $Lang->{'Production'}                             = '产生';
    $Lang->{'Repair'}                                 = '修复';
    $Lang->{'Retired'}                                = '回收';
    $Lang->{'Review'}                                 = '复审';
    $Lang->{'Test/QA'}                                = '测试/QA';
    $Lang->{'Operational'}                            = '可用的';
    $Lang->{'Incident'}                               = '事件';
    $Lang->{'Desktop'}                                = '台式电脑';
    $Lang->{'Laptop'}                                 = '笔记本';
    $Lang->{'Other'}                                  = '其它';
    $Lang->{'PDA'}                                    = 'PDA';
    $Lang->{'Phone'}                                  = '电话';
    $Lang->{'Server'}                                 = '服务器';
    $Lang->{'Backup Device'}                          = '备份设备';
    $Lang->{'Beamer'}                                 = '投影仪';
    $Lang->{'Camera'}                                 = '照相机';
    $Lang->{'Docking Station'}                        = '坞站';
    $Lang->{'Keybord'}                                = '键盘';
    $Lang->{'Modem'}                                  = '调解调器';
    $Lang->{'Monitor'}                                = '显示器';
    $Lang->{'Mouse'}                                  = '鼠标';
    $Lang->{'Other'}                                  = '其它';
    $Lang->{'PCMCIA Card'}                            = 'PCMCIA 卡';
    $Lang->{'Printer'}                                = '打印机';
    $Lang->{'Router'}                                 = '路由器';
    $Lang->{'Scanner'}                                = '扫描仪';
    $Lang->{'Security Device'}                        = '安全设备';
    $Lang->{'Switch'}                                 = '交换机';
    $Lang->{'USB Device'}                             = 'USB 设备';
    $Lang->{'WLAN Access Point'}                      = 'WLAN 无线访问点';
    $Lang->{'GSM'}                                    = 'GSM';
    $Lang->{'LAN'}                                    = 'LAN';
    $Lang->{'Other'}                                  = '其它';
    $Lang->{'Telco'}                                  = '电话公司';
    $Lang->{'WLAN'}                                   = '无线网络';
    $Lang->{'Admin Tool'}                             = '管理员工具';
    $Lang->{'Client Application'}                     = '客户端应用程序';
    $Lang->{'Client OS'}                              = '客户操作系统';
    $Lang->{'Embedded'}                               = '嵌入式';
    $Lang->{'Middleware'}                             = '中间件';
    $Lang->{'Other'}                                  = '其它';
    $Lang->{'Server Application'}                     = '服务器应用程序';
    $Lang->{'Server OS'}                              = '服务器操作系统';
    $Lang->{'User Tool'}                              = '用户工具';
    $Lang->{'Concurrent Users'}                       = '并发用户数';
    $Lang->{'Demo'}                                   = '演示';
    $Lang->{'Developer Licence'}                      = '开发许可';
    $Lang->{'Enterprise Licence'}                     = '企业执照';
    $Lang->{'Freeware'}                               = '免费软件';
    $Lang->{'Open Source'}                            = '开源';
    $Lang->{'Per Node'}                               = '每节点';
    $Lang->{'Per Processor'}                          = '每处理器';
    $Lang->{'Per Server'}                             = '每服务器';
    $Lang->{'Per User'}                               = '每用户';
    $Lang->{'Single Licence'}                         = '单一许可';
    $Lang->{'Time Restricted'}                        = '时间限制';
    $Lang->{'Unlimited'}                              = '无限制的';
    $Lang->{'Volume Licence'}                         = '批量授权';
    $Lang->{'Model'}                                  = '型号';
    $Lang->{'Serial Number'}                          = '序列号';
    $Lang->{'Operating System'}                       = '操作系统';
    $Lang->{'CPU'}                                    = 'CPU';
    $Lang->{'Ram'}                                    = '内存';
    $Lang->{'Hard Disk'}                              = '硬盘';
    $Lang->{'Hard Disk::Capacity'}                    = '硬盘::容量';
    $Lang->{'Capacity'}                               = '容量';
    $Lang->{'FQDN'}                                   = 'FQDN';
    $Lang->{'Network Adapter'}                        = '网卡';
    $Lang->{'Network Adapter::IP over DHCP'}          = '网卡::从 DHCP 获取 IP';
    $Lang->{'Network Adapter::IP Address'}            = '网卡::IP 地址';
    $Lang->{'IP over DHCP'}                           = '从 DHCP 获取 IP';
    $Lang->{'IP Address'}                             = 'IP 地址';
    $Lang->{'Graphic Adapter'}                        = '图形处理器';
    $Lang->{'Other Equipment'}                        = '其它元素';
    $Lang->{'Warranty Expiration Date'}               = '保修过期日期';
    $Lang->{'Install Date'}                           = '安装日期';
    $Lang->{'Network Address'}                        = '网络地址';
    $Lang->{'Network Address::Subnet Mask'}           = '网络地址::子网掩码';
    $Lang->{'Network Address::Gateway'}               = '网络地址::网关';
    $Lang->{'Subnet Mask'}                            = '子网掩码';
    $Lang->{'Gateway'}                                = '网关';
    $Lang->{'Licence Type'}                           = '许可类别';
    $Lang->{'Licence Key'}                            = '许可密钥';
    $Lang->{'Licence Key::Quantity'}                  = '许可密钥::数量';
    $Lang->{'Licence Key::Expiration Date'}           = '许可密钥::到期时间';
    $Lang->{'Quantity'}                               = '数量';
    $Lang->{'Expiration Date'}                        = '过期日期';
    $Lang->{'Media'}                                  = '介质';
    $Lang->{'Maximum number of one element'}          = '此元素的最大数量';
    $Lang->{'Identifier'}                             = '用户标识符';
    $Lang->{'Phone 1'}                                = '电话 1';
    $Lang->{'Phone 2'}                                = '电话 2';
    $Lang->{'Address'}                                = '地址';
    $Lang->{'Building'}                               = '大厦';
    $Lang->{'Floor'}                                  = '楼层';
    $Lang->{'IT Facility'}                            = 'IT 设施';
    $Lang->{'Office'}                                 = '办公室';
    $Lang->{'Outlet'}                                 = '插座';
    $Lang->{'Rack'}                                   = '机架';
    $Lang->{'Room'}                                   = '房间';
    $Lang->{'Workplace'}                              = '车间';

    return 1;
}

1;
