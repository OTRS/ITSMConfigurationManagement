// --
// Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
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
        var AttachmentsFileID = Core.Config.Get('ITSMConfigItemAttachmentsFileID') || [];
        $.each(AttachmentsFileID, function(Idx, FileID) {
            FileID = Core.App.EscapeSelector(FileID);
            $('#AttachmentDelete' + FileID).bind('click', function () {
                Core.Form.Validate.DisableValidation($('#AttachmentDelete' + FileID).closest('form'));
            });
        });

        $('#FileUpload').bind('change', function (Event) {
            var $Form = $('#FileUpload').closest('form');
            Core.Form.Validate.DisableValidation($Form);
            $Form.find('#AttachmentUpload').val('1').end().submit();
        });

        $('#SubmitButton').on('click', function () {
            $('input[name=SubmitSave]').val('1');
        });

        $('.DisableValidation').bind('click', function (Event) {
            $('input[name=SubmitSave]').val('0');
            Core.Form.Validate.DisableValidation($('#ClassItem'));
            // fix for Safari: race condition with submit in Core.Form.Validate.js
            // fixed in OTRS 3.0.5, this line remains here for backwards compatibility reasons
            $('#ClassItem').removeClass('PreventMultipleSubmits');
        });
    };

    Core.Init.RegisterNamespace(TargetNS, 'APP_MODULE');

    return TargetNS;
}(ITSM.Agent.ConfigItem.Edit || {}));
