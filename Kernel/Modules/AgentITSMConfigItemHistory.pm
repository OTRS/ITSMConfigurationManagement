# --
# Kernel/Modules/AgentITSMConfigItemHistory.pm - ticket history
# Copyright (C) 2001-2014 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMConfigItemHistory;

use strict;
use warnings;

use Kernel::System::ITSMConfigItem;
use Kernel::System::GeneralCatalog;

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

    $Self->{ConfigItemObject}     = Kernel::System::ITSMConfigItem->new( %{$Self} );
    $Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new( %{$Self} );

    # get config of frontend module
    $Self->{Config} = $Self->{ConfigObject}->Get("ITSMConfigItem::Frontend::$Self->{Action}");

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

    # check for access rights
    my $HasAccess = $Self->{ConfigItemObject}->Permission(
        Scope  => 'Item',
        ItemID => $Self->{ConfigItemID},
        UserID => $Self->{UserID},
        Type   => $Self->{Config}->{Permission},
    );

    if ( !$HasAccess ) {

        # error page
        return $Self->{LayoutObject}->ErrorScreen(
            Message => 'Can\'t show history, no access rights given!',
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

    # get definition for CI's class
    my $Definition = $Self->{ConfigItemObject}->DefinitionGet(
        ClassID => $ConfigItem->{ClassID},
    );

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

            # get info about attribute
            my $AttributeInfo = $Self->_GetAttributeInfo(
                Definition => $Definition->{DefinitionRef},
                Path       => $Parts[0],
            );

            if ( $AttributeInfo && $AttributeInfo->{Input}->{Type} eq 'GeneralCatalog' ) {
                my $ItemList = $Self->{GeneralCatalogObject}->ItemList(
                    Class => $AttributeInfo->{Input}->{Class},
                );

                $Parts[1] = $ItemList->{ $Parts[1] } || '';
                $Parts[2] = $ItemList->{ $Parts[2] } || '';
            }

            # assemble parts
            $Data{Comment} = join '%%', @Parts;
        }
        elsif ( $Data{HistoryType} eq 'DeploymentStateUpdate' ) {

            # get deployment state list
            my $DeplStateList = $Self->{GeneralCatalogObject}->ItemList(
                Class => 'ITSM::ConfigItem::DeploymentState',
            );

            # show names
            my @Parts = split /%%/, $Data{Comment};
            for my $Part (@Parts) {
                $Part = $DeplStateList->{$Part} || '';
            }

            # assemble parts
            $Data{Comment} = join '%%', @Parts;
        }
        elsif ( $Data{HistoryType} eq 'IncidentStateUpdate' ) {

            # get deployment state list
            my $DeplStateList = $Self->{GeneralCatalogObject}->ItemList(
                Class => 'ITSM::Core::IncidentState',
            );

            # show names
            my @Parts = split /%%/, $Data{Comment};
            for my $Part (@Parts) {
                $Part = $DeplStateList->{$Part} || '';
            }

            # assemble parts
            $Data{Comment} = join '%%', @Parts;
        }

        # replace text
        if ( $Data{Comment} ) {
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
            $Data{Comment} = $Self->{LayoutObject}->{LanguageObject}->Get(
                'CIHistory::' . $Data{HistoryType} . '", ' . $Data{Comment}
            );

            # remove not needed place holder
            $Data{Comment} =~ s/\%s//g;
        }

        $Self->{LayoutObject}->Block(
            Name => 'Row',
            Data => {%Data},
        );
    }

    # build page
    my $Output = $Self->{LayoutObject}->Header( Value => $ConfigItemName, Type => 'Small' );
    $Output .= $Self->{LayoutObject}->Output(
        TemplateFile => 'AgentITSMConfigItemHistory',
        Data         => {
            Name         => $ConfigItemName,
            ConfigItemID => $Self->{ConfigItemID},
            VersionID    => $Self->{ParamObject}->GetParam( Param => 'VersionID' ),
        },
    );
    $Output .= $Self->{LayoutObject}->Footer( Type => 'Small' );

    return $Output;
}

sub _GetAttributeInfo {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Definition Path)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    my $Subtree = $Param{Definition};
    my $Info;

    PART:
    for my $Part ( split /::/, $Param{Path} ) {
        my ($Found) = grep { $_->{Key} eq $Part } @{$Subtree};

        last PART if !$Found;

        $Subtree = $Found->{Sub};
        $Info    = $Found;
    }

    return $Info;
}

1;
