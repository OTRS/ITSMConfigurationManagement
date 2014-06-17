# --
# Kernel/GenericInterface/Operation/ConfigItem/Common.pm - ConfigItem common operation functions
# Copyright (C) 2003-2013 OTRS AG, http://otrs.com/
# --
# $Id: Common.pm,v 1.4 2013-04-11 17:25:55 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::GenericInterface::Operation::ConfigItem::Common;

use strict;
use warnings;

use Kernel::System::CustomerUser;
use Kernel::System::CustomerCompany;
use Kernel::System::GeneralCatalog;
use Kernel::System::GenericInterface::Webservice;
use Kernel::System::ITSMConfigItem;
use Kernel::System::Valid;
use Kernel::System::VariableCheck qw(:all);

use vars qw(@ISA);

=head1 NAME

Kernel::GenericInterface::Operation::ConfigItem::Common - common operation functions

=head1 SYNOPSIS

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::Config;
    use Kernel::System::Encode;
    use Kernel::System::Log;
    use Kernel::System::Time;
    use Kernel::System::Main;
    use Kernel::System::DB;
    use Kernel::GenericInterface::Debugger;
    use Kernel::GenericInterface::Operation::ConfigItem::Common;

    my $ConfigObject = Kernel::Config->new();
    my $EncodeObject = Kernel::System::Encode->new(
        ConfigObject => $ConfigObject,
    );
    my $LogObject = Kernel::System::Log->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
    );
    my $TimeObject = Kernel::System::Time->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
    );
    my $MainObject = Kernel::System::Main->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
    );
    my $DBObject = Kernel::System::DB->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
    );
    my $DebuggerObject = Kernel::GenericInterface::Debugger->new(
        ConfigObject       => $ConfigObject,
        LogObject          => $LogObject,
        DBObject           => $DBObject,
        MainObject         => $MainObject,
        TimeObject         => $TimeObject,
        EncodeObject       => $EncodeObject,

        DebuggerConfig   => {
            DebugThreshold  => 'debug',
            TestMode        => 0,           # optional, in testing mode the data will not be
                                            #   written to the DB
            ...
        },
    my $CommonObject = Kernel::GenericInterface::Operation::ConfigItem::Common->new(
        ConfigObject       => $ConfigObject,
        LogObject          => $LogObject,
        DBObject           => $DBObject,
        MainObject         => $MainObject,
        TimeObject         => $TimeObject,
        EncodeObject       => $EncodeObject,
        DebuggerObject     => $DebuggerObject,
        WebserviceID       => $WebserviceID,             # ID of the currently used web service
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Needed (
        qw( DebuggerObject MainObject TimeObject ConfigObject LogObject DBObject EncodeObject WebserviceID OperationName)
        )
    {

        if ( !$Param{$Needed} ) {
            return {
                Success      => 0,
                ErrorMessage => "Got no $Needed!"
            };
        }

        $Self->{$Needed} = $Param{$Needed};
    }

    # create additional objects
    $Self->{CustomerUserObject}    = Kernel::System::CustomerUser->new( %{$Self} );
    $Self->{CustomerCompanyObject} = Kernel::System::CustomerCompany->new( %{$Self} );
    $Self->{ConfigItemObject}      = Kernel::System::ITSMConfigItem->new( %{$Self} );
    $Self->{GeneralCatalogObject}  = Kernel::System::GeneralCatalog->new( %{$Self} );
    $Self->{ValidObject}           = Kernel::System::Valid->new( %{$Self} );
    $Self->{WebserviceObject}      = Kernel::System::GenericInterface::Webservice->new( %{$Self} );

    # get webservice configuration
    $Self->{Webservice} = $Self->{WebserviceObject}->WebserviceGet(
        ID => $Param{WebserviceID},
    );

    if ( !IsHashRefWithData( $Self->{Webservice} ) ) {
        return $Self->_ReturnError(
            ErrorCode => 'Webservice.InvalidConfiguration',
            ErrorMessage =>
                'Could not determine Web service configuration'
                . ' in Kernel::GenericInterface::Operation::Ticket::Common::new()',
        );
    }

    return $Self;
}

=item ReturnError()

helper function to return an error message.

    my $Return = $CommonObject->ReturnError(
        ErrorCode    => ITSMConfigItem.AccessDenied,
        ErrorMessage => 'You dont have rights to access this ticket',
    );

=cut

sub ReturnError {
    my ( $Self, %Param ) = @_;

    $Self->{DebuggerObject}->Error(
        Summary => $Param{ErrorCode},
        Data    => $Param{ErrorMessage},
    );

    # return structure
    return {
        Success      => 1,
        ErrorMessage => "$Param{ErrorCode}: $Param{ErrorMessage}",
        Data         => {
            Error => {
                ErrorCode    => $Param{ErrorCode},
                ErrorMessage => $Param{ErrorMessage},
            },
        },
    };
}

=item ValidateClass()

checks if the given Class is valid.

    my $Sucess = $CommonObject->ValidateClass(
        Class => 'some class',
    );

    returns
    $Success = 1            # or 0

=cut

sub ValidateClass {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{Class};

    # check for Class sent
    my $ItemDataRef = $Self->{GeneralCatalogObject}->ItemGet(
        Class => 'ITSM::ConfigItem::Class',
        Name  => $Param{Class},
    );

    # return false if item data is empty
    return if !IsHashRefWithData($ItemDataRef);

    return 1;
}

=item ValidateDeplState()

checks if the given DeplState is valid.

    my $Sucess = $CommonObject->ValidateDeplState(
        DelpState => 'some DeplState',
    );

    returns
    $Success = 1            # or 0

=cut

sub ValidateDeplState {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{DeplState};

    # check for Class sent
    my $ItemDataRef = $Self->{GeneralCatalogObject}->ItemGet(
        Class => 'ITSM::ConfigItem::DeploymentState',
        Name  => $Param{DeplState},
    );

    # return false if item data is empty
    return if !IsHashRefWithData($ItemDataRef);

    return 1;
}

=item ValidateInciState()

checks if the given InciState is valid.

    my $Sucess = $CommonObject->ValidateInciState(
        InciState => 'some InciState',
    );

    returns
    $Success = 1            # or 0

=cut

sub ValidateInciState {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{InciState};

    # check for Class sent
    my $ItemDataRef = $Self->{GeneralCatalogObject}->ItemGet(
        Class => 'ITSM::Core::IncidentState',
        Name  => $Param{InciState},
    );

    # return false if item data is empty
    return if !IsHashRefWithData($ItemDataRef);

    return 1;
}

=item ValidateInputText()

checks if the given value is valid.

    my $Sucess = $CommonObject->ValidateInputText(
        Value     => 'some value',
        MaxLength => 123,
    );

    returns
    $Success = 1            # or 0

=cut

sub ValidateInputText {
    my ( $Self, %Param ) = @_;

    # check length
    if (
        defined $Param{Input}->{MaxLength}
        && $Param{Input}->{MaxLength}
        && length $Param{Value} > $Param{Input}->{MaxLength}
        )
    {
        return;
    }

    return 1;
}

=item ValidateInputDate()

checks if the given value is valid.

    my $Sucess = $CommonObject->ValidateInputDate(
        Value     => '12/12/1977',
    );

    or

    my $Sucess = $CommonObject->ValidateInputDate(
        Value     => '1977-12-12',
    );

    returns
    $Success = 1            # or 0

=cut

sub ValidateInputDate {
    my ( $Self, %Param ) = @_;

    my $Value = $Param{Value};

    # check and convert for date format like "05/18/2011"
    if ( $Value =~ m{\A (\d{2}) / (\d{2}) / (\d{4}) \z}xms ) {
        $Value = $3 . '-' . $1 . '-' . $2 . ' 00:00:00';
    }

    # check and convert for date format like "2011-05-18"
    if ( $Value =~ m{\A (\d{4} - \d{2} - \d{2} \z) }xms ) {
        $Value = $1 . ' 00:00:00';
    }

    # convert the raw data to a system time format
    my $SystemTime = $Self->{TimeObject}->TimeStamp2SystemTime(
        String => $Value,
    );

    # convert it back to a standard time stamp
    my $TimeStamp = $Self->{TimeObject}->SystemTime2TimeStamp(
        SystemTime => $SystemTime,
    );

    return if !$TimeStamp;

    return 1;
}

=item ValidateInputDateTime()

checks if the given value is valid.

    my $Sucess = $CommonObject->ValidateInputDateTime(
        Value     => '12/12/1977 12:00:00',
    );

    or

    my $Sucess = $CommonObject->ValidateInputDateTime(
        Value     => '1977-12-12 12:00:00',
    );

    returns
    $Success = 1            # or 0

=cut

sub ValidateInputDateTime {
    my ( $Self, %Param ) = @_;

    my $Value = $Param{Value};

    # check and convert for date format like "05/18/2011"
    if ( $Value =~ m{\A (\d{2}) / (\d{2}) / (\d{4}) \z}xms ) {
        $Value = $3 . '-' . $1 . '-' . $2 . ' 00:00:00';
    }
    elsif ( $Value =~ m{\A (\d{2}) / (\d{2}) / (\d{4}) (\d{2} : \d{2} : \d{2}) \z}xms ) {
        $Value = $3 . '-' . $1 . '-' . $2 . $4;
    }

    # check and convert for date format like "2011-05-18"
    if ( $Value =~ m{\A (\d{4} - \d{2} - \d{2} \z) }xms ) {
        $Value = $1 . ' 00:00:00';
    }

    # convert the raw data to a system time format
    my $SystemTime = $Self->{TimeObject}->TimeStamp2SystemTime(
        String => $Value,
    );

    # convert it back to a standard time stamp
    my $TimeStamp = $Self->{TimeObject}->SystemTime2TimeStamp(
        SystemTime => $SystemTime,
    );

    return if !$TimeStamp;

    return 1;
}

=item ValidateInputInteger()

checks if the given value is valid.

    my $Sucess = $CommonObject->ValidateInputInteger(
        Value     => 123,
    );

    returns
    $Success = 1            # or 0

=cut

sub ValidateInputInteger {
    my ( $Self, %Param ) = @_;

    my $Value = $Param{Value};

    return if !IsInteger($Value);

    return if defined $Param{ValueMin} && $Value < $Param{ValueMin};
    return if defined $Param{ValueMax} && $Value > $Param{ValueMax};

    return 1;
}

=item ValidateInputGeneralCatalog()

checks if the given value is valid.

    my $Sucess = $CommonObject->ValidateInputGeneralCatalog(
        Value     => 123,
        Class     => 'Some general catalog class'
    );

    returns
    $Success = 1            # or 0

=cut

sub ValidateInputGeneralCatalog {
    my ( $Self, %Param ) = @_;

    my $Value = $Param{Value};

    # get the values for the General catalog class
    my $ItemList = $Self->{GeneralCatalogObject}->ItemList(
        Class => $Param{Input}->{Class},
    );

    # create a lokup list
    my %ItemListLookup = reverse %{$ItemList};

    return if !$ItemListLookup{$Value};

    return 1;
}

=item ValidateInputCustomer()

checks if the given value is valid.

    my $Sucess = $CommonObject->ValidateInputCustomer(
        Value     => 'some custoer login',
    );

    returns
    $Success = 1            # or 0

=cut

sub ValidateInputCustomer {
    my ( $Self, %Param ) = @_;

    my $Value = $Param{Value};

    return if !$Value;

    my %CustomerData = $Self->{CustomerUserObject}->CustomerUserDataGet(
        User => $Param{Value},
    );

    # if customer is not registered in the database
    return if !IsHashRefWithData( \%CustomerData );

    # if ValidID is present, check if it is valid!
    if ( defined $CustomerData{ValidID} ) {

        # return false if customer is not valid
        return if $Self->{ValidObject}->ValidLookup( ValidID => $CustomerData{ValidID} ) ne 'valid';
    }

    return 1;
}

=item ValidateInputCustomerCompany()

checks if the given value is valid.

    my $Sucess = $CommonObject->ValidateInputCustomerCompany(
        Value     => 'some custoer login',
    );

    returns
    $Success = 1            # or 0

=cut

sub ValidateInputCustomerCompany {
    my ( $Self, %Param ) = @_;

    my $Value = $Param{Value};

    return if !$Value;

    my %CompanyList = $Self->{CustomerCompanyObject}->CustomerCompanyList();

    return if !$CompanyList{ $Param{Value} };

    return 1;
}

=item ValidateMimeType()

checks if the given MimeType is valid.

    my $Sucess = $CommonObject->ValidateMimeType(
        MimeTypeID => 'some MimeType',
    );

    returns
    $Success = 1            # or 0

=cut

sub ValidateMimeType {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{MimeType};

    return if $Param{MimeType} !~ m{\A\w+\/\w+\z};

    return 1;
}

=item ValidateCharset()

checks if the given Charset is valid.

    my $Sucess = $CommonObject->ValidateCharset(
        Charset => 'some charset',
    );

    returns
    $Success = 1            # or 0

=cut

sub ValidateCharset {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{Charset};

    my $CharsetList = $Self->_CharsetList();

    return if !$CharsetList->{ $Param{Charset} };

    return 1;
}

=item ReplaceInputDate()

replaces the user value with a system valid value.

    my $NewValue = $CommonObject->ReplaceInputDate(
        Value     => '12/12/1977',
    );

    or

    my $NewValue = $CommonObject->ReplaceInputDate(
        Value     => '1977-12-12',
    );

    returns
    $NewValue = '1977-12-12 00:00:00',

=cut

sub ReplaceInputDate {
    my ( $Self, %Param ) = @_;

    my $Value = $Param{Value};

    # check and convert for date format like "05/18/2011"
    if ( $Value =~ m{\A (\d{2}) / (\d{2}) / (\d{4}) \z}xms ) {
        $Value = $3 . '-' . $1 . '-' . $2 . ' 00:00:00';
    }

    # check and convert for date format like "2011-05-18"
    if ( $Value =~ m{\A (\d{4} - \d{2} - \d{2} \z) }xms ) {
        $Value = $1 . ' 00:00:00';
    }

    # convert the raw data to a system time format
    my $SystemTime = $Self->{TimeObject}->TimeStamp2SystemTime(
        String => $Value,
    );

    # convert it back to a standard time stamp
    my $TimeStamp = $Self->{TimeObject}->SystemTime2TimeStamp(
        SystemTime => $SystemTime,
    );

    return $TimeStamp;
}

=item ReplaceInputDateTime()

replaces the user value with a system valid value.

    my $NewValue = $CommonObject->ReplaceInputDateTime(
        Value     => '12/12/1977 12:00:00',
    );

    or

    my $NewValue = $CommonObject->ReplaceInputDateTime(
        Value     => '1977-12-12 12:00:00',
    );

    returns
    $NewValue = '1977-12-12 12:00:00';

=cut

sub ReplaceInputDateTime {
    my ( $Self, %Param ) = @_;

    my $Value = $Param{Value};

    # check and convert for date format like "05/18/2011"
    if ( $Value =~ m{\A (\d{2}) / (\d{2}) / (\d{4}) \z}xms ) {
        $Value = $3 . '-' . $1 . '-' . $2 . ' 00:00:00';
    }
    elsif ( $Value =~ m{\A (\d{2}) / (\d{2}) / (\d{4}) (\d{2} : \d{2} : \d{2}) \z}xms ) {
        $Value = $3 . '-' . $1 . '-' . $2 . $4;
    }

    # check and convert for date format like "2011-05-18"
    if ( $Value =~ m{\A (\d{4} - \d{2} - \d{2} \z) }xms ) {
        $Value = $1 . ' 00:00:00';
    }

    # convert the raw data to a system time format
    my $SystemTime = $Self->{TimeObject}->TimeStamp2SystemTime(
        String => $Value,
    );

    # convert it back to a standard time stamp
    my $TimeStamp = $Self->{TimeObject}->SystemTime2TimeStamp(
        SystemTime => $SystemTime,
    );

    return $TimeStamp;
}

=item ReplaceInputGeneralCatalog()

replaces the user value with a system valid value.

    my $NewValue = $CommonObject->ReplaceInputGeneralCatalog(
        Value     => 'some value',
        Class     => 'Some general catalog class'
    );

    returns
    $NewValue = 123

=cut

sub ReplaceInputGeneralCatalog {
    my ( $Self, %Param ) = @_;

    my $Value = $Param{Value};

    # get the values for the General catalog class
    my $ItemList = $Self->{GeneralCatalogObject}->ItemList(
        Class => $Param{Input}->{Class},
    );

    # create a lokup list
    my %ItemListLookup = reverse %{$ItemList};

    return $ItemListLookup{$Value};
}

=item InvertReplaceInputDate()

replaces the system value with a user value.

    my $NewValue = $CommonObject->InvertReplaceInputDate(
        Value     => '12-12-1977 00:00:00',
    );

    returns
    $NewValue = '1977-12-12',

=cut

sub InvertReplaceInputDate {
    my ( $Self, %Param ) = @_;

    my $Value = $Param{Value};

    $Value =~ s{\A (\d{4} - \d{2} - \d{2}) [ ] 00:00:00 \z}{$1}xms;

    return $Value;
}

=item InvertReplaceInputGeneralCatalog()

replaces the system value with a user value.

    my $NewValue = $CommonObject->InvertReplaceInputGeneralCatalog(
        Value     => 123,
        Class     => 'Some general catalog class'
    );

    returns
    $NewValue = 'some value'

=cut

sub InvertReplaceInputGeneralCatalog {
    my ( $Self, %Param ) = @_;

    my $Value = $Param{Value};

    # get the values for the General catalog class
    my $ItemList = $Self->{GeneralCatalogObject}->ItemList(
        Class => $Param{Input}->{Class},
    );

    # create a lokup list
    return $ItemList->{$Value};
}

=item CreateAttachment()

cretes a new attachment for the given ConfigItem.

    my $Result = $CommonObject->CreateAttachment(
        Content     => $Data,                   # file content (Base64 encoded)
        ContentType => 'some content type',
        Filename    => 'some filename',
        ConfigItemID   => 456,
        UserID      => 123.
    );

    returns
    $Result = {
        Success => 1,                        # if everything is ok
    }

    $Result = {
        Success      => 0,
        ErrorMessage => 'Error description'
    }

=cut

sub CreateAttachment {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(Attachment ConfigItemID UserID)) {
        if ( !$Param{$Needed} ) {
            return {
                Success      => 0,
                ErrorMessage => "CreateAttachment() Got no $Needed!"
            };
        }
    }

    # write attachment
    my $Success = $Self->{ConfigItemObject}->ConfigItemAttachmentAdd(
        %{ $Param{Attachment} },
        ConfigItemID => $Param{ConfigItemID},
        Content      => MIME::Base64::decode_base64( $Param{Attachment}->{Content} ),
        UserID       => $Param{UserID},
    );

    return {
        Success => $Success,
    };
}

