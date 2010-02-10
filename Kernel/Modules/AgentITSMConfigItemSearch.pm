# --
# Kernel/Modules/AgentITSMConfigItemSearch.pm - the OTRS::ITSM config item search module
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: AgentITSMConfigItemSearch.pm,v 1.9 2010-02-10 16:28:32 bes Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMConfigItemSearch;

use strict;
use warnings;

use Kernel::System::ITSMConfigItem;
use Kernel::System::GeneralCatalog;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.9 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(ParamObject DBObject LayoutObject LogObject ConfigObject)) {
        if ( !$Self->{$Object} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $Object!" );
        }
    }

    # create additional objects
    $Self->{ConfigItemObject}     = Kernel::System::ITSMConfigItem->new(%Param);
    $Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new(%Param);

    # get config of frontend module
    $Self->{Config} = $Self->{ConfigObject}->Get("ITSMConfigItem::Frontend::$Self->{Action}");

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get class list
    my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    # check for access rights on the classes
    for my $ClassID ( keys %{$ClassList} ) {
        my $HasAccess = $Self->{ConfigItemObject}->Permission(
            Type    => $Self->{Config}->{Permission},
            Scope   => 'Class',
            ClassID => $ClassID,
            UserID  => $Self->{UserID},
        );

        delete $ClassList->{$ClassID} if !$HasAccess;
    }

    # get class id
    my $ClassID = $Self->{ParamObject}->GetParam( Param => 'ClassID' );

    # output header
    my $Output = $Self->{LayoutObject}->Header( Title => 'Search' );
    $Output .= $Self->{LayoutObject}->NavigationBar();

    # ------------------------------------------------------------ #
    # config item search
    # ------------------------------------------------------------ #
    if ( $Self->{Subaction} eq 'Attribute' ) {

        # ClassID is required for the search mask and for actual searching
        if ( !$ClassID ) {
            return $Self->{LayoutObject}->ErrorScreen(
                Message => 'No ClassID is given!',
                Comment => 'Please contact the admin.',
            );
        }

        # check if user is allowed to search class
        my $HasAccess = $Self->{ConfigItemObject}->Permission(
            Type    => $Self->{Config}->{Permission},
            Scope   => 'Class',
            ClassID => $ClassID,
            UserID  => $Self->{UserID},
        );

        # show error screen
        if ( !$HasAccess ) {
            return $Self->{LayoutObject}->ErrorScreen(
                Message => 'No access rights for this class given!',
                Comment => 'Please contact the admin.',
            );
        }

        # get current definition
        my $XMLDefinition = $Self->{ConfigItemObject}->DefinitionGet(
            ClassID => $ClassID,
        );

        # abort, if no definition is defined
        if ( !$XMLDefinition->{DefinitionID} ) {
            return $Self->{LayoutObject}->ErrorScreen(
                Message => "No Definition was defined for class $ClassID!",
                Comment => 'Please contact the admin.',
            );
        }

        # attributes used for searching and for restoring previous input
        my %GetParam;

        # get scalar search attributes
        FORMVALUE:
        for my $FormValue (qw(Number Name PreviousVersionSearch)) {

            my $Value = $Self->{ParamObject}->GetParam( Param => $FormValue );

            next FORMVALUE if !$Value;

            $GetParam{$FormValue} = $Value;
        }

        # get array search attributes
        FORMARRAY:
        for my $FormArray (qw(DeplStateIDs InciStateIDs)) {

            my @Array = $Self->{ParamObject}->GetArray( Param => $FormArray );

            next FORMARRAY if !@Array;

            $GetParam{$FormArray} = \@Array;
        }

        # check whether the config item search should be performed
        my $SubmitSearch = $Self->{ParamObject}->GetParam( Param => 'SubmitSearch' );

        if ($SubmitSearch) {

            # get xml search form
            my $XMLFormData = [];
            $Self->_XMLSearchFormGet(
                XMLDefinition => $XMLDefinition->{DefinitionRef},
                XMLFormData   => $XMLFormData,
            );

            if ( @{$XMLFormData} ) {
                $GetParam{What} = $XMLFormData;
            }

            # start search
            my $SearchResultList = $Self->{ConfigItemObject}->ConfigItemSearchExtended(
                %GetParam,
                ClassIDs => [$ClassID],
            );

            # output result block
            $Self->{LayoutObject}->Block(
                Name => 'Result',
                Data => {
                    %GetParam,
                    TotalHits => scalar( @{$SearchResultList} ),
                    Class     => $ClassList->{$ClassID},
                    ClassID   => $ClassID,
                },
            );

            # set incident signal
            my %InciSignals = (
                operational => 'greenled',
                warning     => 'yellowled',
                incident    => 'redled',
            );

            # output the found config items
            my $CssClass = '';
            CONFIGITEMID:
            for my $ConfigItemID ( @{$SearchResultList} ) {

                # check for access rights
                my $HasAccess = $Self->{ConfigItemObject}->Permission(
                    Scope  => 'Item',
                    ItemID => $ConfigItemID,
                    UserID => $Self->{UserID},
                    Type   => $Self->{Config}->{Permission},
                );

                next CONFIGITEMID if !$HasAccess;

                # set output class
                $CssClass = $CssClass eq 'searchpassive' ? 'searchactive' : 'searchpassive';

                # get version
                my $LastVersion = $Self->{ConfigItemObject}->VersionGet(
                    ConfigItemID => $ConfigItemID,
                    XMLDataGet   => 0,
                );

                # output row
                $Self->{LayoutObject}->Block(
                    Name => 'ResultRow',
                    Data => {
                        %{$LastVersion},
                        CurInciSignal => $InciSignals{ $LastVersion->{CurInciStateType} },
                        CssClass      => $CssClass,
                    },
                );
            }
        }
        else {

            # search input mask

            # get deployment state list
            my $DeplStateList = $Self->{GeneralCatalogObject}->ItemList(
                Class => 'ITSM::ConfigItem::DeploymentState',
            );

            # generate dropdown for selecting the wanted deployment states
            my $CurDeplStateOptionStrg = $Self->{LayoutObject}->BuildSelection(
                Data       => $DeplStateList,
                Name       => 'DeplStateIDs',
                SelectedID => $GetParam{DeplStateIDs} || [],
                Size       => 5,
                Multiple   => 1,
            );

            # get incident state list
            my $InciStateList = $Self->{GeneralCatalogObject}->ItemList(
                Class => 'ITSM::Core::IncidentState',
            );

            # generate dropdown for selecting the wanted incident states
            my $CurInciStateOptionStrg = $Self->{LayoutObject}->BuildSelection(
                Data       => $InciStateList,
                Name       => 'InciStateIDs',
                SelectedID => $GetParam{InciStateIDs} || [],
                Size       => 5,
                Multiple   => 1,
            );

            # generate PreviousVersionOptionStrg
            my $PreviousVersionOptionStrg = $Self->{LayoutObject}->BuildSelection(
                Name => 'PreviousVersionSearch',
                Data => {
                    0 => 'No',
                    1 => 'Yes',
                },
                SelectedID => 0,
            );

            # output attribute block
            $Self->{LayoutObject}->Block(
                Name => 'Attribute',
                Data => {
                    %GetParam,
                    ClassID                   => $ClassID,
                    Class                     => $ClassList->{$ClassID},
                    CurDeplStateOptionStrg    => $CurDeplStateOptionStrg,
                    CurInciStateOptionStrg    => $CurInciStateOptionStrg,
                    PreviousVersionOptionStrg => $PreviousVersionOptionStrg,
                },
            );

            # output xml search form
            if ( $XMLDefinition->{Definition} ) {
                $Self->_XMLSearchFormOutput(
                    XMLDefinition => $XMLDefinition->{DefinitionRef},
                );
            }

        }
    }

    # ------------------------------------------------------------ #
    # config item class selection
    # ------------------------------------------------------------ #
    else {

        # generate dropdown for selecting the class
        # automatically show search mask after selecting a class
        my $ClassOptionStrg = $Self->{LayoutObject}->BuildSelection(
            Data         => $ClassList,
            Name         => 'ClassID',
            PossibleNone => 1,
            SelectedID   => $ClassID || '',
            Translation  => 0,
            OnChange     => 'document.configitemclass.submit(); return false;',
        );

        # output class block
        $Self->{LayoutObject}->Block(
            Name => 'Class',
            Data => {
                %Param,
                ClassOptionStrg => $ClassOptionStrg,
            },
        );

    }

    # output template
    $Output .= $Self->{LayoutObject}->Output(
        TemplateFile => 'AgentITSMConfigItemSearch',
    );

    # output footer
    $Output .= $Self->{LayoutObject}->Footer();

    return $Output;
}

