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
 * @namespace ITSM.Agent.ConfigItem.Edit
 * @memberof ITSM.Agent
 * @author OTRS AG
 * @description
 *      This namespace contains the special module functions for the config item edit.
 */
ITSM.Agent.ConfigItem.Edit = (function (TargetNS) {

    /*
    * @name Init
    * @memberof ITSM.Agent.ConfigItem.Edit
    * @function
    * @description
    *      This function initializes the form submittion.
    */
    TargetNS.Init = function () {
        $('#SubmitButton').on('click', function () {
            $('input[name=SubmitSave]').val('1');
        });

        $('#CancelButton').on('click', function () {
            if (Core.UI.Popup.CurrentIsPopupWindow()) {
                Core.UI.Popup.ClosePopup();
                return false;
            }
        });

        $('.DisableValidation').on('click', function () {
            $('input[name=SubmitSave]').val('0');
            Core.Form.Validate.DisableValidation($('#ClassItem'));
            // fix for Safari: race condition with submit in Core.Form.Validate.js
            // fixed in OTRS 3.0.5, this line remains here for backwards compatibility reasons
            $('#ClassItem').removeClass('PreventMultipleSubmits');
        });

        // Register return key. But not in textareas.
        $('#ClassItem').off('keypress.FilterInput').on('keypress.FilterInput', function (Event) {
            if ((Event.charCode || Event.keyCode) === 13 && ($(Event.target).prop('tagName') !== 'TEXTAREA')) {
                $('#SubmitButton').click();
                return false;
            }
        });
    };

    Core.Init.RegisterNamespace(TargetNS, 'APP_MODULE');

    return TargetNS;
}(ITSM.Agent.ConfigItem.Edit || {}));