=item CheckXMLData()

checks if the given XMLData value are valid.

    my $XMLDataCheck = $CommonObject->CheckXMLData(
        Definition => $DefinitionArrayRef,          # Config Item Definition ot just part of it
        XMLData    => $XMLDataHashRef,
        Parent     => 'some parent',
    );

    returns:

    $XMLDataCheck = {
        Success => 1,                               # if everything is OK
    }

    $XMLDataCheck = {
        ErrorCode    => 'Function.Error',           # if error
        ErrorMessage => 'Error description',
    }

=cut

sub CheckXMLData {
    my ( $Self, %Param ) = @_;

    my $Definition = $Param{Definition};
    my $XMLData    = $Param{XMLData};
    my $Parent     = $Param{Parent} || '';

    my $CheckValueResult;
    for my $DefItem ( @{$Definition} ) {
        my $ItemKey = $DefItem->{Key};

        # check if at least one element should exist
        if (
            (
                defined $DefItem->{CountMin}
                && $DefItem->{CountMin} >= 1
                && defined $DefItem->{Input}->{Required}
                && $DefItem->{Input}->{Required}
            )
            && ( !defined $XMLData->{$ItemKey} || !$XMLData->{$ItemKey} )
            )
        {
            return {
                ErrorCode => "$Self->{OperationName}.MissingParameter",
                ErrorMessage =>
                    "$Self->{OperationName}: ConfigItem->CIXMLData->$Parent$ItemKey parameter"
                    . " is missing!",
            };
        }

        if ( ref $XMLData->{$ItemKey} eq 'ARRAY' ) {
            for my $ArrayItem ( @{ $XMLData->{$ItemKey} } ) {
                if ( ref $ArrayItem eq 'HASH' ) {
                    $CheckValueResult = $Self->_CheckValue(
                        Value   => $ArrayItem->{$ItemKey},
                        Input   => $DefItem->{Input},
                        ItemKey => $ItemKey,
                        Parent  => $Parent,
                    );
                    if ( !$CheckValueResult->{Success} ) {
                        return $CheckValueResult;
                    }
                }
                elsif ( ref $ArrayItem eq '' ) {
                    $CheckValueResult = $Self->_CheckValue(
                        Value   => $ArrayItem,
                        Input   => $DefItem->{Input},
                        ItemKey => $ItemKey,
                        Parent  => $Parent,
                    );
                    if ( !$CheckValueResult->{Success} ) {
                        return $CheckValueResult;
                    }
                }
                else {
                    return {
                        ErrorCode => "$Self->{OperationName}.InvalidParameter",
                        ErrorMessage =>
                            "$Self->{OperationName}: ConfigItem->CIXMLData->$Parent$ItemKey parameter"
                            . " is invalid!",
                    };
                }
            }
        }
        elsif ( ref $XMLData->{$ItemKey} eq 'HASH' ) {
            $CheckValueResult = $Self->_CheckValue(
                Value   => $XMLData->{$ItemKey}->{$ItemKey},
                Input   => $DefItem->{Input},
                ItemKey => $ItemKey,
                Parent  => $Parent,
            );
            if ( !$CheckValueResult->{Success} ) {
                return $CheckValueResult;
            }
        }
        else {

            # only perform checks if item really exits in the XMLData
            # CountNin checks was verified and passed before!, so it is safe to skip if needed
            if ( $XMLData->{$ItemKey} ) {
                $CheckValueResult = $Self->_CheckValue(
                    Value   => $XMLData->{$ItemKey},
                    Input   => $DefItem->{Input},
                    ItemKey => $ItemKey,
                    Parent  => $Parent,
                );
                if ( !$CheckValueResult->{Success} ) {
                    return $CheckValueResult;
                }
            }
        }

        # check if exists more elements than the ones they should
        if ( defined $DefItem->{CountMax} )
        {
            if (
                ref $XMLData->{$ItemKey} eq 'ARRAY'
                && scalar @{ $XMLData->{$ItemKey} } > $DefItem->{CountMax}
                )
            {
                return {
                    ErrorCode => "$Self->{OperationName}.InvalidParameter",
                    ErrorMessage =>
                        "$Self->{OperationName}: ConfigItem->CIXMLData->$Parent$ItemKey parameter"
                        . " repetitions is higher than the maxium value!",
                };
            }
        }

        # check if there is a sub and start recursion
        if ( defined $DefItem->{Sub} ) {

            if ( ref $XMLData->{$ItemKey} eq 'ARRAY' ) {
                my $Counter = 0;
                for my $ArrayItem ( @{ $XMLData->{$ItemKey} } ) {

                    # start recursion for each array item
                    my $XMLDataCheck = $Self->CheckXMLData(
                        Definition => $DefItem->{Sub},
                        XMLData    => $ArrayItem,
                        Parent     => $Parent . $ItemKey . "[$Counter]->",
                    );
                    if ( !$XMLDataCheck->{Success} ) {
                        return $XMLDataCheck;
                    }
                    $Counter++;
                }
            }
            elsif ( ref $XMLData->{$ItemKey} eq 'HASH' ) {

                # start recursion
                my $XMLDataCheck = $Self->CheckXMLData(
                    Definition => $DefItem->{Sub},
                    XMLData    => $XMLData->{$ItemKey},
                    Parent     => $Parent . $ItemKey . '->',
                );
                if ( !$XMLDataCheck->{Success} ) {
                    return $XMLDataCheck;
                }
            }
            else {

                # start recusrsion
                my $XMLDataCheck = $Self->CheckXMLData(
                    Definition => $DefItem->{Sub},
                    XMLData    => {},
                    Parent     => $Parent . $ItemKey . '->',
                );
                if ( !$XMLDataCheck->{Success} ) {
                    return $XMLDataCheck;
                }
            }
        }
    }

    return {
        Success => 1,
        }
}

