# --
# Kernel/Output/HTML/ITSMConfigItemMenuVersions.pm
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: ITSMConfigItemMenuVersions.pm,v 1.1.1.1 2008-07-05 16:24:13 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Output::HTML::ITSMConfigItemMenuVersions;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1.1.1 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(ConfigObject LogObject DBObject LayoutObject ConfigItemObject UserID)) {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ConfigItem} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need ConfigItem!' );
        return;
    }

    $Self->{LayoutObject}->Block( Name => 'Menu' );
    if ( $Param{Counter} ) {
        $Self->{LayoutObject}->Block( Name => 'MenuItemSplit' );
    }
    if ( $Param{ShowVersions} ) {
        $Self->{LayoutObject}->Block(
            Name => 'MenuItem',
            Data => {
                %Param,
                %{ $Param{ConfigItem} },
                %{ $Param{Config} },
                Name        => 'Hide Versions',
                Description => 'Hide Versions',
                Link =>
                    'Action=AgentITSMConfigItemZoom&amp;ConfigItemID=$QData{"ConfigItemID"}&amp;ShowVersions=0',
            },
        );
    }
    else {
        $Self->{LayoutObject}->Block(
            Name => 'MenuItem',
            Data => {
                %Param,
                %{ $Param{ConfigItem} },
                %{ $Param{Config} },
                Name        => 'Show Versions',
                Description => 'Show Versions',
                Link =>
                    'Action=AgentITSMConfigItemZoom&amp;ConfigItemID=$QData{"ConfigItemID"}&amp;ShowVersions=1',
            },
        );
    }
    $Param{Counter}++;

    return $Param{Counter};
}

1;