sub _XMLSearchFormOutput {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if ref $Param{XMLDefinition} ne 'ARRAY';

    $Param{Level} ||= 0;

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {

        # set prefix
        my $InputKey = $Item->{Key};
        my $Name     = $Item->{Name};
        if ( $Param{Prefix} ) {
            $InputKey = $Param{Prefix} . '::' . $InputKey;
            $Name     = $Param{PrefixName} . '::' . $Name;
        }
        my $Value = $Self->{ParamObject}->GetParam( Param => $InputKey );

        # output attribute, if marked as searchable
        if ( $Item->{Searchable} ) {

            # create search input element
            my $InputString = $Self->{LayoutObject}->ITSMConfigItemSearchInputCreate(
                Key   => $InputKey,
                Value => $Value,
                Item  => $Item,
            );

            # output attribute row
            $Self->{LayoutObject}->Block(
                Name => 'AttributeRow',
                Data => {
                    Name        => $Name,
                    Description => $Item->{Description} || $Item->{Name},
                    InputString => $InputString,
                },
            );
        }

        next ITEM if !$Item->{Sub};

        # start recursion, if "Sub" was found
        $Self->_XMLSearchFormOutput(
            XMLDefinition => $Item->{Sub},
            Level         => $Param{Level} + 1,
            Prefix        => $InputKey,
            PrefixName    => $Name,
        );
    }

    return 1;
}

