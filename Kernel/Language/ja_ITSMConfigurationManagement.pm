# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Language::ja_ITSMConfigurationManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = '構成アイテム管理';
    $Self->{Translation}->{'Change class definition'} = 'クラス定義を変更';
    $Self->{Translation}->{'Config Item Class'} = '構成アイテムのクラス';
    $Self->{Translation}->{'Definition'} = '記述';
    $Self->{Translation}->{'Change'} = '変更';

    # Template: AgentDashboardITSMConfigItemGeneric
    $Self->{Translation}->{'Incident State'} = 'インシデント状況';
    $Self->{Translation}->{'Deployment State'} = 'デプロイ・ステータス';
    $Self->{Translation}->{'Class'} = 'クラス';
    $Self->{Translation}->{'Deployment State Type'} = 'デプロイ・ステータスのタイプ';
    $Self->{Translation}->{'Current Incident State'} = '現在のインシデント・ステータス';
    $Self->{Translation}->{'Current Incident State Type'} = '現在のインシデント・ステータスのタイプ';
    $Self->{Translation}->{'Last changed'} = '最終変更日時';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = '構成アイテム';
    $Self->{Translation}->{'Filter for Classes'} = 'クラスでフィルタ';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = '新規の構成アイテムを作成するには、リストからクラスを選択してください。';

    # Template: AgentITSMConfigItemBulk
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = '構成アイテム一括アクション';
    $Self->{Translation}->{'Deployment state'} = 'デプロイ・ステータス';
    $Self->{Translation}->{'Incident state'} = 'インシデント状況';
    $Self->{Translation}->{'Link to another'} = '他とリンクする';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = '構成アイテムの値が不正です!';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = '他の構成アイテムへのリンク数';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = '本当にこの構成アイテムを削除しますか？';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'この 構成アイテム の名称';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        'この名称はすでに Number(s): %s の構成アイテムで使用中です。';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = '構成アイテムの履歴: %s';
    $Self->{Translation}->{'History Content'} = '履歴内容';
    $Self->{Translation}->{'Createtime'} = '作成日時';
    $Self->{Translation}->{'Zoom view'} = 'ズーム・ビュー';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'コンテキストの設定';
    $Self->{Translation}->{'Config Items per page'} = '1ページ毎の設定項目';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = 'ジェネリック構成アイテムのテーブル';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Run Search'} = '検索を実行';
    $Self->{Translation}->{'Also search in previous versions?'} = 'プレビュー時、以前のバージョンも検索対象としますか？';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = '構成アイテム';
    $Self->{Translation}->{'Configuration Item Information'} = '構成アイテム情報';
    $Self->{Translation}->{'Current Deployment State'} = '現在のデプロイ・ステータス';
    $Self->{Translation}->{'Last changed by'} = '最終変更者';
    $Self->{Translation}->{'Show one version'} = '説明を表示';
    $Self->{Translation}->{'Show all versions'} = 'すべての説明を表示';
    $Self->{Translation}->{'Version Incident State'} = 'インシデント状態';
    $Self->{Translation}->{'Version Deployment State'} = 'バージョンのデプロイ・ステータス';
    $Self->{Translation}->{'Version Number'} = 'バージョンナンバー';
    $Self->{Translation}->{'Configuration Item Version Details'} = '構成アイテムの詳細';
    $Self->{Translation}->{'Property'} = '項目';

    # Perl Module: Kernel/Modules/AgentITSMConfigItem.pm
    $Self->{Translation}->{'No access to Class is given!'} = 'クラスへのアクセス権はありません！';
    $Self->{Translation}->{'Overview: ITSM ConfigItem'} = '一覧: 構成アイテム';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemBulk.pm
    $Self->{Translation}->{'No ConfigItemID is given!'} = 'ConfigItemIDが指定されていません！';
    $Self->{Translation}->{'You need at least one selected Configuration Item!'} = '少なくとも1つの選択された構成アイテムが必要です！';
    $Self->{Translation}->{'You don\'t have write access to this configuration item: %s.'} =
        'この構成アイテムへの書き込みアクセス権がありません: %s';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemDelete.pm
    $Self->{Translation}->{'Config item "%s" not found in database!'} = '構成アイテム "%s"がデータベースに見つかりません！';
    $Self->{Translation}->{'Was not able to delete the configitem ID %s!'} = '構成アイテムID%sを削除できませんでした！';
    $Self->{Translation}->{'No version found for ConfigItemID %s!'} = 'ConfigItemID%sのバージョンが見つかりません！';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemEdit.pm
    $Self->{Translation}->{'No ConfigItemID, DuplicateID or ClassID is given!'} = 'ConfigItemID、DuplicateID、ClassIDは指定されていません！';
    $Self->{Translation}->{'No access is given!'} = 'アクセス権はありません！';
    $Self->{Translation}->{'No definition was defined for class %s!'} = 'クラス%sの定義が定義されていません！';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemHistory.pm
    $Self->{Translation}->{'Can\'t show history, no ConfigItemID is given!'} = '履歴を表示することはできませんが、ConfigItemIDは指定されていません！';
    $Self->{Translation}->{'Can\'t show history, no access rights given!'} = '履歴を表示することはできません。アクセス権は与えられていません！';
    $Self->{Translation}->{'New ConfigItem (ID=%s)'} = '新しい構成アイテム(ID=%s)';
    $Self->{Translation}->{'New version (ID=%s)'} = '新しいバージョン（ID =%s）';
    $Self->{Translation}->{'Deployment state updated (new=%s, old=%s)'} = 'デプロイ・ステータスが更新されました。（新規=%s、前=%s）';
    $Self->{Translation}->{'Incident state updated (new=%s, old=%s)'} = 'インシデント状態が更新されました（新規=%s、古い=%s）';
    $Self->{Translation}->{'ConfigItem (ID=%s) deleted'} = '構成アイテムを削除 (ID=%s)';
    $Self->{Translation}->{'Link to %s (type=%s) added'} = '%s（タイプ=%s）へのリンクが追加されました';
    $Self->{Translation}->{'Link to %s (type=%s) deleted'} = '%s（タイプ=%s）へのリンクが削除されました';
    $Self->{Translation}->{'ConfigItem definition updated (ID=%s)'} = 'ConfigItem定義が更新されました（ID =%s）';
    $Self->{Translation}->{'Name updated (new=%s, old=%s)'} = '名前が更新されました（新規=%s、古い=%s）';
    $Self->{Translation}->{'Attribute %s updated from "%s" to "%s"'} = '属性%sが "%s"から "%s"に更新されました';
    $Self->{Translation}->{'Version %s deleted'} = 'バージョン%sが削除されました';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'No ConfigItemID or VersionID is given!'} = 'ConfigItemIDまたはVersionIDは指定されていません！';
    $Self->{Translation}->{'Can\'t show config item, no access rights given!'} = '構成アイテムを表示できません。アクセス権はありません！';
    $Self->{Translation}->{'ConfigItemID %s not found in database!'} = 'ConfigItemID%sはデータベースに見つかりません！';
    $Self->{Translation}->{'VersionID %s not found in database!'} = 'VersionID%sはデータベースに見つかりません！';
    $Self->{Translation}->{'ConfigItem'} = '構成アイテム';
    $Self->{Translation}->{'printed by %s at %s'} = '%sで%sで印刷されました';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'Invalid ClassID!'} = 'ClassIDが無効です！';
    $Self->{Translation}->{'No ClassID is given!'} = 'ClassIDは指定されていません！';
    $Self->{Translation}->{'No access rights for this class given!'} = 'このクラスのアクセス権はありません！';
    $Self->{Translation}->{'No Result!'} = '結果がありません。';
    $Self->{Translation}->{'Config Item Search Results'} = '構成アイテムの検索結果';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemZoom.pm
    $Self->{Translation}->{'Can\'t show item, no access rights for ConfigItem are given!'} =
        '構成アイテムを表示できません。構成アイテムのアクセス権は与えられていません！';
    $Self->{Translation}->{'operational'} = '通常運用';
    $Self->{Translation}->{'warning'} = '警告';
    $Self->{Translation}->{'incident'} = 'インシデント';
    $Self->{Translation}->{'The deployment state of this config item'} = 'この構成アイテムのデプロイ・ステータス';
    $Self->{Translation}->{'The incident state of this config item'} = 'この構成アイテムのインシデント状態';

    # Perl Module: Kernel/Output/HTML/Dashboard/ITSMConfigItemGeneric.pm
    $Self->{Translation}->{'Shown config items'} = '';

    # Perl Module: Kernel/Output/HTML/ITSMConfigItem/LayoutDate.pm
    $Self->{Translation}->{'Between'} = 'この間';

    # Perl Module: Kernel/System/ImportExport/ObjectBackend/ITSMConfigItem.pm
    $Self->{Translation}->{'Maximum number of one element'} = '一エレメントあたりの最大数';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = '空欄の項目は現在の値が保持されること意味します';
    $Self->{Translation}->{'Skipped'} = 'スキップされました';

    # Perl Module: var/packagesetup/ITSMConfigurationManagement.pm
    $Self->{Translation}->{'Model'} = 'モデル';
    $Self->{Translation}->{'Customer Company'} = '顧客企業';
    $Self->{Translation}->{'Serial Number'} = 'シリアルナンバー';
    $Self->{Translation}->{'CPU'} = 'CPU';
    $Self->{Translation}->{'Ram'} = 'RAM';
    $Self->{Translation}->{'Hard Disk'} = 'ハードディスク';
    $Self->{Translation}->{'Capacity'} = '容量';
    $Self->{Translation}->{'Network Adapter'} = 'ネットワークアダプタ';
    $Self->{Translation}->{'IP over DHCP'} = 'DHCP有効';
    $Self->{Translation}->{'IP Address'} = 'IP アドレス';
    $Self->{Translation}->{'Graphic Adapter'} = 'グラフィックアダプタ';
    $Self->{Translation}->{'Other Equipment'} = 'その他の機器';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'ワランティ終了日';
    $Self->{Translation}->{'Install Date'} = 'インストール日付';
    $Self->{Translation}->{'Phone 1'} = '電話 1';
    $Self->{Translation}->{'Phone 2'} = '電話 2';
    $Self->{Translation}->{'E-Mail'} = 'メールアドレス';
    $Self->{Translation}->{'Network Address'} = 'ネットワークアドレス';
    $Self->{Translation}->{'Subnet Mask'} = 'サブネットマスク';
    $Self->{Translation}->{'Gateway'} = 'ゲートウェイ';
    $Self->{Translation}->{'Licence Type'} = 'ライセンスタイプ';
    $Self->{Translation}->{'Licence Key'} = 'ライセンスキー';
    $Self->{Translation}->{'Quantity'} = '数量';
    $Self->{Translation}->{'Expiration Date'} = '有効期限';
    $Self->{Translation}->{'Media'} = 'メディア';

    # Database XML Definition: ITSMConfigurationManagement.sopm
    $Self->{Translation}->{'Computer'} = 'コンピューター';
    $Self->{Translation}->{'Hardware'} = 'ハードウェア';
    $Self->{Translation}->{'Network'} = 'ネットワーク';
    $Self->{Translation}->{'Software'} = 'ソフトウェア';
    $Self->{Translation}->{'Expired'} = '期限切れ';
    $Self->{Translation}->{'Maintenance'} = 'メンテナンス';
    $Self->{Translation}->{'Pilot'} = 'パイロット';
    $Self->{Translation}->{'Planned'} = '計画';
    $Self->{Translation}->{'Repair'} = '修理';
    $Self->{Translation}->{'Retired'} = '引退';
    $Self->{Translation}->{'Review'} = 'レビュー';
    $Self->{Translation}->{'Test/QA'} = 'テスト / QA';
    $Self->{Translation}->{'Laptop'} = 'ノートPC';
    $Self->{Translation}->{'Desktop'} = 'デスクトップ';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Server'} = 'サーバ';
    $Self->{Translation}->{'Other'} = '他';
    $Self->{Translation}->{'Monitor'} = 'モニタ';
    $Self->{Translation}->{'Printer'} = 'プリンタ';
    $Self->{Translation}->{'Switch'} = 'スイッチ';
    $Self->{Translation}->{'Router'} = 'ルータ';
    $Self->{Translation}->{'WLAN Access Point'} = 'WLAN アクセスポイント';
    $Self->{Translation}->{'Security Device'} = 'セキュリティデバイス';
    $Self->{Translation}->{'Backup Device'} = 'バックアップ・デバイス';
    $Self->{Translation}->{'Mouse'} = 'マウス';
    $Self->{Translation}->{'Keyboard'} = 'キーボード';
    $Self->{Translation}->{'Camera'} = 'カメラ';
    $Self->{Translation}->{'Beamer'} = 'プロジェクター';
    $Self->{Translation}->{'Modem'} = 'モデム';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA カード';
    $Self->{Translation}->{'USB Device'} = 'USBデバイス';
    $Self->{Translation}->{'Docking Station'} = 'ドッキングステーション';
    $Self->{Translation}->{'Scanner'} = 'スキャナ';
    $Self->{Translation}->{'Building'} = '構築';
    $Self->{Translation}->{'Office'} = '事務所';
    $Self->{Translation}->{'Floor'} = '切捨て';
    $Self->{Translation}->{'Room'} = '室内';
    $Self->{Translation}->{'Rack'} = 'ラック';
    $Self->{Translation}->{'Workplace'} = '職場';
    $Self->{Translation}->{'Outlet'} = 'アウトレット';
    $Self->{Translation}->{'IT Facility'} = 'ITファシリティ';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'Telco'} = '電話会社';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Client Application'} = 'クライアントソフト';
    $Self->{Translation}->{'Middleware'} = 'ミドルウェア';
    $Self->{Translation}->{'Server Application'} = 'サーバソフト';
    $Self->{Translation}->{'Client OS'} = 'クライアントOS';
    $Self->{Translation}->{'Server OS'} = 'サーバOS';
    $Self->{Translation}->{'Admin Tool'} = '管理ツール';
    $Self->{Translation}->{'User Tool'} = 'ユーザ・ツール';
    $Self->{Translation}->{'Embedded'} = '埋め込みオブジェクト';
    $Self->{Translation}->{'Single Licence'} = 'シングルライセンス';
    $Self->{Translation}->{'Per User'} = 'ユーザ毎';
    $Self->{Translation}->{'Per Processor'} = 'プロセッサ毎';
    $Self->{Translation}->{'Per Server'} = 'サーバ毎';
    $Self->{Translation}->{'Per Node'} = 'ノード毎';
    $Self->{Translation}->{'Volume Licence'} = 'ボリュームライセンス';
    $Self->{Translation}->{'Enterprise Licence'} = 'エンタープライズ・ライセンス';
    $Self->{Translation}->{'Developer Licence'} = '開発者ライセンス';
    $Self->{Translation}->{'Demo'} = 'デモ';
    $Self->{Translation}->{'Time Restricted'} = '時間制限';
    $Self->{Translation}->{'Freeware'} = 'フリーウェア';
    $Self->{Translation}->{'Open Source'} = 'オープンソース';
    $Self->{Translation}->{'Unlimited'} = '無制限';

    # JS File: ITSM.Agent.ConfigItem.Zoom
    $Self->{Translation}->{'Ok'} = 'Ok';

    # SysConfig
    $Self->{Translation}->{'Assigned CIs'} = '';
    $Self->{Translation}->{'CIs assigned to customer company'} = '';
    $Self->{Translation}->{'CIs assigned to customer user'} = '';
    $Self->{Translation}->{'CMDB Settings'} = 'CMDBの設定';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        '同じConfigItemクラス（ \'class\'）内またはグローバル（ \'global\'）内でのみ一意の名前を確認します。これは、重複を検索するときに既存のConfigItemがすべて考慮されることを意味します。';
    $Self->{Translation}->{'Config Items'} = '構成アイテム';
    $Self->{Translation}->{'Config item add.'} = '構成アイテムを追加';
    $Self->{Translation}->{'Config item edit.'} = '構成アイテムを修正';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        '担当者Webインタフェースの履歴を記録する構成アイテムのイベントモジュール';
    $Self->{Translation}->{'Config item history.'} = '構成アイテムの履歴';
    $Self->{Translation}->{'Config item print.'} = '構成アイテムを印刷';
    $Self->{Translation}->{'Config item zoom.'} = '構成アイテムのズーム';
    $Self->{Translation}->{'ConfigItemNumber'} = '構成アイテム番号';
    $Self->{Translation}->{'Configuration Item Limit'} = '構成アイテムの制限';
    $Self->{Translation}->{'Configuration Item limit per page.'} = 'ページあたりの構成アイテムの表示制限';
    $Self->{Translation}->{'Configuration Management Database.'} = '構成管理データベース';
    $Self->{Translation}->{'Configuration item bulk module.'} = '構成アイテムの一括モジュール';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        '担当者インターフェースの構成アイテムの検索バックエンドルーター';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = '構成アイテムの作成または変更';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        'リンクオブジェクトウィジェット（LinkObject :: ViewMode = "complex"）で設定ボタンを使用できるアクションを定義します。 これらのアクションは、次のJSおよびCSSファイルを登録している必要があります。Core.AllocationList.css、Core.UI.AllocationList.js、Core.UI.Table.Sort.js、Core.Agent.TableFilters.js、及びCore.Agent .LinkObject.js';
    $Self->{Translation}->{'Defines Required permissions to create ITSM configuration items using the Generic Interface.'} =
        'ジェネリックインターフェイスを活用して構成アイテムを作成する権限を定義する。';
    $Self->{Translation}->{'Defines Required permissions to delete ITSM configuration items using the Generic Interface.'} =
        'ジェネリック・インターフェースを活用して構成アイテムを削除するために必要な権限を定義します。';
    $Self->{Translation}->{'Defines Required permissions to get ITSM configuration items using the Generic Interface.'} =
        'ジェネリックインターフェイスを活用して構成アイテムを取得する権限を定義する。';
    $Self->{Translation}->{'Defines Required permissions to search ITSM configuration items using the Generic Interface.'} =
        'ジェネリックインターフェイスを活用して構成アイテムを検索する権限を定義する。';
    $Self->{Translation}->{'Defines Required permissions to update ITSM configuration items using the Generic Interface.'} =
        'ジェネリックインターフェイスを活用して構成アイテムを変更する権限を定義する。';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        '構成アイテムを定義して、構成アイテムのリストの小さなビューを表示します。';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        '各ConfigItemクラスの正規表現を個別に定義して、ConfigItem名を確認し、対応するエラーメッセージを表示します。';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        '構成アイテムのクラスのデフォルトのサブオブジェクトを定義する。';
    $Self->{Translation}->{'Defines the number of rows for the CI definition editor in the admin interface.'} =
        '管理インターフェイス Cl 定義エディタの行数を定義する。';
    $Self->{Translation}->{'Defines the order of incident states from high (e.g. cricital) to low (e.g. functional).'} =
        'インシデント状態の高（例: 危険）から低（例: 情報）へのインシデント状態の順序を定義する。';
    $Self->{Translation}->{'Defines the relevant deployment states where linked tickets can affect the status of a CI.'} =
        'リンクされたチケットがCIのステータスに影響を与える可能性がある、関連するデプロイ・ステータスを定義します。';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItem screen.'} =
        '構成アイテムの画面の検索制限を定義します。';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItemSearch screen.'} =
        '構成アイテムの検索画面の検索制限を定義します。';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected.'} =
        '構成アイテムの一覧に表示される列を定義します。 このオプションは列の位置には影響しません。 注：クラス列は、フィルター「全て」が選択されている場合は常に使用可能です。';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} =
        '構成アイテムの検索に表示される列を定義します。 このオプションは列の位置には影響しません。';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item overview depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'CIクラスに応じて、表示されるCIの列を設定項目の概要で定義します。 各エントリの先頭には、クラス名と二重コロン（つまり、Computer::)を付ける必要があります。全てのCIに共通のCI属性がいくつかあります。（コンピュータクラスの例：Computer::Name、Computer::CurDeplState、Computer::CreateTime）
 CI定義で定義されている個々のCI属性を表示するには、以下のスキームを使用する必要があります（コンピュータクラスの例）。
