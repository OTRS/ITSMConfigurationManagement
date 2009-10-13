# --
# Kernel/Modules/AgentITSMConfigItemSearchResult.pm - the OTRS::ITSM config item search result module
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: AgentITSMConfigItemSearchResult.pm,v 1.5 2009-10-13 17:31:11 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMConfigItemSearchResult;

use strict;
use warnings;

use Kernel::System::ITSMConfigItem;
use Kernel::System::GeneralCatalog;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.5 $) [1];

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
    $Self->{Config} = $Self->{ConfigObject}->Get("ITSMConfigItem::Frontend::$Self->{Action}");

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get class id
    my %SearchAttribute;
    $SearchAttribute{ClassID} = $Self->{ParamObject}->GetParam( Param => 'ClassID' );

    if ( !$SearchAttribute{ClassID} ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => "No ClassID is given!",
            Comment => 'Please contact the admin.',
        );
    }

    # get values
    FORMVALUE:
    for my $FormValue (qw(Number Name PreviousVersionSearch)) {

        # get value
        my $Value = $Self->{ParamObject}->GetParam( Param => $FormValue );

        next FORMVALUE if !$Value;

        $SearchAttribute{$FormValue} = $Value;
    }

    # get arrays
    FORMARRAY:
    for my $FormArray (qw(DeplStateIDs InciStateIDs)) {

        # get array
        my @Array = $Self->{ParamObject}->GetArray( Param => $FormArray );

        next FORMARRAY if !@Array;

        $SearchAttribute{$FormArray} = \@Array;
    }

    # get current definition
    my $XMLDefinition = $Self->{ConfigItemObject}->DefinitionGet(
        ClassID => $SearchAttribute{ClassID},
    );

    # abort, if no definition is defined
    if ( !$XMLDefinition->{DefinitionID} ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => "No Definition was definied for class $SearchAttribute{Class}!",
            Comment => 'Please contact the admin.',
        );
    }

    # get xml search form
    my $XMLFormData = [];
    $Self->_XMLSearchFormGet(
        XMLDefinition => $XMLDefinition->{DefinitionRef},
        XMLFormData   => $XMLFormData,
    );

    if ( @{$XMLFormData} ) {
        $SearchAttribute{What} = $XMLFormData;
    }

    # start search
    my $SearchResultList = $Self->{ConfigItemObject}->ConfigItemSearchExtended(
        %SearchAttribute,
        ClassIDs => [ $SearchAttribute{ClassID} ],
    );

    # set incident signal
    my %InciSignals = (
        operational => 'greenled',
        warning     => 'yellowled',
        incident    => 'redled',
    );

    my $TotalHits = @{$SearchResultList};
    my $CssClass  = '';

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
            Name => 'Row',
            Data => {
                %{$LastVersion},
                CurInciSignal => $InciSignals{ $LastVersion->{CurInciStateType} },
                CssClass      => $CssClass,
            },
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

    # output header
    my $Output = $Self->{LayoutObject}->Header( Title => 'Search' );
    $Output .= $Self->{LayoutObject}->NavigationBar();

    # start template output
    $Output .= $Self->{LayoutObject}->Output(
        TemplateFile => 'AgentITSMConfigItemSearchResult',
        Data         => {
            %SearchAttribute,
            TotalHits => $TotalHits,
            Class     => $ClassList->{ $SearchAttribute{ClassID} },
        },
    );

    # output footer
    $Output .= $Self->{LayoutObject}->Footer();
    return $Output;
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