=item ReplaceXMLData()

replace the XMLData to one that uses internal values.

    my $NewXMLData = $CommonObject->ReplaceXMLData(
        Definition => $DefinitionArrayRef,          # Config Item Definition ot just part of it
        XMLData    => $XMLDataHashRef,
        Parent     => 'some parent',
    );

    returns:

    $NewXMLData = $XMLDataHashRef,                  # with replaced values

=cut

sub ReplaceXMLData {
    my ( $Self, %Param ) = @_;

    my $Definition = $Param{Definition};
    my $XMLData    = $Param{XMLData};
    my $Parent     = $Param{Parent} || '';

    my $NewXMLData = $XMLData;

    ITEM:
    for my $DefItem ( @{$Definition} ) {
        my $ItemKey = $DefItem->{Key};

        my $NewValue;

        if ( ref $XMLData->{$ItemKey} eq 'ARRAY' ) {
            for my $ArrayItem ( @{ $XMLData->{$ItemKey} } ) {
                if ( ref $ArrayItem eq 'HASH' ) {

                    # get the new value
                    $NewValue = $Self->_ReplaceValue(
                        Value   => $ArrayItem->{$ItemKey},
                        Input   => $DefItem->{Input},
                        ItemKey => $ItemKey,
                        Parent  => $Parent,
                    );

                    # replace the value in the array
                    $ArrayItem->{$ItemKey} = $NewValue;
                }

                elsif ( ref $ArrayItem eq '' ) {
                    $NewValue = $Self->_ReplaceValue(
                        Value   => $ArrayItem,
                        Input   => $DefItem->{Input},
                        ItemKey => $ItemKey,
                        Parent  => $Parent,
                    );

                    # replace the value in the array
                    $ArrayItem = $NewValue;
                }
            }
        }
        elsif ( ref $XMLData->{$ItemKey} eq 'HASH' ) {
            $NewValue = $Self->_ReplaceValue(
                Value   => $XMLData->{$ItemKey}->{$ItemKey},
                Input   => $DefItem->{Input},
                ItemKey => $ItemKey,
                Parent  => $Parent,
            );

            # replace the value in the hash
            $XMLData->{$ItemKey}->{$ItemKey} = $NewValue
        }
        else {

            # only perform replace if item really exits in the XMLData
            if ( $XMLData->{$ItemKey} ) {
                $NewValue = $Self->_ReplaceValue(
                    Value   => $XMLData->{$ItemKey},
                    Input   => $DefItem->{Input},
                    ItemKey => $ItemKey,
                    Parent  => $Parent,
                );

                # replace the root value
                $XMLData->{$ItemKey} = $NewValue
            }
        }

        # replace value in the resulting XMLData
        if ( $XMLData->{$ItemKey} ) {
            $NewXMLData->{$ItemKey} = $XMLData->{$ItemKey};
        }

        # check if there is a sub and start recursion
        if ( defined $DefItem->{Sub} ) {

            if ( ref $XMLData->{$ItemKey} eq 'ARRAY' ) {
                my $Counter = 0;
                for my $ArrayItem ( @{ $XMLData->{$ItemKey} } ) {

                    # start recursion for each array item
                    my $NewXMLDataPart = $Self->ReplaceXMLData(
                        Definition => $DefItem->{Sub},
                        XMLData    => $ArrayItem,
                        Parent     => $Parent . $ItemKey . "[$Counter]->",
                    );
                    $NewXMLData->{$ItemKey}->[$Counter] = $NewXMLDataPart;
                    $Counter++;
                }
            }
            elsif ( ref $XMLData->{$ItemKey} eq 'HASH' ) {

                # start recursion
                my $NewXMLDataPart = $Self->ReplaceXMLData(
                    Definition => $DefItem->{Sub},
                    XMLData    => $XMLData->{$ItemKey},
                    Parent     => $Parent . $ItemKey . '->',
                );
                $NewXMLData->{$ItemKey} = $NewXMLDataPart;
            }
            else {
                if ( $XMLData->{$ItemKey} ) {

                    # start recusrsion
                    my $NewXMLDataPart = $Self->ReplaceXMLData(
                        Definition => $DefItem->{Sub},
                        XMLData    => {},
                        Parent     => $Parent . $ItemKey . '->',
                    );
                    $NewXMLData->{$ItemKey} = $NewXMLDataPart;
                }
            }
        }
    }
    return $NewXMLData;
}