Computer::HardDisk::1,
Computer::HardDisk::1::Capacity::1,
Computer::HardDisk::2,
Computer::HardDisk::2::Capacity::1
CIクラスのエントリがない場合は、ITSMConfigItem :: Frontend :: AgentITSMConfigItem ### ShowColumnsの設定で定義されているデフォルトの列が表示されます。';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item search depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item widget depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting AgentCustomerInformationCenter::Backend###0060-CIC-ITSMConfigItemCustomerCompany (key DefaultColumns).'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view for all CI classes. If there is no entry, then the default columns are shown.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view, depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown.'} =
        '';
    $Self->{Translation}->{'Defines which type of link (named from the ticket perspective) can affect the status of a linked CI.'} =
        'リンクされたCIのステータスに影響するリンクのタイプ（チケットの観点から名前が付けられます）を定義します。';
    $Self->{Translation}->{'Defines which type of ticket can affect the status of a linked CI.'} =
        'リンクされたCIのステータスに影響するチケットのタイプを定義します。';
    $Self->{Translation}->{'Delete Configuration Item'} = '構成アイテムを削除';
    $Self->{Translation}->{'Deployment State Color'} = 'デプロイ・ステータスのカラー';
    $Self->{Translation}->{'Duplicate'} = 'コピー';
    $Self->{Translation}->{'Enables configuration item bulk action feature for the agent frontend to work on more than one configuration item at a time.'} =
        '担当者フロントエンドが一度に複数の設定項目で機能するように設定項目一括操作機能を有効にします。';
    $Self->{Translation}->{'Enables configuration item bulk action feature only for the listed groups.'} =
        'リストされたグループの構成アイテム一括処理機能のみを有効にします。';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        '';
    $Self->{Translation}->{'Event module to set configitem-status on ticket-configitem-link.'} =
        'チケット構成アイテムのリンクに構成アイテムのステータスを設定するイベントモジュール';
    $Self->{Translation}->{'ITSM config item overview.'} = '構成アイテムの一覧';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = 'クラスを担当するグループをチェックするモジュール';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        '構成アイテムを担当するグループをチェックするモジュール';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = '構成タイテムのレポートを生成するためのモジュール';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        'インポート/エクスポートモジュールのオブジェクトバックエンドモジュール登録';
    $Self->{Translation}->{'Overview.'} = '概要';
    $Self->{Translation}->{'Parameters for the dashboard backend of the customer company config item overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.'} =
        '';
    $Self->{Translation}->{'Parameters for the deployment states color in the preferences view of the agent interface.'} =
        'デプロイメントのパラメータは、担当者Webインタフェースの環境設定ビューで色を示します。';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        '担当者Webインタフェースの環境設定ビューで展開状態のパラメータ';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'ジェネラルカタログ属性のパーミッショングループ　の設定値';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        'ページのパラメータ（構成アイテムが表示されます）';
    $Self->{Translation}->{'Permission Group'} = '権限グループ';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} =
        '担当者Webインターフェイスで構成アイテム画面を使用するために必要な権限';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} =
        '担当者Webインターフェイスの構成アイテムの検索画面を使用するために必要な権限';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} =
        '担当者Webインターフェイス構成アイテムのズーム画面を使用するために必要な権限';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} =
        '担当者Webインターフェイスで構成アイテムの追加画面を使用するために必要な権限';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} =
        '担当者Webインターフェイスで構成アイテムの編集画面を使用するために必要な権限';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} =
        '担当者Webインターフェイスで構成アイテムの履歴画面を使用するために必要な権限';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} =
        '担当者Webインタフェースで構成アイテムの印刷画面を使用するために必要な権限';
    $Self->{Translation}->{'Required privileges to delete config items.'} = '構成アイテムを削除するために必要な特権';
    $Self->{Translation}->{'Search config items.'} = '構成アイテムを検索';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        '';
    $Self->{Translation}->{'Set the incident state of a CI automatically when a Ticket is Linked to a CI.'} =
        'チケットがCIにリンクされている場合、CIのインシデントのステータスを自動的に設定します。';
    $Self->{Translation}->{'Sets the deployment state in the configuration item bulk screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Sets the incident state in the configuration item bulk screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the configuration item overview of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to delete a configuration item in its zoom view of the agent interface.'} =
        'メニューにリンクを表示して、担当者Webインターフェイスのズーム表示で設定項目を削除します。';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the configuration item overview of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuration item zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to zoom into a configuration item in the configuration item overview of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        '担当者Webインターフェイスで構成アイテムの履歴（逆順）を表示します。';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        '構成アイテムの識別子。 ConfigItem＃、MyConfigItem＃、 デフォルトはConfigItem＃です。';
    $Self->{Translation}->{'class'} = 'クラス';
    $Self->{Translation}->{'global'} = 'グローバル';
    $Self->{Translation}->{'postproductive'} = '次の生産';
    $Self->{Translation}->{'preproductive'} = '再生産';
    $Self->{Translation}->{'productive'} = '生産';


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
