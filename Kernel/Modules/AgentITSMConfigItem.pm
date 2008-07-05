# --
# Kernel/Modules/AgentITSMConfigItem.pm - the OTRS::ITSM config item module
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: AgentITSMConfigItem.pm,v 1.1.1.1 2008-07-05 16:24:13 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Modules::AgentITSMConfigItem;

use strict;
use warnings;

use Kernel::System::ITSMConfigItem;
use Kernel::System::GeneralCatalog;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1.1.1 $) [1];

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

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get page
    my $Page = $Self->{ParamObject}->GetParam( Param => "Page" ) || 1;

    # get class list
    my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    # output menu
    my %ClassCount;
    my $Counter = 0;
    for my $ClassID ( sort { ${$ClassList}{$a} cmp ${$ClassList}{$b} } keys %{$ClassList} ) {

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

    # set last screen view
    $ClassID ||= '';
    $Self->{SessionObject}->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'ITSMConfigItemLastScreenOverview',
        Value     => "Action=$Self->{Action}&ClassID=$ClassID&Page=$Page",
    );

    # output header
    my $Output = $Self->{LayoutObject}->Header( Title => 'Overview' );
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