=item FormatXMLData()

Create a XMLData suitable for VersionAdd.

    my $NewXMLData = $CommonObject->FormatXMLData(
        XMLData    => $XMLDataHashRef,
        Child      => 1,                    # or 0, optional
    );

    returns:

    $NewXMLData = $XMLDataHashRef,                  # suitable for version add

=cut

sub FormatXMLData {
    my ( $Self, %Param ) = @_;

    my $XMLData = $Param{XMLData};
    my $Child   = $Param{Child};

    my $NewXMLData;

    for my $RootKey ( sort keys %{$XMLData} ) {
        if ( ref $XMLData->{$RootKey} eq 'ARRAY' ) {
            my @NewXMLParts;
            $NewXMLParts[0] = undef;

            for my $ArrayItem ( @{ $XMLData->{$RootKey} } ) {
                if ( ref $ArrayItem eq 'HASH' ) {

                    # extract the root key from the hash and assing it to content key
                    my $Content = delete $ArrayItem->{$RootKey};

                    # start recursion
                    my $NewXMLDataPart = $Self->FormatXMLData(
                        XMLData => $ArrayItem,
                        Child   => 1,
                    );
                    push @NewXMLParts, {
                        Content => $Content,
                        %{$NewXMLDataPart},
                    };
                }
                elsif ( ref $ArrayItem eq '' ) {
                    push @NewXMLParts, {
                        Content => $ArrayItem,
                    };
                }
            }

            # assamble the final value from the parts array
            $NewXMLData->{$RootKey} = \@NewXMLParts;
        }

        if ( ref $XMLData->{$RootKey} eq 'HASH' ) {

            my @NewXMLParts;
            $NewXMLParts[0] = undef;

            # extract the root key from the hash and assing it to content key
            my $Content = delete $XMLData->{$RootKey}->{$RootKey};

            # start recursion
            my $NewXMLDataPart = $Self->FormatXMLData(
                XMLData => $XMLData->{$RootKey},
                Child   => 1,
            );
            push @NewXMLParts, {
                Content => $Content,
                %{$NewXMLDataPart},
            };

            # assamble the final value from the parts array
            $NewXMLData->{$RootKey} = \@NewXMLParts;
        }

        elsif ( ref $XMLData->{$RootKey} eq '' ) {
            $NewXMLData->{$RootKey} = [
                undef,
                {
                    Content => $XMLData->{$RootKey},
                }
                ],
        }
    }

    # return only the part on recursion
    if ($Child) {
        return $NewXMLData;
    }

    # return the complete XMLData as needed for version add
    return [
        undef,
        {
            Version => [
                undef,
                $NewXMLData
            ],
        },
    ];
}

