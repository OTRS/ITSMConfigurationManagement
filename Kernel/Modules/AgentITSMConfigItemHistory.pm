# --
# Kernel/Modules/AgentITSMConfigItemHistory.pm - ticket history
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: AgentITSMConfigItemHistory.pm,v 1.6 2009-08-28 14:08:17 reb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMConfigItemHistory;

use strict;
use warnings;

use Kernel::System::ITSMConfigItem;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.6 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # check needed objects
    for (
        qw( DBObject LayoutObject LogObject UserObject ConfigObject
        ParamObject EncodeObject MainObject )
        )
    {
        if ( !$Self->{$_} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $_!" );
        }
    }

    $Self->{ConfigItemObject} = Kernel::System::ITSMConfigItem->new( %{$Self} );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->{ConfigItemID} = $Self->{ParamObject}->GetParam( Param => 'ConfigItemID' );

    # check needed stuff
    if ( !$Self->{ConfigItemID} ) {

        # error page
        return $Self->{LayoutObject}->ErrorScreen(
            Message => 'Can\'t show history, no ConfigItemID is given!',
            Comment => 'Please contact the admin.',
        );
    }

    # get all information about the config item
    my $ConfigItem = $Self->{ConfigItemObject}->ConfigItemGet(
        ConfigItemID => $Self->{ConfigItemID},
    );
    my $ConfigItemName = $ConfigItem->{Number};

    # get all entries in the history for this config item
    my $Lines = $Self->{ConfigItemObject}->HistoryGet(
        ConfigItemID => $Self->{ConfigItemID},
    );

    # get shown user info
    my @NewLines = @{$Lines};
    if ( $Self->{ConfigObject}->Get('ITSMConfigItem::Frontend::HistoryOrder') eq 'reverse' ) {
        @NewLines = reverse @{$Lines};
    }

    my $Table   = '';
    my $Counter = 1;
    my $Version = 0;
    for my $DataTmp (@NewLines) {
        $Counter++;
        my %Data = (
            %{$DataTmp},
            VersionID => $Version,
        );

        # trim the comment to only show version number
        if ( $Data{HistoryType} eq 'VersionCreate' ) {
            $Data{Comment} =~ s/\D//g;
            $Data{VersionID} = $Data{Comment};
            $Version = $Data{Comment};
        }
        elsif ( $Data{HistoryType} eq 'ValueUpdate' ) {

            # beautify comment
            my @Parts = split /%%/, $Data{Comment};
            $Parts[0] =~ s{ \A \[.*?\] \{'Version'\} \[.*?\] \{' }{}xms;
            $Parts[0] =~ s{ '\} \[.*?\] \{' }{::}xmsg;
            $Parts[0] =~ s{ '\} \[.*?\] \z }{}xms;

            # assemble parts
            $Data{Comment} = join '%%', @Parts;
        }

        # replace text
        if ( $Data{Comment} && $Data{Comment} =~ /^%%/ ) {
            my %Info = ();
            $Data{Comment} =~ s/^%%//g;
            my @Values = split( /%%/, $Data{Comment} );
            $Data{Comment} = '';
            for (@Values) {
                if ( $Data{Comment} ) {
                    $Data{Comment} .= "\", ";
                }
                $Data{Comment} .= "\"$_";
            }
            if ( !$Data{Comment} ) {
                $Data{Comment} = '" ';
            }

            # remove not needed place holder
            $Data{Comment} =~ s/\%s//g;
        }

        # seperate each searchresult line by using several css
        if ( $Counter % 2 ) {
            $Data{css} = 'searchpassive';
        }
        else {
            $Data{css} = 'searchactive';
        }
        $Self->{LayoutObject}->Block(
            Name => 'Row',
            Data => {%Data},
        );
    }

    # build page
    my $Output = $Self->{LayoutObject}->Header( Value => $ConfigItemName );
    $Output .= $Self->{LayoutObject}->NavigationBar();
    $Output .= $Self->{LayoutObject}->Output(
        TemplateFile => 'AgentITSMConfigItemHistory',
        Data         => {
            Name         => $ConfigItemName,
            ConfigItemID => $Self->{ConfigItemID},
            VersionID    => $Self->{ParamObject}->GetParam( Param => 'VersionID' ),
        },
    );
    $Output .= $Self->{LayoutObject}->Footer();

    return $Output;
}

1;
