# --
# Kernel/Modules/AdminITSMConfigItem.pm - admin frontend to manage config items
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: AdminITSMConfigItem.pm,v 1.2 2008-08-06 13:13:59 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Modules::AdminITSMConfigItem;

use strict;
use warnings;

use Kernel::System::GeneralCatalog;
use Kernel::System::ITSMConfigItem;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.2 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(ParamObject DBObject LayoutObject ConfigObject LogObject)) {
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

    # get class list
    my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );
    return $Self->{LayoutObject}->ErrorScreen() if !$ClassList;
    return $Self->{LayoutObject}->ErrorScreen() if ref $ClassList ne 'HASH';
    return $Self->{LayoutObject}->ErrorScreen() if !%{$ClassList};

    # ------------------------------------------------------------ #
    # definition list
    # ------------------------------------------------------------ #
    if ( $Self->{Subaction} eq 'DefinitionList' ) {

        # get class id
        my $ClassID = $Self->{ParamObject}->GetParam( Param => 'ClassID' );

        return $Self->{LayoutObject}->Redirect( OP => "Action=$Self->{Action}" ) if !$ClassID;

        # generate ClassOptionStrg
        my $ClassOptionStrg = $Self->{LayoutObject}->BuildSelection(
            Data         => $ClassList,
            Name         => 'ClassID',
            PossibleNone => 1,
            Translation  => 0,
            SelectedID   => $ClassID,
        );

        # output overview
        $Self->{LayoutObject}->Block(
            Name => 'Overview',
            Data => {
                ClassOptionStrg => $ClassOptionStrg,
            },
        );

        # output overview result
        $Self->{LayoutObject}->Block(
            Name => 'DefinitionList',
            Data => {
                Name => $ClassList->{$ClassID},
            },
        );

        # get definition list
        my $DefinitionList = $Self->{ConfigItemObject}->DefinitionList(
            ClassID => $ClassID,
        );

        my $CssClass = '';
        for my $Definition ( reverse @{$DefinitionList} ) {

            # set output class
            $CssClass = $CssClass eq 'searchactive' ? 'searchpassive' : 'searchactive';

            # get user data
            my %UserData = $Self->{UserObject}->GetUserData(
                UserID => $Definition->{CreateBy},
                Cached => 1,
            );

            # output definition
            $Self->{LayoutObject}->Block(
                Name => 'DefinitionListRow',
                Data => {
                    %UserData,
                    %{$Definition},
                    Class    => $ClassList->{$ClassID},
                    CssClass => $CssClass,
                },
            );
        }

        # output header
        my $Output = $Self->{LayoutObject}->Header();
        $Output .= $Self->{LayoutObject}->NavigationBar();

        # generate output
        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AdminITSMConfigItem',
            Data         => \%Param,
        );
        $Output .= $Self->{LayoutObject}->Footer();

        return $Output;
    }

    # ------------------------------------------------------------ #
    # definition view
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'DefinitionView' ) {

        # get definition id
        my $DefinitionID = $Self->{ParamObject}->GetParam( Param => 'DefinitionID' );

        return $Self->{LayoutObject}->Redirect( OP => "Action=$Self->{Action}" ) if !$DefinitionID;

        # get definition
        my $Definition = $Self->{ConfigItemObject}->DefinitionGet(
            DefinitionID => $DefinitionID,
        );
        $Definition->{DefinitionString} = $Self->{LayoutObject}->Ascii2Html(
            Text           => $Definition->{Definition},
            HTMLResultMode => 1,
        );

        # generate ClassOptionStrg
        my $ClassOptionStrg = $Self->{LayoutObject}->BuildSelection(
            Data         => $ClassList,
            Name         => 'ClassID',
            PossibleNone => 1,
            Translation  => 0,
            SelectedID   => $Definition->{ClassID},
        );

        # output overview
        $Self->{LayoutObject}->Block(
            Name => 'Overview',
            Data => {
                ClassOptionStrg => $ClassOptionStrg,
            },
        );

        # get user data
        my %UserData = $Self->{UserObject}->GetUserData(
            UserID => $Definition->{CreateBy},
            Cached => 1,
        );

        # output overview result
        $Self->{LayoutObject}->Block(
            Name => 'DefinitionView',
            Data => {
                %UserData,
                %{$Definition},
            },
        );

        # output header
        my $Output = $Self->{LayoutObject}->Header();
        $Output .= $Self->{LayoutObject}->NavigationBar();

        # generate output
        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AdminITSMConfigItem',
            Data         => \%Param,
        );
        $Output .= $Self->{LayoutObject}->Footer();

        return $Output;
    }

    # ------------------------------------------------------------ #
    # definition change
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'DefinitionChange' ) {

        # get class id
        my $ClassID = $Self->{ParamObject}->GetParam( Param => 'ClassID' );

        return $Self->{LayoutObject}->Redirect( OP => "Action=$Self->{Action}" ) if !$ClassID;

        # get definition
        my $Definition = $Self->{ConfigItemObject}->DefinitionGet(
            ClassID => $ClassID,
        );

        # generate ClassOptionStrg
        my $ClassOptionStrg = $Self->{LayoutObject}->BuildSelection(
            Data         => $ClassList,
            Name         => 'ClassID',
            PossibleNone => 1,
            Translation  => 0,
            SelectedID   => $ClassID,
        );

        # output overview
        $Self->{LayoutObject}->Block(
            Name => 'Overview',
            Data => {
                ClassOptionStrg => $ClassOptionStrg,
            },
        );

        # output overview result
        $Self->{LayoutObject}->Block(
            Name => 'DefinitionChange',
            Data => {
                %{$Definition},
            },
        );

        # output header
        my $Output = $Self->{LayoutObject}->Header();
        $Output .= $Self->{LayoutObject}->NavigationBar();

        # generate output
        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AdminITSMConfigItem',
            Data         => \%Param,
        );
        $Output .= $Self->{LayoutObject}->Footer();

        return $Output;
    }

    # ------------------------------------------------------------ #
    # definition save
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'DefinitionSave' ) {
        my %Definition;

        # get params
        for my $FormParam (qw(ClassID Definition)) {
            $Definition{$FormParam} = $Self->{ParamObject}->GetParam( Param => $FormParam ) || '';
        }
        for my $FormParam (qw(ClassID Definition)) {
            if ( !$Definition{$FormParam} ) {
                $Self->{LogObject}->Log( Priority => 'error', Message => "Need $FormParam!" );
                return $Self->{LayoutObject}->Redirect( OP => "Action=$Self->{Action}" );
            }
        }

        # add to database
        my $DefinitionID = $Self->{ConfigItemObject}->DefinitionAdd(
            %Definition,
            UserID => $Self->{UserID},
        );

        return $Self->{LayoutObject}->ErrorScreen() if !$DefinitionID;
        return $Self->{LayoutObject}->Redirect( OP => "Action=$Self->{Action}" );
    }

    # ------------------------------------------------------------ #
    # config item class overview
    # ------------------------------------------------------------ #
    else {

        # generate ClassOptionStrg
        my $ClassOptionStrg = $Self->{LayoutObject}->BuildSelection(
            Data         => $ClassList,
            Name         => 'ClassID',
            PossibleNone => 1,
            Translation  => 0,
        );

        # output overview
        $Self->{LayoutObject}->Block(
            Name => 'Overview',
            Data => {
                ClassOptionStrg => $ClassOptionStrg,
            },
        );

        # output overview result
        $Self->{LayoutObject}->Block(
            Name => 'OverviewList',
        );

        my $CssClass = '';
        for my $ClassID ( sort { $ClassList->{$a} cmp $ClassList->{$b} } keys %{$ClassList} ) {

            # set output class
            $CssClass = $CssClass eq 'searchactive' ? 'searchpassive' : 'searchactive';

            $Self->{LayoutObject}->Block(
                Name => 'OverviewListRow',
                Data => {
                    ClassID  => $ClassID,
                    Name     => $ClassList->{$ClassID},
                    CssClass => $CssClass,
                },
            );
        }

        # output header
        my $Output = $Self->{LayoutObject}->Header();
        $Output .= $Self->{LayoutObject}->NavigationBar();

        # generate output
        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AdminITSMConfigItem',
            Data         => \%Param,
        );
        $Output .= $Self->{LayoutObject}->Footer();

        return $Output;
    }
}

1;