=item InvertFormatXMLData()

Creates a readible XMLData.

    my $NewXMLData = $CommonObject->InvertFormatXMLData(
        XMLData    => $XMLDataHashRef,
    );

    returns:

    $NewXMLData = $XMLDataHashRef,                  # suitable for version add

=cut

sub InvertFormatXMLData {
    my ( $Self, %Param ) = @_;

    my $XMLData = $Param{XMLData};

    my $NewXMLData;
    my $Content;
    ROOTHASH:
    for my $RootHash ( @{$XMLData} ) {
        next ROOTHASH if !defined $RootHash;
        delete $RootHash->{TagKey};

        for my $RootHashKey ( sort keys %{$RootHash} ) {
            if ( ref $RootHash->{$RootHashKey} eq 'ARRAY' ) {
                if ( scalar @{ $RootHash->{$RootHashKey} } > 2 ) {

                    # we are on an array
                    my $Counter = 0;
                    ARRAYITEM:
                    for my $ArrayItem ( @{ $RootHash->{$RootHashKey} } ) {
                        next ARRAYITEM if !defined $ArrayItem;
                        delete $ArrayItem->{TagKey};

                        $Content = delete $ArrayItem->{Content} || '';

                        if ( scalar keys %{$ArrayItem} ) {
                            $NewXMLData->{$RootHashKey}->[$Counter]->{$RootHashKey} = $Content;

                            # start recursion
                            for my $ArrayItemKey ( sort keys %{$ArrayItem} ) {

                                my $NewXMLDataPart = $Self->InvertFormatXMLData(
                                    XMLData => $ArrayItem->{$ArrayItemKey},
                                );
                                $NewXMLData->{$RootHashKey}->[$Counter]->{$ArrayItemKey}
                                    = $NewXMLDataPart;
                            }
                        }
                        else {
                            $NewXMLData->{$RootHashKey}->[$Counter] = $Content
                        }

                        $Counter++;
                    }
                }
                else {

                    # we are on a hash or single value
                    ARRAYITEM:
                    for my $ArrayItem ( @{ $RootHash->{$RootHashKey} } ) {
                        next ARRAYITEM if !defined $ArrayItem;
                        delete $ArrayItem->{TagKey};

                        $Content = delete $ArrayItem->{Content} || '';

                        if ( scalar keys %{$ArrayItem} ) {
                            $NewXMLData->{$RootHashKey}->{$RootHashKey} = $Content;

                            # start recursion
                            for my $ArrayItemKey ( sort keys %{$ArrayItem} ) {

                                my $NewXMLDataPart = $Self->InvertFormatXMLData(
                                    XMLData => $ArrayItem->{$ArrayItemKey},
                                );
                                $NewXMLData->{$RootHashKey}->{$ArrayItemKey} = $NewXMLDataPart;
                            }
                        }
                        else {
                            $NewXMLData->{$RootHashKey} = $Content
                        }
                    }
                }
            }

            # if we are on a final node
            elsif ( ref $RootHash->{$RootHashKey} eq '' && $RootHashKey eq 'Content' ) {
                $NewXMLData = $RootHash->{$RootHashKey};
            }
        }
    }

    return $NewXMLData;
}

