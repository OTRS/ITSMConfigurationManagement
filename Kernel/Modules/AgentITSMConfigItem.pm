# --
# Kernel/Modules/AgentITSMConfigItem.pm - the OTRS::ITSM config item module
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: AgentITSMConfigItem.pm,v 1.13 2010-12-07 17:33:06 en Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMConfigItem;

use strict;
use warnings;

use Kernel::System::ITSMConfigItem;
use Kernel::System::GeneralCatalog;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.13 $) [1];

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
    $Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new(%Param);
    $Self->{ConfigItemObject}     = Kernel::System::ITSMConfigItem->new(%Param);

    # get config of frontend module
    $Self->{Config} = $Self->{ConfigObject}->Get("ITSMConfigItem::Frontend::$Self->{Action}");

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get page
    my $Page = $Self->{ParamObject}->GetParam( Param => 'Page' ) || 1;

    # get SubAction
    my $MainBlockName  = $Self->{ParamObject}->GetParam( Param => 'SubAction' ) || 'Overview';
    my $ExtraBlockName = $Self->{ParamObject}->GetParam( Param => 'SubAction' ) || '';

    # get class list
    my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    if ( $MainBlockName eq 'Overview' ) {

        # output Content
        $Self->{LayoutObject}->Block(
            Name => $MainBlockName,
            Data => {
                %Param,
            },
        );
    }

    # output menu
    my %ClassCount;
    my $Counter = 0;

    my $ClassIDAuto   = '';
    my $ClassMaxValue = 0;

    CLASSID:
    for my $ClassID ( sort { ${$ClassList}{$a} cmp ${$ClassList}{$b} } keys %{$ClassList} ) {

        # show menu link only if user has access rights
        my $HasAccess = $Self->{ConfigItemObject}->Permission(
            Scope   => 'Class',
            ClassID => $ClassID,
            UserID  => $Self->{UserID},
            Type    => $Self->{Config}->{Permission},
        );

        next CLASSID if !$HasAccess;

        # count all records of this class
        $ClassCount{$ClassID} = $Self->{ConfigItemObject}->ConfigItemCount(
            ClassID => $ClassID,
        );
        $Self->{LayoutObject}->Block(
            Name => 'Menu',
        );

        # output class
        $Self->{LayoutObject}->Block(
            Name => 'MenuItem',
            Data => {
                ClassID => $ClassID,
                Class   => $ClassList->{$ClassID},
                Count   => $ClassCount{$ClassID} || 0,
            },
        );

        # comment
        if ( $ClassIDAuto ne '' ) {
            if ( $ClassCount{$ClassID} > $ClassMaxValue ) {
                $ClassMaxValue = $ClassCount{$ClassID};
                $ClassIDAuto   = $ClassID;
            }
        }
        else {

            $ClassMaxValue = $ClassCount{$ClassID};
            $ClassIDAuto   = $ClassID;
        }

        $Counter++;
    }

    # get class id
    my $ClassID = $Self->{ParamObject}->GetParam( Param => 'ClassID' ) || $ClassIDAuto;

    # generate ClassOptionStrg
    my $ClassOptionStrg = $Self->{LayoutObject}->BuildSelection(
        Data         => $ClassList,
        Name         => 'ClassID',
        SelectedID   => $ClassID,
        Class        => 'W100pc ReloadSelect',
        PossibleNone => 1,
        Translation  => 0,
    );

    # output ActionAddItem
    $Self->{LayoutObject}->Block(
        Name => 'ActionAddItem',
        Data => {
            ClassOptionStrg => $ClassOptionStrg,
            %Param,
        },
    );

    my %SearchResult = (
        Result           => 0,
        ConfigItemsAvail => 0,
    );

    if ( $MainBlockName eq 'Reload' ) {

        # output Content
        $Self->{LayoutObject}->Block(
            Name => $MainBlockName,
            Data => {
                ConfigItemsAvail => $ClassCount{$ClassID},
            },
        );
    }

    if ($ClassID) {

        # if user doesn't belong to the group that belongs to this class, show error page
        my $HasAccess = $Self->{ConfigItemObject}->Permission(
            Scope   => 'Class',
            ClassID => $ClassID,
            UserID  => $Self->{UserID},
            Type    => $Self->{Config}->{Permission},
        );

        if ( !$HasAccess ) {
            return $Self->{LayoutObject}->ErrorScreen(
                Message => 'No access to Class is given!',
                Comment => 'Please contact the admin.',
            );
        }

        # output class
        $Self->{LayoutObject}->Block(
            Name => 'Class' . $ExtraBlockName,
            Data => {
                Class   => $ClassList->{$ClassID},
                ClassID => $ClassID,
            },
        );
        $SearchResult{ConfigItemsAvail} = $ClassCount{$ClassID} || 0;

        my $SearchStart = 0;
        if ( $Page && $Page > 1 ) {
            $SearchStart = ( $Page - 1 ) * 100;
        }

        # get config item list
        my $ConfigItemResultList = $Self->{ConfigItemObject}->ConfigItemResultList(
            ClassID => $ClassID,
            Start   => $SearchStart,
            Limit   => 100,
        );

        # set search result
        $SearchResult{Result} = @{$ConfigItemResultList};
        $SearchResult{Page}   = int( $SearchResult{ConfigItemsAvail} / 100 );
        if ( ( $SearchResult{ConfigItemsAvail} / 100 ) - $SearchResult{Page} ) {
            $SearchResult{Page}++;
        }

        # set incident signal
        my %InciSignals = (
            operational => 'greenled',
            warning     => 'yellowled',
            incident    => 'redled',
        );

        for my $ConfigItem ( @{$ConfigItemResultList} ) {

            # output class
            $Self->{LayoutObject}->Block(
                Name => 'ClassRow' . $ExtraBlockName,
                Data => {
                    %{$ConfigItem},
                    CurInciSignal => $InciSignals{ $ConfigItem->{CurInciStateType} },
                },
            );
        }

        # Comment
        if ( $SearchResult{ConfigItemsAvail} == 0 ) {
            $Self->{LayoutObject}->Block(
                Name => 'NoClassRow' . $ExtraBlockName,
            );
        }
    }

    # output page
    if ( $SearchResult{Page} ) {
        for my $PageCount ( 1 .. $SearchResult{Page} ) {

            # output page block
            $Self->{LayoutObject}->Block(
                Name => 'Page' . $ExtraBlockName,
            );

            my $TemplateName = $PageCount eq $Page ? 'PageBold' : 'PageNormal';

            # output page link
            $Self->{LayoutObject}->Block(
                Name => $TemplateName . $ExtraBlockName,
                Data => {
                    ClassID => $ClassID,
                    Page    => $PageCount,
                },
            );
        }
    }
    else {
        $SearchResult{PageNull} = 0;
    }

    # output ItemsAvail
    $Self->{LayoutObject}->Block(
        Name => 'ItemsAvail',
        Data => {
            ConfigItemsAvail => $ClassCount{$ClassID},
        },
    );

    # investigate refresh
    my $Refresh = $Self->{UserRefreshTime} ? 60 * $Self->{UserRefreshTime} : undef;

    if ( $MainBlockName eq 'Reload' ) {

        # start template output
        my $Output = $Self->{LayoutObject}->Output(
            TemplateFile => 'AgentITSMConfigItem'
        );

        return $Output;
    }

    # output header
    my $Output = $Self->{LayoutObject}->Header(
        Title   => 'Overview',
        Refresh => $Refresh,
    );
    $Output .= $Self->{LayoutObject}->NavigationBar();

    # start template output
    $Output .= $Self->{LayoutObject}->Output(
        TemplateFile => 'AgentITSMConfigItem',
        Data         => {
            ClassID => $ClassID,
            %Param,
            %SearchResult,
        },
    );

    # add footer
    $Output .= $Self->{LayoutObject}->Footer();

    return $Output;
}

1;
