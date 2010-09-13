// --
// ITSM.Agent.ConfigItem.Search.js - provides the special module functions for the global search
// Copyright (C) 2001-2010 OTRS AG, http://otrs.org/\n";
// --
// $Id: ITSM.Agent.ConfigItem.Search.js,v 1.2 2010-09-13 22:59:59 cr Exp $
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
 * @namespace
 * @exports TargetNS as ITSM.Agent.ConfigItem.Search
 * @description
 *      This namespace contains the special module functions for the search.
 */

ITSM.Agent.ConfigItem.Search = (function (TargetNS) {

    /**
     * @function
     * @private
     * @param {Profile} Profile The profile that will be delete
     * @return nothing
     * @description Delete a profile via an ajax requests
     */
    function DeleteRemote(Profile) {
        var Data = {
            Action: 'AgentITSMConfigItemSearch',
            Subaction: 'AJAXProfileDelete',
            Profile: Profile,
            ClassID: $('#SearchClassID').val()
        };
        Core.AJAX.FunctionCall(
            Core.Config.Get('CGIHandle'),
            Data,
            function () {}
        );
    }

    function ShowWaitingDialog(){
        Core.UI.Dialog.ShowContentDialog('<div class="Spacing Center"><span class="AJAXLoader" title="' + Core.Config.Get('LoadingMsg') + '"></span></div>', '', '10px', 'Center', true);
    }

    /**
     * @function
     * @return nothing
     *      This function add attributes for search
     */

    TargetNS.ItemAdd = function (Attribute) {
        $('#SerachAttributesHidden').find('label').each(function () {
            if ($(this).attr('for') === Attribute) {
                $(this).prev().clone().appendTo('#SearchInsert');
                $(this).clone().appendTo('#SearchInsert');
                $(this).next().clone().appendTo('#SearchInsert');
            }
        });

        // rebuild selection
        Core.Agent.Search.RebuildSelection();

        // set autocomple to customer type fields
        $('#SearchInsert').find('.ITSMCustomerSearch').each(function() {
            var InputId = $(this).attr('id') + 'Autocomplete';
            $(this).removeClass('ITSMCustomerSearch');
            $(this).attr('id', InputId);
            $(this).prev().attr('id', InputId + 'Selected');

            ITSM.Agent.ConfigItem.CustomerSearch.Init($('#' + InputId), Core.Config.Get('Autocomplete.Active'));

            // prevent dialog closure when select a customer from the list
            $('ul.ui-autocomplete').bind('click', function(Event) { Event.stopPropagation(); return false; });
        });
        return false;
    };


    /**
     * @function
     * @param {Profile} The profile that is set to the search dialog
     * @return nothing
     *      This function refresh the search dialog with the selected profile
     */

    TargetNS.RefreshSearchDialog = function (Profile) {
        var BaseLink = Core.Config.Get('Baselink') ;
            Action = 'Action=AgentITSMConfigItemSearch;' ;
            SubAction = 'Subaction=AJAXUpdate;' ;
            ClassID = 'ClassID=' + $('#SearchClassID').val() + ';';
            SearchProfile = 'Profile=' + Profile;
            URL =  BaseLink + Action + SubAction + ClassID + SearchProfile ;
        $('.InnerContent').addClass('Loading');
        Core.AJAX.ContentUpdate($('#AJAXUpdate'), URL, function(){
            TargetNS.OpenSearchDialog( '$Env{"Action"}' );
            $('#ITSMSearchProfile').removeClass('Hidden');
            $('#ITSMSearchFields').removeClass('Hidden');
            $('#SearchFormSubmit').removeClass('Hidden');
            $('.InnerContent').removeClass('Loading');
        });
    }


    /**
     * @function
     * @param {Event} Action
     * @return nothing
     *      This function open the search dialog
     */

    TargetNS.OpenSearchDialog = function (Action, Profile) {


       // hide add template block
       $('#SearchProfileAddBlock').hide();

        if ($('#Profile').val() && $('#Profile').val() !== 'last-search') {
            $('#SearchProfileDelete').show();
        }

        // register add of attribute
        $('.Add').live('click', function () {
            var Attribute = $('#Attribute').val();
            TargetNS.ItemAdd(Attribute)
            return false;
        });

        // register remove of attribute
        $('.Remove').live('click', function () {
            var $Element = $(this).parent();
            Core.Agent.Search.ItemRemove($Element);

            // rebuild selection
            Core.Agent.Search.RebuildSelection();

            return false;
        });

        // register return key
        $('#SearchForm').unbind('keypress.FilterInput').bind('keypress.FilterInput', function (Event) {
            if ((Event.charCode || Event.keyCode) === 13) {
                $('#SearchForm').submit();
                return false;
            }
        });

        // load profile
        $('#Profile').bind('change', function () {
            var Profile = $('#Profile').val();
            TargetNS.RefreshSearchDialog(Profile);
            return false;
        });

        // show add profile block or not
        $('#SearchProfileNew').bind('click', function (Event) {
            $('#SearchProfileAddBlock').toggle();
            Event.preventDefault();
            return false;
        });

        // add new profile
        $('#SearchProfileAddAction').bind('click', function () {
            var Name, $Element1, $Element2;

            // get name
            Name = $('#SearchProfileAddName').val();
            if (!Name) {
                return false;
            }

            // add name to profile selection
            $Element1 = $('#ProfileList').children().first().clone();
            $Element1.text(Name);
            $('#ProfileList').append($Element1);
            $Element2 = $('#Profile').children().first().clone();
            $Element2.text(Name);
            $Element2.attr('value', Name);
            $Element2.attr('selected', 'selected');
            $('#Profile').append($Element2);

            // set input box to empty
            $('#SearchProfileAddName').val('');

            // hide add template block
            $('#SearchProfileAddBlock').hide();

            $('#SearchProfileDelete').show();

            return false;
        });

        // delete profile
        $('#SearchProfileDelete').bind('click', function (Event) {

            // strip all already used attributes
            $('#Profile').find('option').each(function () {
                if ($(this).attr('value') !== 'last-search') {
                    if ($(this).attr('selected') === true) {

                        // rebuild attributes
                        $('#SearchInsert').text('');

                        // remove remote
                        DeleteRemote($(this).val());

                        // remove local
                        $(this).remove();

                        // rebuild selection
                        TargetNS.RebuildSelection();
                    }
                }
            });

            if ($('#Profile').val() && $('#Profile').val() === 'last-search') {
                $('#SearchProfileDelete').hide();
            }

            Event.preventDefault();
            return false;
        });

    };

    return TargetNS;
}(ITSM.Agent.ConfigItem.Search || {}));
