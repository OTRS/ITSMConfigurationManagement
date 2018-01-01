// --
// Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --

/*eslint-disable no-window*/

"use strict";

var ITSM = ITSM || {};
ITSM.Agent = ITSM.Agent || {};
ITSM.Agent.ConfigItem = ITSM.Agent.ConfigItem || {};

/**
 * @namespace ITSM.Agent.ConfigItem.History
 * @memberof ITSM.Agent.ConfigItem
 * @author OTRS AG
 * @description
 *      This namespace contains the special module functions for the config item history.
 */
ITSM.Agent.ConfigItem.History = (function (TargetNS) {

    /*
    * @name Init
    * @memberof ITSM.Agent.ConfigItem.History
    * @function
    * @description
    *      This function initializes the popup.
    */
    TargetNS.Init = function () {
        $('a.LinkZoomView').on('click', function () {
            window.opener.Core.UI.Popup.FirePopupEvent('URL', { URL: $(this).attr('href')});
            Core.UI.Popup.ClosePopup();
        });
    };

    Core.Init.RegisterNamespace(TargetNS, 'APP_MODULE');

    return TargetNS;
}(ITSM.Agent.ConfigItem.History || {}));