=item InvertReplaceXMLData()

replace the XMLData to one that uses user values.

    my $NewXMLData = $CommonObject->InvertReplaceXMLData(
        Definition => $DefinitionArrayRef,          # Config Item Definition ot just part of it
        XMLData    => $XMLDataHashRef,
        Parent     => 'some parent',
    );

    returns:

    $NewXMLData = $XMLDataHashRef,                  # with replaced values

=cut

sub InvertReplaceXMLData {
    my ( $Self, %Param ) = @_;

    my $Definition = $Param{Definition};
    my $XMLData    = $Param{XMLData};
    my $Parent     = $Param{Parent} || '';

    my $NewXMLData = $XMLData;

    ITEM:
    for my $DefItem ( @{$Definition} ) {
        my $ItemKey = $DefItem->{Key};

        my $NewValue;

        if ( ref $XMLData->{$ItemKey} eq 'ARRAY' ) {
            for my $ArrayItem ( @{ $XMLData->{$ItemKey} } ) {
                if ( ref $ArrayItem eq 'HASH' ) {

                    # get the new value
                    $NewValue = $Self->_InvertReplaceValue(
                        Value   => $ArrayItem->{$ItemKey},
                        Input   => $DefItem->{Input},
                        ItemKey => $ItemKey,
                        Parent  => $Parent,
                    );

                    # replace the value in the array
                    $ArrayItem->{$ItemKey} = $NewValue;
                }

                elsif ( ref $ArrayItem eq '' ) {
                    $NewValue = $Self->_InvertReplaceValue(
                        Value   => $ArrayItem,
                        Input   => $DefItem->{Input},
                        ItemKey => $ItemKey,
                        Parent  => $Parent,
                    );

                    # replace the value in the array
                    $ArrayItem = $NewValue;
                }
            }
        }
        elsif ( ref $XMLData->{$ItemKey} eq 'HASH' ) {
            $NewValue = $Self->_InvertReplaceValue(
                Value   => $XMLData->{$ItemKey}->{$ItemKey},
                Input   => $DefItem->{Input},
                ItemKey => $ItemKey,
                Parent  => $Parent,
            );

            # replace the value in the hash
            $XMLData->{$ItemKey}->{$ItemKey} = $NewValue
        }
        else {

            # only perform replace if item really exits in the XMLData
            if ( $XMLData->{$ItemKey} ) {
                $NewValue = $Self->_InvertReplaceValue(
                    Value   => $XMLData->{$ItemKey},
                    Input   => $DefItem->{Input},
                    ItemKey => $ItemKey,
                    Parent  => $Parent,
                );

                # replace the root value
                $XMLData->{$ItemKey} = $NewValue
            }
        }

        # replace value in the resulting XMLData
        if ( $XMLData->{$ItemKey} ) {
            $NewXMLData->{$ItemKey} = $XMLData->{$ItemKey};
        }

        # check if there is a sub and start recursion
        if ( defined $DefItem->{Sub} ) {

            if ( ref $XMLData->{$ItemKey} eq 'ARRAY' ) {
                my $Counter = 0;
                for my $ArrayItem ( @{ $XMLData->{$ItemKey} } ) {

                    # start recursion for each array item
                    my $NewXMLDataPart = $Self->InvertReplaceXMLData(
                        Definition => $DefItem->{Sub},
                        XMLData    => $ArrayItem,
                        Parent     => $Parent . $ItemKey . "[$Counter]->",
                    );
                    $NewXMLData->{$ItemKey}->[$Counter] = $NewXMLDataPart;
                    $Counter++;
                }
            }
            elsif ( ref $XMLData->{$ItemKey} eq 'HASH' ) {

                # start recursion
                my $NewXMLDataPart = $Self->InvertReplaceXMLData(
                    Definition => $DefItem->{Sub},
                    XMLData    => $XMLData->{$ItemKey},
                    Parent     => $Parent . $ItemKey . '->',
                );
                $NewXMLData->{$ItemKey} = $NewXMLDataPart;
            }
            else {
                if ( $XMLData->{$ItemKey} ) {

                    # start recusrsion
                    my $NewXMLDataPart = $Self->InvertReplaceXMLData(
                        Definition => $DefItem->{Sub},
                        XMLData    => {},
                        Parent     => $Parent . $ItemKey . '->',
                    );
                    $NewXMLData->{$ItemKey} = $NewXMLDataPart;
                }
            }
        }
    }
    return $NewXMLData;
}