sub _XMLSearchFormGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if !$Param{XMLFormData};
    return if ref $Param{XMLDefinition} ne 'ARRAY';
    return if ref $Param{XMLFormData} ne 'ARRAY';

    $Param{Level} ||= 0;

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {

        # create inputkey
        my $InputKey = $Item->{Key};
        if ( $Param{Prefix} ) {
            $InputKey = $Param{Prefix} . '::' . $InputKey;
        }

        # get search form data
        my $Values = $Self->{LayoutObject}->ITSMConfigItemSearchFormDataGet(
            Key  => $InputKey,
            Item => $Item,
        );

        # create search array
        my @SearchValues;
        VALUE:
        for my $Value ( @{$Values} ) {

            next VALUE if !$Value;

            push @SearchValues, $Value;
        }

        if (@SearchValues) {

            # create search key
            my $SearchKey = $InputKey;
            $SearchKey =~ s{ :: }{\'\}[%]\{\'}xmsg;

            # create search hash
            my $SearchHash = {
                '[1]{\'Version\'}[1]{\'' . $SearchKey . '\'}[%]{\'Content\'}' => \@SearchValues,
            };

            push @{ $Param{XMLFormData} }, $SearchHash;
        }

        next ITEM if !$Item->{Sub};

        # start recursion, if "Sub" was found
        $Self->_XMLSearchFormGet(
            XMLDefinition => $Item->{Sub},
            XMLFormData   => $Param{XMLFormData},
            Level         => $Param{Level} + 1,
            Prefix        => $InputKey,
        );
    }

    return 1;
}
1;
