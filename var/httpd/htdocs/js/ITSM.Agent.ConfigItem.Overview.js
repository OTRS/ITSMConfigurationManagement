// --
// Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (GPL). If you
// did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
// --

"use strict";

var ITSM = ITSM || {};
ITSM.Agent = ITSM.Agent || {};
ITSM.Agent.ConfigItem = ITSM.Agent.ConfigItem || {};

/**
 * @namespace ITSM.Agent.ConfigItem.Overview
 * @memberof ITSM.Agent.ConfigItem
 * @author OTRS AG
 * @description
 *      This namespace contains the special module functions for the config item overview navbar.
 */
ITSM.Agent.ConfigItem.Overview = (function (TargetNS) {

    /*
    * @name Init
    * @memberof ITSM.Agent.ConfigItem.Overview
    * @function
    * @description
    *      This function initializes the overview behaviours.
    */
    TargetNS.Init = function () {
        var ITSMConfigItemSearch    = Core.Config.Get('ITSMConfigItemSearch');
        var ITSMConfigItemActionRow = Core.Config.Get('ITSMConfigItemActionRow') || {};

        $('#ShowContextSettingsDialog').on('click', function (Event) {
            Core.UI.Dialog.ShowContentDialog($('#ContextSettingsDialogContainer'), Core.Language.Translate("Settings"), '20%', 'Center', true,                                                                             [
                    {                                                                                                                                                                                                             Label: Core.Language.Translate("Submit"),
                        Type: 'Submit',                                                                                                                                                                                           Class: 'Primary'
                    }                                                                                                                                                                                                     ]
            );                                                                                                                                                                                                        Event.preventDefault();
            Event.stopPropagation();                                                                                                                                                                                  return false;
        });

        if (ITSMConfigItemSearch) {
            $('#ITSMConfigItemSearch').on('click', function () {
                ITSM.Agent.ConfigItem.Search.OpenSearchDialog(
                    'AgentITSMConfigItemSearch',
                    Core.App.EscapeSelector(ITSMConfigItemSearch.Profile),
                    Core.App.EscapeSelector(ITSMConfigItemSearch.ClassID)
                );
                return false;
            });
        }

        $.each(ITSMConfigItemActionRow, function(Key, Data) {
            ITSM.UI.ConfigItemActionRow.AddActions($('#ConfigItemID_' + Key), Data);
        });

        ITSM.UI.ConfigItemActionRow.Init();

        Core.UI.InitCheckboxSelection($('table td.Checkbox'));

        $('.MasterAction').on('click', function (Event) {
            var $MasterActionLink = $(this).find('.MasterActionLink');
            // only act if the link was not clicked directly
            if (Event.target !== $MasterActionLink.get(0)) {
                window.location = $MasterActionLink.attr('href');
                return false;
            }
        });
    };

    Core.Init.RegisterNamespace(TargetNS, 'APP_MODULE');

    return TargetNS;
}(ITSM.Agent.ConfigItem.Overview || {}));