=begin Internal:

=item _CharsetList()

returns a list of all available charsets.

    my $CharsetList = $CommonObject->_CharsetList(
        UserID => 123,
    );

    returns
    $Success = {
        #...
        iso-8859-1  => 1,
        iso-8859-15 => 1,
        MacRoman    => 1,
        utf8        => 1,
        #...
    }

=cut

sub _CharsetList {
    my ( $Self, %Param ) = @_;

    # get charset array
    use Encode;
    my @CharsetList = Encode->encodings(":all");

    my %CharsetHash;

    # create a charset lookup table
    for my $Charset (@CharsetList) {
        $CharsetHash{$Charset} = 1;
    }

    return \%CharsetHash;
}

=item _CheckValue()

checks if the given value is valid.

    my $ValueCheck = $CommonObject->_CheckValue(
        Value   => $Value                        # $Value could be a string, a time stamp,
                                                 #   general catalog class name, or a integer
        Input   => $InputDefinitionHashRef,      # The definition of the element input extracted
                                                 #   from the Configuration Item definition for
                                                 #   for each value
        ItemKey => 'some key',                   # The name of the value as sent in the SOAP
                                                 #   request
        Parent  => 'soem parent key->',          # The name of the parent followed by -> or empty
                                                 #   for root key items
    );

    returns:

    $ValueCheck = {
        Success => 1,                            # if everything is OK
    }

    $ValueCheck = {
        ErrorCode    => 'Function.Error',        # if error
        ErrorMessage => 'Error description',
    }

=cut

