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
 * @namespace ITSM.Agent.ConfigItem.Zoom
 * @memberof ITSM.Agent.ConfigItem
 * @author OTRS AG
 * @description
 *      This namespace contains the special module functions for the config item add.
 */
ITSM.Agent.ConfigItem.Zoom = (function (TargetNS) {

    /*
    * @name Init
    * @memberof ITSM.Agent.ConfigItem.Zoom
    * @function
    * @description
    *      This function initializes config item zoom section.
    */
    TargetNS.Init = function () {
        var ITSMShowConfirmDialog = Core.Config.Get('ITSMShowConfirmDialog');

        ITSM.Agent.Zoom.Init(Core.Config.Get('UserConfigItemZoomTableHeight'));

        $('ul.Actions a.AsPopup').on('click', function () {
            Core.UI.Popup.OpenPopup($(this).attr('href'), 'Action');
            return false;
        });

        $('.MasterAction').on('click', function (Event) {
            var $MasterActionLink = $(this).find('.MasterActionLink');
            // only act if the link was not clicked directly
            if (Event.target !== $MasterActionLink.get(0)) {
                window.location = $MasterActionLink.attr('href');
                return false;
            }
        });

        // Initialize allocation list for link object table.
        Core.Agent.TableFilters.SetAllocationList();

        if (ITSMShowConfirmDialog) {
            $.each(ITSMShowConfirmDialog, function(Key, Data) {
                ITSM.Agent.ConfirmDialog.BindConfirmDialog({
                    ElementID:                  Data.MenuID,
                    ElementSelector:            Data.ElementSelector,
                    DialogContentQueryString:   Data.DialogContentQueryString,
                    ConfirmedActionQueryString: Data.ConfirmedActionQueryString,
                    DialogTitle:                Data.DialogTitle,
                    TranslatedText:             {
                        Yes: Core.Language.Translate("Yes"),
                        No:  Core.Language.Translate("No"),
                        Ok:  Core.Language.Translate("Ok")
                    }
                });
            });
        }
    };

    Core.Init.RegisterNamespace(TargetNS, 'APP_MODULE');

    return TargetNS;
}(ITSM.Agent.ConfigItem.Zoom || {}));
