// --
// Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (GPL). If you
// did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
// --


// TODO:
//Remove this line and fix JSDoc
// nofilter(TidyAll::Plugin::OTRS::JavaScript::ESLint)


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
     * @return nothing
     *      This function initializes the search screen.
     */
    TargetNS.Init = function () {
        var ITSMConfigItemOpenSearchDialog = Core.Config.Get('ITSMConfigItemOpenSearchDialog');
        if ( ITSMConfigItemOpenSearchDialog ) {
            ITSM.Agent.ConfigItem.Search.OpenSearchDialog(
                ITSMConfigItemOpenSearchDialog.Action,
                Core.App.EscapeSelector(ITSMConfigItemOpenSearchDialog.Profile),
                Core.App.EscapeSelector(ITSMConfigItemOpenSearchDialog.ClassID)
            );
        }
    };

    /**
     * @function
     * @return nothing
     *      This function rebuild attribute selection, only show available attributes.
     */
    TargetNS.AdditionalAttributeSelectionRebuild = function () {

        // get original selection with all possible fields and clone it
        var $AttributeClone = $('#AttributeOrig option').clone(),
            $AttributeSelection = $('#Attribute').empty(),
            Value;

        // strip all already used attributes
        $AttributeClone.each(function () {
            Value = Core.App.EscapeSelector($(this).attr('value'));
            if (!$('#SearchInsert label#Label' + Value).length) {
                $AttributeSelection.append($(this));
            }
        });

        $AttributeSelection.trigger('redraw.InputField');

        return true;
    };

    /**
     * @function
     * @param {String} of attribute to add.
     * @return nothing
     *      This function adds one attribute for search
     */
    TargetNS.SearchAttributeAdd = function (Attribute) {

        // escape possible colons (:) in element id because jQuery can not handle it in id attribute selectors
        Attribute = Core.App.EscapeSelector(Attribute);

        var $Label = $('#SearchAttributesHidden label#Label' + Attribute);

        if ($Label.length) {
            $Label.prev().clone().appendTo('#SearchInsert');
            $Label.clone().appendTo('#SearchInsert');
            $Label.next().clone().appendTo('#SearchInsert')

                // bind click function to remove button now
                .find('.RemoveButton').on('click', function () {
                    var $Element = $(this).parent();
                    TargetNS.SearchAttributeRemove($Element);

                    // rebuild selection
                    TargetNS.AdditionalAttributeSelectionRebuild();

                    return false;
                });

                // set autocomplete to customer type fields
                $('#SearchInsert').find('.ITSMCustomerSearch').each(function() {
                    var InputID = $(this).attr('id') + 'Autocomplete';
                    $(this).removeClass('ITSMCustomerSearch');
                    $(this).attr('id', InputID);
                    $(this).prev().attr('id', InputID + 'Selected');

                    // escape possible colons (:) in element id because jQuery can not handle it in id attribute selectors
                    ITSM.Agent.CustomerSearch.Init( $('#' + Core.App.EscapeSelector(InputID) ) );

                    // prevent dialog closure when select a customer from the list
                    $('ul.ui-autocomplete').on('click', function(Event) {
                        Event.stopPropagation();
                        return false;
                    });
                });
            }

        Core.UI.InputFields.Activate($('#SearchInsert'));

        return false;
    };

    /**
     * @function
     * @param {jQueryObject} $Element The jQuery object of the form  or any element
     *      within this form check.
     * @return nothing
     *      This function remove attributes from an element.
     */

    TargetNS.SearchAttributeRemove = function ($Element) {
        $Element.prev().prev().remove();
        $Element.prev().remove();
        $Element.remove();
    };

    /**
     * @function
     * @private
     * @param {String} Profile The profile name that will be delete.
     * @return nothing
     * @description Delete a profile via an ajax requests.
     */
    function SearchProfileDelete(Profile) {
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

    /**
     * @function
     * @private
     * @return nothing
     * @description Shows waiting dialog until search screen is ready.
     */
    function ShowWaitingDialog() {
        var Content = Core.Template.Render(
            'Agent/ITSMCore/LoadingDialog',
            {
                SpanTitle: Core.Config.Get('LoadingMsg')
            }
        );

        Core.UI.Dialog.ShowContentDialog(
            Content,
            Core.Config.Get('LoadingMsg'),
            '10px',
            'Center',
            true
        );
    }

    /**
     * @function
     * @param none
     * @return nothing
     *      This function sets all search dialog settings
     */

    TargetNS.SetSearchDialog = function() {

        // hide add template block
        $('#SearchProfileAddBlock').hide();

        // hide save changes in template block
        $('#SaveProfile').parent().hide().prev().hide().prev().hide();

        // search profile is selected
        if ($('#SearchProfile').val() && $('#SearchProfile').val() !== 'last-search') {

            // show delete button
            $('#SearchProfileDelete').show();

            // show profile link
            $('#SearchProfileAsLink').show();

            // show save changes in template block
            $('#SaveProfile').parent().show().prev().show().prev().show();

            // set SaveProfile to 0
            $('#SaveProfile').prop('checked', false);
        }

        Core.UI.InputFields.Activate($('.Dialog:visible'));

        // register add of attribute
        $('#Attribute').on('change', function () {
            var Attribute = $('#Attribute').val();
            TargetNS.SearchAttributeAdd(Attribute);
            TargetNS.AdditionalAttributeSelectionRebuild();

            // Register event for tree selection dialog
            $('.ShowTreeSelection').off('click').on('click', function () {
                Core.UI.TreeSelection.ShowTreeSelection($(this));
                return false;
            });

            return false;
        });

        // register return key
        $('#SearchForm').off('keypress.FilterInput').on('keypress.FilterInput', function (Event) {
            if ((Event.charCode || Event.keyCode) === 13) {
                if (!CheckForSearchedValues()) {
                    return false;
                }
                else {
                    $('#SearchFormSubmit').trigger('click');
                }
                return false;
            }
        });

        // register submit
        $('#SearchFormSubmit').off('click.DoSearch').on('click.DoSearch', function () {

            var ShownAttributes = [];

            if ($('#SearchProfileAddAction, #SearchProfileAddName').is(':visible') && $('#SearchProfileAddName').val()) {
                $('#SearchProfileAddAction').trigger('click');
            }

            // remember shown attributes
            $('#SearchInsert label').each(function () {
                if ($(this).attr('id')) {
                    ShownAttributes.push($(this).attr('id'));
                }
            });
            $('#SearchForm #ShownAttributes').val(ShownAttributes.join(';'));

            // Normal results mode will return HTML in the same window
            if ($('#SearchForm #ResultForm').val() === 'Normal') {

                if (!CheckForSearchedValues()) {
                    return false;
                }
                else {
                    CheckSearchStringsForStopWords(function () {
                        $('#SearchForm').submit();
                        return false;
                   });
                }
            }
            else { // Print and CSV should open in a new window, no waiting dialog
                $('#SearchForm').attr('target', 'SearchResultPage');
                if (!CheckForSearchedValues()) {
                    return false;
                }
                else {
                    CheckSearchStringsForStopWords(function () {
                        $('#SearchForm').submit();
                        $('#SearchForm').attr('target', '');
                    });
                }
            }
            return false;
        });

        Core.Form.Validate.Init();
        Core.Form.Validate.SetSubmitFunction($('#SearchForm'), function (Form) {
            Form.submit();

            // Show only a waiting dialog for Normal results mode, because this result
            //  will return the HTML in the same window.
            if ($('#SearchForm #ResultForm').val() === 'Normal') {
                ShowWaitingDialog();
            }
        });

        // load profile
        $('#SearchProfile').bind('change', function () {
            var SearchProfile = $('#SearchProfile').val(),
                SearchProfileClassID = $('#SearchClassID').val(),
                SearchProfileAction = $('#SearchAction').val();

            TargetNS.OpenSearchDialog(SearchProfileAction, SearchProfile, SearchProfileClassID);
            return false;
        });

        // show add profile block or not
        $('#SearchProfileNew').on('click', function (Event) {
            $('#SearchProfileAddBlock').toggle();
            $('#SearchProfileAddName').focus();
            Event.preventDefault();
            return false;
        });

        // add new profile
        $('#SearchProfileAddAction').bind('click', function () {
            var ProfileName, $Element1;

            // get name
            ProfileName = $('#SearchProfileAddName').val();

            // check name
            if (!ProfileName.length || ProfileName.length < 2) {
                return;
            }

            // add name to profile selection
            $Element1 = $('#SearchProfile').children().first().clone();
            $Element1.text(ProfileName);
            $Element1.attr('value', ProfileName);
            $Element1.prop('selected', true);
            $('#SearchProfile').append($Element1).trigger('redraw.InputField');

            // set input box to empty
            $('#SearchProfileAddName').val('');

            // hide add template block
            $('#SearchProfileAddBlock').hide();

            // hide save changes in template block
            $('#SaveProfile').parent().hide().prev().hide().prev().hide();

            // set SaveProfile to 1
            $('#SaveProfile').prop('checked', true);

            // show delete button
            $('#SearchProfileDelete').show();

            // show profile link
            $('#SearchProfileAsLink').show();
        });

        // direct link to profile
        $('#SearchProfileAsLink').bind('click', function () {
            var SearchProfile = $('#SearchProfile').val(),
                SearchProfileAction = $('#SearchAction').val(),
                ClassID = $('#SearchClassID').val();

            window.location.href = Core.Config.Get('Baselink') + 'Action=' + SearchProfileAction +
            ';Subaction=Search;TakeLastSearch=1;SaveProfile=1;Profile=' + encodeURIComponent(SearchProfile)
            + ';ClassID=' + ClassID;
            return false;
        });

        // delete profile
        $('#SearchProfileDelete').on('click', function (Event) {

            // strip all already used attributes
            $('#SearchProfile').find('option:selected').each(function () {
                if ($(this).attr('value') !== 'last-search') {

                    // rebuild attributes
                    $('#SearchInsert').text('');

                    // remove remote
                    SearchProfileDelete($(this).val());

                    // remove local
                    $(this).remove();

                    // show fulltext
                    TargetNS.SearchAttributeAdd('Fulltext');

                    // rebuild selection
                    TargetNS.AdditionalAttributeSelectionRebuild();
                }
            });
            $('#SearchProfile').trigger('change');

            if ($('#SearchProfile').val() && $('#SearchProfile').val() === 'last-search') {

                // hide delete link
                $('#SearchProfileDelete').hide();

                // show profile link
                $('#SearchProfileAsLink').hide();

            }

            Event.preventDefault();
            return false;
        });

    };

    /**
     * @function
     * @param {Profile} The profile that is set to the search dialog
     * @return nothing
     *      This function refresh the search dialog with the selected profile
     */

    TargetNS.LoadProfile = function (Profile) {
        var BaseLink = Core.Config.Get('Baselink'),
            Action = 'Action=AgentITSMConfigItemSearch;',
            SubAction = 'Subaction=AJAXUpdate;',
            ClassID = 'ClassID=' + $('#SearchClassID').val() + ';',
            SearchProfile = 'Profile=' + Profile,
            URL =  BaseLink + Action + SubAction + ClassID + SearchProfile;

        $('#DivClassID').addClass('ui-autocomplete-loading');
        Core.AJAX.ContentUpdate($('#AJAXUpdate'), URL, function() {
            var ITSMSearchProfileAttributes = Core.Config.Get('ITSMSearchProfileAttributes') || [];
            $.each(ITSMSearchProfileAttributes, function(Idx, Attribute) {
                ITSM.Agent.ConfigItem.Search.SearchAttributeAdd(Core.App.EscapeSelector(Attribute));
                ITSM.Agent.ConfigItem.Search.AdditionalAttributeSelectionRebuild();
            });

            TargetNS.SetSearchDialog( '$Env{"Action"}' );
            $('#ITSMSearchProfile').removeClass('Hidden');
            $('#ITSMSearchFields').removeClass('Hidden');
            $('.Dialog:visible #SearchFormSubmit').appendTo($('.Dialog:visible > .Content > .ContentFooter'));
            $('#SearchFormSubmit').removeClass('Hidden');
            $('#DivClassID').removeClass('ui-autocomplete-loading');
            Core.UI.InputFields.Activate($('#SearchForm'));
        });
    };

    /**
     * @private
     * @name CheckForSearchedValues
     * @memberof Core.Agent.Search
     * @function
     * @returns {Boolean} False if no values were found, true if values where there.
     * @description
     *      Checks if any values were entered in the search.
     *      If nothing at all exists, it alerts with translated:
     *      "Please enter at least one search value or * to find anything"
     */
    function CheckForSearchedValues() {
        // loop through the SerachForm labels
        var SearchValueFlag = false;
        $('#SearchForm label').each(function () {
            var ElementName,
                $Element,
                $LabelElement = $(this),
                $FieldElement = $LabelElement.next('.Field');
            // those with ID's are used for searching
            if ($(this).attr('id')) {

                // substring "Label" (e.g. first five characters ) from the
                // label id, use the remaining name as name string for accessing
                // the form input's value
                ElementName = $(this).attr('id').substring(5);
                $Element = $('#SearchForm input[name=' + Core.App.EscapeSelector(ElementName) + ']');

                // If there's no input element with the selected name
                // find the next "select" element and use that one for checking
                if (!$Element.length) {
                    $Element = $(this).next().find('select');
                }

                // Fix for bug#10845: make sure time slot fields with TimeInputFormat
                // 'Input' set are being considered correctly, too. As this is only
                // relevant for search type 'TimeSlot', we check for the first
                // input type=text elment in the corresponding field element.
                // All time field elements have to be filled in, but if only one
                // is missing, we treat the whole field as invalid.
                if ($FieldElement.find('input[name$="SearchType"]').val() === 'TimeSlot' && !$FieldElement.find('select').length) {
                    $Element = $FieldElement.find('input[type=text]').first();
                }

                if ($Element.length) {
                    if ($Element.val() && $Element.val() !== '') {
                        SearchValueFlag = true;
                    }
                }
            }
        });
        if (!SearchValueFlag) {
           alert(Core.Language.Translate('Please enter at least one search value or * to find anything.'));
        }
        return SearchValueFlag;
    }

        /**
     * @private
     * @name CheckSearchStringsForStopWords
     * @memberof Core.Agent.Search
     * @function
     * @param {Function} Callback - function to execute, if no stop words were found.
     * @description Checks if specific values of the search form contain stop words.
     *              If stop words are present, a warning will be displayed.
     *              If stop words are not present, the given callback will be executed.
     */
    function CheckSearchStringsForStopWords(Callback) {
        var SearchStrings = {},
            SearchStringsFound = 0,
            RelevantElementNames = {
                'From': 1,
                'To': 1,
                'Cc': 1,
                'Subject': 1,
                'Body': 1,
                'Fulltext': 1
            };

        if (!Core.Config.Get('CheckSearchStringsForStopWords')) {
            Callback();
            return;
        }

        $('#SearchForm label').each(function () {
            var ElementName,
                $Element;

            // those with ID's are used for searching
            if ($(this).attr('id')) {

                // substring "Label" (e.g. first five characters ) from the
                // label id, use the remaining name as name string for accessing
                // the form input's value
                ElementName = $(this).attr('id').substring(5);
                if (!RelevantElementNames[ElementName]) {
                    return;
                }

                $Element = $('#SearchForm input[name=' + ElementName + ']');

                if ($Element.length) {
                    if ($Element.val() && $Element.val() !== '') {
                        SearchStrings[ElementName] = $Element.val();
                        SearchStringsFound = 1;
                    }
                }
            }
        });

        // Check if stop words are present.
        if (!SearchStringsFound) {
            Callback();
            return;
        }

        AJAXStopWordCheck(
            SearchStrings,
            function (FoundStopWords) {
                alert(Core.Config.Get('SearchStringsContainStopWordsMsg') + "\n" + FoundStopWords);
            },
            Callback
        );
    }

    /**
     * @function
     * @param {Event} Action
     * @return nothing
     *      This function open the search dialog
     */

    TargetNS.OpenSearchDialog = function (Action, Profile, Class) {

        var Referrer = Core.Config.Get('Action'),
            Data;

        if (!Action) {
            Action ='AgentITSMConfigItemSearch';
        }
        Data = {
            Action: Action,
            Referrer: Referrer,
            Profile: Profile,
            Subaction: 'AJAX',
            ClassID: Class
        };

        ShowWaitingDialog();
        Core.AJAX.FunctionCall(
            Core.Config.Get('CGIHandle'),
            Data,
            function (HTML) {

                // if the waiting dialog was canceled, do not show the search
                //  dialog as well
                if (!$('.Dialog:visible').length) {
                    return;
                }

                Core.UI.Dialog.ShowContentDialog(HTML, Core.Config.Get('SearchMsg'), '10px', 'Center', true, [], true);

                $('#SearchClassID').off('change.SearchProfile').on('change.SearchProfile', function() {
                    if ( $('#SearchClassID').val() !== "" ) {
                        ITSM.Agent.ConfigItem.Search.LoadProfile( $('#SearchProfile').val() );
                    }
                    else {
                        $('#SearchProfile').attr("id", "SearchProfileOld");
                    }
                });

                var ClassSelected = $('#SearchClassID').val();
                if (ClassSelected) {
                    ITSM.Agent.ConfigItem.Search.LoadProfile($('#SearchProfile').val());
                }

                TargetNS.SetSearchDialog();
            }, 'html'
        );
    };

    Core.Init.RegisterNamespace(TargetNS, 'APP_MODULE');

    return TargetNS;
}(ITSM.Agent.ConfigItem.Search || {}));