sub _CheckValue {
    my ( $Self, %Param ) = @_;

    my $Parent  = $Param{Parent};
    my $ItemKey = $Param{ItemKey};

    if (
        defined $Param{Input}->{Required} && $Param{Input}->{Required} && !$Param{Value}
        )
    {
        return {
            ErrorCode => "$Self->{OperationName}.MissingParameter",
            ErrorMessage =>
                "$Self->{OperationName}: ConfigItem->CIXMLData->$Parent$ItemKey parameter value"
                . " is required and is missing!",
        };
    }

    if ( $Param{Input}->{Type} eq 'Text' || $Param{Input}->{Type} eq 'TextArea' ) {

        # run Text validations
        if ( !$Self->ValidateInputText(%Param) ) {
            return {
                ErrorCode => "$Self->{OperationName}.InvalidParameter",
                ErrorMessage =>
                    "$Self->{OperationName}: ConfigItem->CIXMLData->$Parent$ItemKey parameter value"
                    . " excedes the maxium length!",
            };
        }
    }
    elsif ( $Param{Input}->{Type} eq 'Date' ) {

        # run Date validations
        if ( !$Self->ValidateInputDate(%Param) ) {
            return {
                ErrorCode => "$Self->{OperationName}.InvalidParameter",
                ErrorMessage =>
                    "$Self->{OperationName}: ConfigItem->CIXMLData->$Parent$ItemKey parameter value"
                    . " is not a valid Date format!",
            };
        }
    }
    elsif ( $Param{Input}->{Type} eq 'DateTime' ) {

        # run DateTime validations
        if ( !$Self->ValidateInputDateTime(%Param) ) {
            return {
                ErrorCode => "$Self->{OperationName}.InvalidParameter",
                ErrorMessage =>
                    "$Self->{OperationName}: ConfigItem->CIXMLData->$Parent$ItemKey parameter value"
                    . " is not a valid DateTime format!",
            };
        }
    }
    elsif ( $Param{Input}->{Type} eq 'Customer' ) {

        # run Customer validations
        if ( !$Self->ValidateInputCustomer(%Param) ) {
            return {
                ErrorCode => "$Self->{OperationName}.InvalidParameter",
                ErrorMessage =>
                    "$Self->{OperationName}: ConfigItem->CIXMLData->$Parent$ItemKey parameter value"
                    . " is not a valid customer!",
            };
        }
    }
    elsif ( $Param{Input}->{Type} eq 'CustomerCompany' ) {

        # run CustomerCompany validations
        if ( !$Self->ValidateInputCustomerCompany(%Param) ) {
            return {
                ErrorCode => "$Self->{OperationName}.InvalidParameter",
                ErrorMessage =>
                    "$Self->{OperationName}: ConfigItem->CIXMLData->$Parent$ItemKey parameter value"
                    . " is not a valid customer company!",
            };
        }
    }
    elsif ( $Param{Input}->{Type} eq 'Integer' ) {

        # run Integer validations
        if ( !$Self->ValidateInputInteger(%Param) ) {
            return {
                ErrorCode => "$Self->{OperationName}.InvalidParameter",
                ErrorMessage =>
                    "$Self->{OperationName}: ConfigItem->CIXMLData->$Parent$ItemKey parameter value"
                    . " is not a valid Integer or out of range!",
            };
        }
    }
    elsif ( $Param{Input}->{Type} eq 'GeneralCatalog' ) {

        # run General Catalog validations
        if ( !$Self->ValidateInputGeneralCatalog(%Param) ) {
            return {
                ErrorCode => "$Self->{OperationName}.InvalidParameter",
                ErrorMessage =>
                    "$Self->{OperationName}: ConfigItem->CIXMLData->$Parent$ItemKey parameter value"
                    . " is not a valid for General Catalog '$Param{Input}->{Class}'!",
            };
        }
    }
    else {

        # The type is dummy, do nothing
    }

    return {
        Success => 1,
    };
}

=item _ReplaceValue()

replace user values with system ready values.

    my $NewValue = $CommonObject->_ReplaceValue(
        Value   => $Value                        # $Value could be a string, a time stamp,
                                                 #   general catalog class name, or a integer
        Input   => $InputDefinitionHashRef,      # The definition of the element input extracted
                                                 #   from the Configuration Item definition for
                                                 #   for each value
                                                 #   for root key items
    );

    returns:

    $NewValue = $ANewValue
=cut

sub _ReplaceValue {
    my ( $Self, %Param ) = @_;

    # set the list of input types that needs to be replaced
    my %ReplaceInputTypes = (
        Date           => 1,
        DateTime       => 1,
        GeneralCatalog => 1,
    );
    if ( !$ReplaceInputTypes{ $Param{Input}->{Type} } ) {
        return $Param{Value};
    }

    my $NewValue;

    if ( $Param{Input}->{Type} eq 'Date' ) {

        # run Date replace
        $NewValue = $Self->ReplaceInputDate(%Param)
    }
    elsif ( $Param{Input}->{Type} eq 'DateTime' ) {

        # run DateTime replace
        $NewValue = $Self->ReplaceInputDateTime(%Param)
    }
    else {
        # run General Catalog replace
        $NewValue = $Self->ReplaceInputGeneralCatalog(%Param)
    }

    return $NewValue;
}

=item _InvertReplaceValue()

replace internal values with user values.

    my $NewValue = $OperationObject->_InvertReplaceValue(
        Value   => $Value                        # $Value could be a string, a time stamp,
                                                 #   general catalog class name, or a integer
        Input   => $InputDefinitionHashRef,      # The definition of the element input extracted
                                                 #   from the Configuration Item definition for
                                                 #   for each value
                                                 #   for root key items
    );

    returns:

    $NewValue = $ANewValue
=cut

sub _InvertReplaceValue {
    my ( $Self, %Param ) = @_;

    # set the list of input types that needs to be replaced
    my %ReplaceInputTypes = (
        Date           => 1,
        GeneralCatalog => 1,
    );

    if ( !$ReplaceInputTypes{ $Param{Input}->{Type} } ) {
        return $Param{Value};
    }

    my $NewValue;

    if ( $Param{Input}->{Type} eq 'Date' ) {

        # run Date replace
        $NewValue = $Self->InvertReplaceInputDate(%Param)
    }
    else {
        # run General Catalog replace
        $NewValue = $Self->InvertReplaceInputGeneralCatalog(%Param)
    }

    return $NewValue;
}

1;

=end Internal:

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
