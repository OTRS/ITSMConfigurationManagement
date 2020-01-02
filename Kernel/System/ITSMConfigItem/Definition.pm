# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::ITSMConfigItem::Definition;

use strict;
use warnings;

use Kernel::Language qw(Translatable);

our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::System::ITSMConfigItem::Definition - sub module of Kernel::System::ITSMConfigItem

=head1 PUBLIC INTERFACE

=head1 DESCRIPTION

All definition functions.

=head2 DefinitionList()

return a config item definition list as array-hash reference

    my $DefinitionListRef = $ConfigItemObject->DefinitionList(
        ClassID => 123,
    );

returns

    my $DefinitionListRef = [
          {
            'Version'      => '1',
            'CreateTime'   => '2012-06-12 14:09:43',
            'DefinitionID' => '1',
            'CreateBy'     => '123',
            'Definition'   => '---
- Key: Vendor
  Name: Vendor
  Searchable: 1
  Input:
  - Type: Text
    Size: 50
    MaxLength: 50

- Key: Description
  Name: Description
  Searchable: 1
  Input:
  - Type: TextArea

- Key: Type
  Name: Type
  Searchable: 1
  Input:
  - Type: TextArea
  - Type: GeneralCatalog\
    Class: ITSM::ConfigItem::Computer::Type
    Translation: 1
# ... etc ...
',
          },
    ];

=cut

sub DefinitionList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ClassID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need ClassID!',
        );
        return;
    }

    # ask database
    $Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT id, configitem_definition, version, create_time, create_by '
            . 'FROM configitem_definition WHERE class_id = ? ORDER BY version',
        Bind => [ \$Param{ClassID} ],
    );

    my @DefinitionList;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        my %Definition;
        $Definition{DefinitionID} = $Row[0];
        $Definition{Definition}   = $Row[1] || "--- []";
        $Definition{Version}      = $Row[2];
        $Definition{CreateTime}   = $Row[3];
        $Definition{CreateBy}     = $Row[4];

        # Check if definition code is not a YAML string.
        if ( substr( $Definition{Definition}, 0, 3 ) ne '---' ) {

            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'notice',
                Message  => "DefinitionID: $Definition{DefinitionID}"
                    . " ClassID: $Param{ClassID}"
                    . " found in legacy Perl code format, can not continue",
            );

            $Definition{Definition} = "--- []";
        }

        push @DefinitionList, \%Definition;
    }

    return \@DefinitionList;
}

=head2 DefinitionGet()

return a config item definition as hash reference

Return
    $Definition->{DefinitionID}
    $Definition->{ClassID}
    $Definition->{Class}
    $Definition->{Definition}
    $Definition->{DefinitionRef}
    $Definition->{Version}
    $Definition->{CreateTime}
    $Definition->{CreateBy}

    my $DefinitionRef = $ConfigItemObject->DefinitionGet(
        DefinitionID => 123,
    );

    or

    my $DefinitionRef = $ConfigItemObject->DefinitionGet(
        ClassID => 123,
    );

=cut

sub DefinitionGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{DefinitionID} && !$Param{ClassID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need DefinitionID or ClassID!',
        );
        return;
    }

    if ( $Param{DefinitionID} ) {

        # check if result is already cached
        return $Self->{Cache}->{DefinitionGet}->{ $Param{DefinitionID} }
            if $Self->{Cache}->{DefinitionGet}->{ $Param{DefinitionID} };

        # ask database
        $Kernel::OM->Get('Kernel::System::DB')->Prepare(
            SQL => 'SELECT id, class_id, configitem_definition, version, create_time, create_by '
                . 'FROM configitem_definition WHERE id = ?',
            Bind  => [ \$Param{DefinitionID} ],
            Limit => 1,
        );
    }
    else {

        # ask database
        $Kernel::OM->Get('Kernel::System::DB')->Prepare(
            SQL => 'SELECT id, class_id, configitem_definition, version, create_time, create_by '
                . 'FROM configitem_definition '
                . 'WHERE class_id = ? ORDER BY version DESC',
            Bind  => [ \$Param{ClassID} ],
            Limit => 1,
        );
    }

    # fetch the result
    my %Definition;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {

        $Definition{DefinitionID} = $Row[0];
        $Definition{ClassID}      = $Row[1];
        $Definition{Definition}   = $Row[2] || "--- []";
        $Definition{Version}      = $Row[3];
        $Definition{CreateTime}   = $Row[4];
        $Definition{CreateBy}     = $Row[5];

        # Check if definition code is not a YAML string.
        if ( substr( $Definition{Definition}, 0, 3 ) ne '---' ) {

            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'notice',
                Message  => "DefinitionID: $Definition{DefinitionID}"
                    . " ClassID: $Definition{ClassID}"
                    . " found in legacy Perl code format, can not continue",
            );

            $Definition{Definition} = "--- []";
        }

        $Definition{DefinitionRef} = $Kernel::OM->Get('Kernel::System::YAML')->Load(
            Data => $Definition{Definition},
        );
    }

    return {} if !$Definition{DefinitionID};

    # prepare definition
    if ( $Definition{DefinitionRef} && ref $Definition{DefinitionRef} eq 'ARRAY' ) {
        $Self->_DefinitionPrepare(
            DefinitionRef => $Definition{DefinitionRef},
        );
    }
    else {
        $Definition{DefinitionRef} = '';
    }

    # get class list
    my $ClassList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    # add class
    $Definition{Class} = $ClassList->{ $Definition{ClassID} };

    # cache the result
    $Self->{Cache}->{DefinitionGet}->{ $Definition{DefinitionID} } = \%Definition;

    return \%Definition;
}

