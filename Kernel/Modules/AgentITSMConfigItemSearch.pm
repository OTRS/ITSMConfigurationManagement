# --
# Kernel/Modules/AgentITSMConfigItemSearch.pm - the OTRS::ITSM config item search module
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: AgentITSMConfigItemSearch.pm,v 1.4 2009-10-07 14:25:22 reb Exp $
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
$VERSION = qw($Revision: 1.4 $) [1];

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
    $Self->{ConfigItemObject}     = Kernel::System::ITSMConfigItem->new(%Param);
    $Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new(%Param);

    # get config of frontend module
    $Self->{Config} = $Self->{ConfigObject}->Get("ConfigItem::Frontend::$Self->{Action}");

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # ------------------------------------------------------------ #
    # config item search
    # ------------------------------------------------------------ #
    if ( $Self->{Subaction} eq 'Attribute' ) {

        # get class id
        my $ClassID = $Self->{ParamObject}->GetParam( Param => 'ClassID' );
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

        # get class list
        my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
            Class => 'ITSM::ConfigItem::Class',
        );

        # check for access rights
        for my $ClassID ( keys %{$ClassList} ) {
            my $HasAccess = $Self->{ConfigItemObject}->Permission(
                Type    => $Self->{Config}->{Permission},
                Scope   => 'Class',
                ClassID => $ClassID,
                UserID  => $Self->{UserID},
            );

            delete $ClassList->{$ClassID} if !$HasAccess;
        }

        # get deployment state list
        my $DeplStateList = $Self->{GeneralCatalogObject}->ItemList(
            Class => 'ITSM::ConfigItem::DeploymentState',
        );

        # generate DeplStateOptionStrg
        my $CurDeplStateOptionStrg = $Self->{LayoutObject}->BuildSelection(
            Data     => $DeplStateList,
            Name     => 'DeplStateIDs',
            Size     => 5,
            Multiple => 1,
        );

        # get incident state list
        my $InciStateList = $Self->{GeneralCatalogObject}->ItemList(
            Class => 'ITSM::Core::IncidentState',
        );

        # generate InciStateOptionStrg
        my $CurInciStateOptionStrg = $Self->{LayoutObject}->BuildSelection(
            Data     => $InciStateList,
            Name     => 'InciStateIDs',
            Size     => 5,
            Multiple => 1,
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
                ClassID                   => $ClassID,
                Class                     => $ClassList->{$ClassID},
                CurDeplStateOptionStrg    => $CurDeplStateOptionStrg,
                CurInciStateOptionStrg    => $CurInciStateOptionStrg,
                PreviousVersionOptionStrg => $PreviousVersionOptionStrg,
            },
        );

        # get current definition
        my $XMLDefinition = $Self->{ConfigItemObject}->DefinitionGet(
            ClassID => $ClassID,
        );

        # abort, if no definition is defined
        if ( !$XMLDefinition->{DefinitionID} ) {
            return $Self->{LayoutObject}->ErrorScreen(
                Message => "No Definition was definied for class $ClassList->{$ClassID}!",
                Comment => 'Please contact the admin.',
            );
        }

        # output xml search form
        if ( $XMLDefinition->{Definition} ) {
            $Self->_XMLSearchFormOutput(
                XMLDefinition => $XMLDefinition->{DefinitionRef},
            );
        }

        # output header
        my $Output = $Self->{LayoutObject}->Header( Title => 'Search' );
        $Output .= $Self->{LayoutObject}->NavigationBar();

        # output overview
        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AgentITSMConfigItemSearch',
            Data         => {
                %Param,
            },
        );

        # output footer
        $Output .= $Self->{LayoutObject}->Footer();

        return $Output;
    }

    # ------------------------------------------------------------ #
    # config item class overview
    # ------------------------------------------------------------ #
    else {

        # get class id
        my $ClassID = $Self->{ParamObject}->GetParam( Param => 'ClassID' ) || '';

        # get class list
        my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
            Class => 'ITSM::ConfigItem::Class',
        );

        # check for access rights
        for my $ClassID ( keys %{$ClassList} ) {
            my $HasAccess = $Self->{ConfigItemObject}->Permission(
                Type    => $Self->{Config}->{Permission},
                Scope   => 'Class',
                ClassID => $ClassID,
                UserID  => $Self->{UserID},
            );

            delete $ClassList->{$ClassID} if !$HasAccess;
        }

        # generate ClassOptionStrg
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

        # output header
        my $Output = $Self->{LayoutObject}->Header( Title => 'Search' );
        $Output .= $Self->{LayoutObject}->NavigationBar();

        # output overview
        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AgentITSMConfigItemSearch',
        );

        # output footer
        $Output .= $Self->{LayoutObject}->Footer();

        return $Output;
    }
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

        # output attribute, if marked as searchable
        if ( $Item->{Searchable} ) {

            # create search input element
            my $InputString = $Self->{LayoutObject}->ITSMConfigItemSearchInputCreate(
                Key  => $InputKey,
                Item => $Item,
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

1;
