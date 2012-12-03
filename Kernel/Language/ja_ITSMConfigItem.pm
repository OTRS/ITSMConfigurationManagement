# --
# Kernel/Language/ja_ITSMConfigItem.pm - translation file
# Copyright (C) 2001-2012 OTRS AG, http://otrs.org/
# --
# $Id: ja_ITSMConfigItem.pm,v 1.4 2012-12-03 12:29:37 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ja_ITSMConfigItem;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAITSMConfigItem
    $Self->{Translation}->{'Admin Tool'} = '管理ツール';
    $Self->{Translation}->{'Backup Device'} = 'バックアップ・デバイス';
    $Self->{Translation}->{'Beamer'} = 'プロジェクター';
    $Self->{Translation}->{'Building'} = '構築';
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
    $Self->{Translation}->{'CPU'} = '';
    $Self->{Translation}->{'Camera'} = 'カメラ';
    $Self->{Translation}->{'Change Definition'} = '定義の変更';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = '定義の変更に失敗しました。詳細はシステムログを参照してください。';
    $Self->{Translation}->{'Client Application'} = 'クライアントソフト';
    $Self->{Translation}->{'Client OS'} = 'クライアントOS';
    $Self->{Translation}->{'Concurrent Users'} = '同時実行ユーザ';
    $Self->{Translation}->{'Config Item-Area'} = 'アイテムエリアの設定';
    $Self->{Translation}->{'Config Items available'} = '設定項目の利用可 / 不可';
    $Self->{Translation}->{'Config Items shown'} = '設定項目表示';
    $Self->{Translation}->{'CMDB'} = '';
    $Self->{Translation}->{'Demo'} = 'デモ';
    $Self->{Translation}->{'Desktop'} = 'デスクトップ';
    $Self->{Translation}->{'Developer Licence'} = '開発者ライセンス';
    $Self->{Translation}->{'Docking Station'} = 'ドッキングステーション';
    $Self->{Translation}->{'Duplicate'} = 'コピー';
    $Self->{Translation}->{'Embedded'} = '埋め込みオブジェクト';
    $Self->{Translation}->{'Enterprise Licence'} = 'エンタープライズ・ライセンス';
    $Self->{Translation}->{'Expiration Date'} = '有効期限';
    $Self->{Translation}->{'Expired'} = '期限切れ';
    $Self->{Translation}->{'FQDN'} = '';
    $Self->{Translation}->{'Floor'} = '切捨て';
    $Self->{Translation}->{'Freeware'} = 'フリーウェア';
    $Self->{Translation}->{'GSM'} = '';
    $Self->{Translation}->{'Graphic Adapter'} = 'グラフィックアダプタ';
    $Self->{Translation}->{'Hard Disk::Capacity'} = 'ハードディスク容量';
    $Self->{Translation}->{'Hide Versions'} = 'バージョンを非表示';
    $Self->{Translation}->{'IP over DHCP'} = 'DHCP有効';
    $Self->{Translation}->{'IT Facility'} = 'ITファシリティ';
    $Self->{Translation}->{'Inactive'} = '無効の';
    $Self->{Translation}->{'Incident'} = '';
    $Self->{Translation}->{'Keybord'} = 'キーボード';
    $Self->{Translation}->{'LAN'} = '';
    $Self->{Translation}->{'Laptop'} = 'ノートPC';
    $Self->{Translation}->{'Last Change'} = '最新の変更';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = 'ライセンスキーの有効期限';
    $Self->{Translation}->{'Licence Key::Quantity'} = 'ライセンスキーの数';
    $Self->{Translation}->{'Maintenance'} = 'メンテナンス';
    $Self->{Translation}->{'Middleware'} = 'ミドルウェア';
    $Self->{Translation}->{'Modem'} = 'モデム';
    $Self->{Translation}->{'Monitor'} = 'モニタ';
    $Self->{Translation}->{'Mouse'} = 'マウス';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = 'ネットワーク・DHCP有効';
    $Self->{Translation}->{'Network Address::Gateway'} = 'デフォルトゲートウェイ';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = 'サブネットマスク';
    $Self->{Translation}->{'Open Source'} = 'オープンソース';
    $Self->{Translation}->{'Operational'} = '運用';
    $Self->{Translation}->{'Other'} = '他';
    $Self->{Translation}->{'Other Equipment'} = 'その他の機器';
    $Self->{Translation}->{'Outlet'} = 'アウトレット';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA カード';
    $Self->{Translation}->{'PDA'} = '';
    $Self->{Translation}->{'Per Node'} = 'ノード毎';
    $Self->{Translation}->{'Per Processor'} = 'プロセッサ毎';
    $Self->{Translation}->{'Per Server'} = 'サーバ毎';
    $Self->{Translation}->{'Per User'} = 'ユーザ毎';
    $Self->{Translation}->{'Phone 1'} = '電話 1';
    $Self->{Translation}->{'Phone 2'} = '電話 2';
    $Self->{Translation}->{'Pilot'} = 'パイロット';
    $Self->{Translation}->{'Planned'} = '計画';
    $Self->{Translation}->{'Printer'} = 'プリンタ';
    $Self->{Translation}->{'Production'} = '生産';
    $Self->{Translation}->{'Quantity'} = '数量';
    $Self->{Translation}->{'Rack'} = 'ラック';
    $Self->{Translation}->{'Ram'} = 'RAM';
    $Self->{Translation}->{'Repair'} = '修理';
    $Self->{Translation}->{'Retired'} = '引退';
    $Self->{Translation}->{'Review'} = 'レビュー';
    $Self->{Translation}->{'Room'} = '室内';
    $Self->{Translation}->{'Router'} = 'ルータ';
    $Self->{Translation}->{'Scanner'} = 'スキャナ';
    $Self->{Translation}->{'Search Config Items'} = '設定項目の検索';
    $Self->{Translation}->{'Security Device'} = 'セキュリティデバイス';
    $Self->{Translation}->{'Server'} = 'サーバ';
    $Self->{Translation}->{'Server Application'} = 'サーバソフト';
    $Self->{Translation}->{'Server OS'} = 'サーバOS';
    $Self->{Translation}->{'Show Versions'} = 'バージョンの表示';
    $Self->{Translation}->{'Single Licence'} = 'シングルライセンス';
    $Self->{Translation}->{'Switch'} = 'スイッチ';
    $Self->{Translation}->{'Telco'} = '電話会社';
    $Self->{Translation}->{'Test/QA'} = 'テスト / QA';
    $Self->{Translation}->{'The deployment state of this config item'} = 'この設定項目の展開状態';
    $Self->{Translation}->{'The incident state of this config item'} = 'この設定項目のインシデント状態';
    $Self->{Translation}->{'Time Restricted'} = '時間制限';
    $Self->{Translation}->{'USB Device'} = 'USBデバイス';
    $Self->{Translation}->{'Unlimited'} = '無制限';
    $Self->{Translation}->{'User Tool'} = 'ユーザ・ツール';
    $Self->{Translation}->{'Volume Licence'} = 'ボリュームライセンス';
    $Self->{Translation}->{'WLAN'} = '';
    $Self->{Translation}->{'WLAN Access Point'} = 'WLAN アクセスポイント';
    $Self->{Translation}->{'Workplace'} = '職場';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = '構成アイテム管理';
    $Self->{Translation}->{'Change class definition'} = 'クラス定義を変更';
    $Self->{Translation}->{'Definition'} = '記述';

    # Template: AgentITSMConfigItemAdd

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = '';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        '';

    # Template: AgentITSMConfigItemHistory

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'コンテキストの設定';
    $Self->{Translation}->{'Config Items per page'} = '1ページ毎の設定項目';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'Deployment State Type'} = '展開の状態';
    $Self->{Translation}->{'Current Incident State'} = '現在のインシデント状態';
    $Self->{Translation}->{'Current Incident State Type'} = '現在のインシデント状態のタイプ';
    $Self->{Translation}->{'Last changed'} = '最終変更日時';

    # Template: AgentITSMConfigItemPrint
    $Self->{Translation}->{'ConfigItem'} = '設定項目';
    $Self->{Translation}->{'ConfigItem-Info'} = '設定項目情報';
    $Self->{Translation}->{'Current Deployment State'} = '現在の展開状態';
    $Self->{Translation}->{'Last changed by'} = '最終変更者';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Also search in previous versions?'} = 'プレビュー時、以前のバージョンも検索対象としますか？';

    # Template: AgentITSMConfigItemSearchResultPrint
    $Self->{Translation}->{'CreateTime'} = '作成日時';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = '詳細設定';
    $Self->{Translation}->{'Configuration Item Information'} = '';
    $Self->{Translation}->{'Show one version'} = '説明を表示';
    $Self->{Translation}->{'Show all versions'} = 'すべての説明を表示';
    $Self->{Translation}->{'Version Incident State'} = 'インシデント状態';
    $Self->{Translation}->{'Version Number'} = 'バージョンナンバー';
    $Self->{Translation}->{'Configuration Item Version Details'} = '構成の詳細';
    $Self->{Translation}->{'Property'} = '項目';

    # SysConfig
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        '';
    $Self->{Translation}->{'Config Items'} = '';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        '';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        '';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        '';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItem screen.'} =
        '';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItemSearch screen.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} =
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
    $Self->{Translation}->{'With this config option it is possible to deactive the fixed overview control bar in the AgentITSMConfigItem overview. In some scenarios this will be necessary, f.e. due to small screen resolutions in combination with a lot of config item classes.'} =
        '';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #

}

1;