=head2 DefinitionAdd()

add a new definition

    my $DefinitionID = $ConfigItemObject->DefinitionAdd(
        ClassID    => 123,
        Definition => 'the definition code',
        UserID     => 1,
    );

=cut

sub DefinitionAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ClassID Definition UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check definition
    my $Check = $Self->DefinitionCheck(
        Definition => $Param{Definition},
    );

    return if !$Check;

    # get last definition
    my $LastDefinition = $Self->DefinitionGet(
        ClassID => $Param{ClassID},
    );

    # stop add, if definition was not changed
    if ( $LastDefinition->{DefinitionID} && $LastDefinition->{Definition} eq $Param{Definition} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Can't add new definition! The definition was not changed.",
        );
        return;
    }

    # set version
    my $Version = 1;
    if ( $LastDefinition->{Version} ) {
        $Version = $LastDefinition->{Version};
        $Version++;
    }

    # insert new definition
    my $Success = $Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'INSERT INTO configitem_definition '
            . '(class_id, configitem_definition, version, create_time, create_by) VALUES '
            . '(?, ?, ?, current_timestamp, ?)',
        Bind => [ \$Param{ClassID}, \$Param{Definition}, \$Version, \$Param{UserID} ],
    );

    return if !$Success;

    # get id of new definition
    $Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT id FROM configitem_definition WHERE '
            . 'class_id = ? AND version = ? '
            . 'ORDER BY version DESC',
        Bind  => [ \$Param{ClassID}, \$Version ],
        Limit => 1,
    );

    # fetch the result
    my $DefinitionID;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $DefinitionID = $Row[0];
    }

    # trigger DefinitionCreate event
    $Self->EventHandler(
        Event => 'DefinitionCreate',
        Data  => {
            Comment => $DefinitionID,
        },
        UserID => $Param{UserID},
    );

    return $DefinitionID;
}

=head2 DefinitionCheck()

check the syntax of a new definition

    my $True = $ConfigItemObject->DefinitionCheck(
        Definition      => 'the definition code',
        CheckSubElement => 1,                 # (optional, default 0, to check sub elements recursively)
    );

=cut

