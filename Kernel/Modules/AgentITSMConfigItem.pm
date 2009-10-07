# --
# Kernel/Modules/AgentITSMConfigItem.pm - the OTRS::ITSM config item module
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: AgentITSMConfigItem.pm,v 1.6 2009-10-07 14:25:22 reb Exp $
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
$VERSION = qw($Revision: 1.6 $) [1];

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
    $Self->{Config} = $Self->{ConfigObject}->Get("ConfigItem::Frontend::$Self->{Action}");

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get page
    my $Page = $Self->{ParamObject}->GetParam( Param => 'Page' ) || 1;

    # get class list
    my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    # output menu
    my %ClassCount;
    my $Counter = 0;

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

        # output menu item split
        if ($Counter) {
            $Self->{LayoutObject}->Block(
                Name => 'MenuItemSplit',
            );
        }

        # output class
        $Self->{LayoutObject}->Block(
            Name => 'MenuItem',
            Data => {
                ClassID => $ClassID,
                Class   => $ClassList->{$ClassID},
                Count   => $ClassCount{$ClassID} || 0,
            },
        );

        $Counter++;
    }

    # get class id
    my $ClassID = $Self->{ParamObject}->GetParam( Param => 'ClassID' );

    my %SearchResult = (
        Result           => 0,
        ConfigItemsAvail => 0,
    );

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
            Name => 'Class',
            Data => {
                Class => $ClassList->{$ClassID},
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

        my $CssClass = '';
        for my $ConfigItem ( @{$ConfigItemResultList} ) {

            # set output class
            $CssClass = $CssClass eq 'searchpassive' ? 'searchactive' : 'searchpassive';

            # output class
            $Self->{LayoutObject}->Block(
                Name => 'ClassRow',
                Data => {
                    CssClass => $CssClass,
                    %{$ConfigItem},
                    CurInciSignal => $InciSignals{ $ConfigItem->{CurInciStateType} },
                },
            );
        }
    }

    # output page
    if ( $SearchResult{Page} ) {
        for my $PageCount ( 1 .. $SearchResult{Page} ) {

            # output page block
            $Self->{LayoutObject}->Block(
                Name => 'Page',
            );

            my $TemplateName = $PageCount eq $Page ? 'PageBold' : 'PageNormal';

            # output page link
            $Self->{LayoutObject}->Block(
                Name => $TemplateName,
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

    # investigate refresh
    my $Refresh = $Self->{UserRefreshTime} ? 60 * $Self->{UserRefreshTime} : undef;

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
