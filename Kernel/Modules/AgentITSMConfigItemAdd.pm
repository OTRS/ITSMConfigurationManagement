# --
# Kernel/Modules/AgentITSMConfigItemAdd.pm - the OTRS ITSM config item add module
# Copyright (C) 2001-2014 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMConfigItemAdd;

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

    # get class list
    my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    # check for access rights
    for my $ClassID ( sort keys %{$ClassList} ) {
        my $HasAccess = $Self->{ConfigItemObject}->Permission(
            Type    => $Self->{Config}->{Permission},
            Scope   => 'Class',
            ClassID => $ClassID,
            UserID  => $Self->{UserID},
        );

        delete $ClassList->{$ClassID} if !$HasAccess;
    }

    # show the list of CI classes sorted by name
    for my $ItemID ( sort { ${$ClassList}{$a} cmp ${$ClassList}{$b} } keys %{$ClassList} ) {

        # get item data
        my $ItemData = $Self->{GeneralCatalogObject}->ItemGet(
            ItemID => $ItemID,
        );

        # output overview item list
        $Self->{LayoutObject}->Block(
            Name => 'OverviewItemList',
            Data => {
                ClassID => $ItemID,
                Name    => $ClassList->{$ItemID},
            },
        );
    }

    # output header
    my $Output = $Self->{LayoutObject}->Header( Title => 'Add' );
    $Output .= $Self->{LayoutObject}->NavigationBar();

    # output overview
    $Output .= $Self->{LayoutObject}->Output(
        TemplateFile => 'AgentITSMConfigItemAdd',
        Data         => {
            %Param,
        },
    );

    # output footer
    $Output .= $Self->{LayoutObject}->Footer();

    return $Output;
}

1;