sub DefinitionCheck {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Definition} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Definition!',
        );
        return;
    }

    # if check sub elements is enabled, we must not YAML load it
    # because this has been done in an earlier recursion step already
    my $Definition;
    if ( $Param{CheckSubElement} ) {
        $Definition = $Param{Definition};
    }
    else {
        if ( substr( $Param{Definition}, 0, 3 ) ne '---' ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Definition must be a YAML string",
            );
            return;
        }

        $Definition = $Kernel::OM->Get('Kernel::System::YAML')->Load(
            Data => $Param{Definition},
        );
    }

    # check if definition exists at all
    if ( !$Definition ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Invalid Definition! You have an syntax error in the definition.',
        );
        return;
    }

    # definition must be an array
    if ( ref $Definition ne 'ARRAY' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Invalid Definition! Definition is not an array reference.',
        );
        return;
    }

    # check each definition attribute
    for my $Attribute ( @{$Definition} ) {

        # each definition attribute must be a hash reference with data
        if ( !$Attribute || ref $Attribute ne 'HASH' || !%{$Attribute} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => 'Invalid Definition! At least one definition attribute is not a hash reference.',
            );
            return;
        }

        # check if the key contains no spaces
        if ( $Attribute->{Key} && $Attribute->{Key} =~ m{ \s }xms ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Invalid Definition! Key '$Attribute->{Key}' must not contain whitespace!",
            );
            return;
        }

        # check if the key contains non-ascii characters
        if ( $Attribute->{Key} && $Attribute->{Key} =~ m{ ([^\x{00}-\x{7f}]) }xms ) {

            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Invalid Definition! Key '$Attribute->{Key}' must not contain non ASCII characters '$1'!",
            );
            return;
        }

        # recursion check for Sub-Elements
        for my $Key ( sort keys %{$Attribute} ) {

            my $Value = $Attribute->{$Key};

            if ( $Key eq 'Sub' && ref $Value eq 'ARRAY' ) {

                # check the sub array
                my $Check = $Self->DefinitionCheck(
                    Definition      => $Value,
                    CheckSubElement => 1,
                );

                if ( !$Check ) {
                    $Kernel::OM->Get('Kernel::System::Log')->Log(
                        Priority => 'error',
                        Message =>
                            "Invalid Sub-Definition of element with the key '$Attribute->{Key}'.",
                    );
                    return;
                }
            }
        }
    }

    return 1;
}

=head2 DefinitionAttributeInfo()

Return attribute information from the definition for a given attribute path name

    my $AttributeInfo = $ConfigItemObject->DefinitionAttributeInfo(
        AttributePath => 'HardDisk::Capacity',
        Definition    => '
            [
                # ...

                {
                    Key => 'HardDisk',
                    Name => 'Hard Disk',
                    Input => {
                        Type => 'Text',
                        Size => 50,
                        MaxLength => 100,
                    },
                    CountMax => 10,
                    Sub => [
                        {
                            Key => 'Capacity',
                            Name => 'Capacity',
                            Input => {
                                Type => 'Text',
                                Size => 20,
                                MaxLength => 10,
                            },
                        },
                    ],
                },

                # ...
            ];
        ',
    );

    Returns:

        my $AttributeInfo =  {
            CountDefault => 1,
            CountMax     => 1,
            Input => {
                Size      => 20,
                Type      => 'Text',
                MaxLength => 10
            },
            Name     => 'Capacity',
            CountMin => 1,
            Key      => 'Capacity'
        };

=cut

sub DefinitionAttributeInfo {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Definition AttributePath)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    my $Subtree = $Param{Definition};
    my $Info;

    PART:
    for my $Part ( split /::/, $Param{AttributePath} ) {
        my ($Found) = grep { $_->{Key} eq $Part } @{$Subtree};

        last PART if !$Found;

        $Subtree = $Found->{Sub};
        $Info    = $Found;
    }

    return $Info;
}

=begin Internal:

=head2 _DefinitionPrepare()

Prepare the syntax of a new definition

    my $True = $ConfigItemObject->_DefinitionPrepare(
        DefinitionRef => $ArrayRef,
    );

=cut

sub _DefinitionPrepare {
    my ( $Self, %Param ) = @_;

    # check definition
    if ( !$Param{DefinitionRef} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need DefinitionRef!',
        );
        return;
    }

    for my $Item ( @{ $Param{DefinitionRef} } ) {

        # set CountMin
        if ( !defined $Item->{CountMin} ) {
            $Item->{CountMin} = 1;
        }

        # set CountMax
        $Item->{CountMax} ||= 1;

        # set CountMin
        if ( $Item->{CountMin} > $Item->{CountMax} ) {
            $Item->{CountMin} = $Item->{CountMax};
        }

        # set CountDefault
        if ( !defined $Item->{CountDefault} ) {
            $Item->{CountDefault} = 1;
        }
        if ( $Item->{CountDefault} < $Item->{CountMin} ) {
            $Item->{CountDefault} = $Item->{CountMin};
        }
        if ( $Item->{CountDefault} > $Item->{CountMax} ) {
            $Item->{CountDefault} = $Item->{CountMax};
        }

        # start recursion, if "Sub" is defined.
        if ( $Item->{Sub} && ref $Item->{Sub} eq 'ARRAY' ) {
            $Self->_DefinitionPrepare(
                DefinitionRef => $Item->{Sub},
            );
        }
        else {
            delete $Item->{Sub};
        }
    }

    return 1;
}

1;

=end Internal:

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<https://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see L<https://www.gnu.org/licenses/gpl-3.0.txt>.

=cut
