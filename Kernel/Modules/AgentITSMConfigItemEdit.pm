# --
# Kernel/Modules/AgentITSMConfigItemEdit.pm - the OTRS ITSM config item edit module
# Copyright (C) 2001-2014 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMConfigItemEdit;

use strict;
use warnings;

use Kernel::System::ITSMConfigItem;
use Kernel::System::GeneralCatalog;
use Kernel::System::Web::UploadCache;
use Kernel::System::VariableCheck qw(:all);

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

    # create additional objects
    $Self->{ConfigItemObject}     = Kernel::System::ITSMConfigItem->new(%Param);
    $Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new(%Param);
    $Self->{UploadCacheObject}    = Kernel::System::Web::UploadCache->new(%Param);

    # get config of frontend module
    $Self->{Config} = $Self->{ConfigObject}->Get("ITSMConfigItem::Frontend::$Self->{Action}");

    # get form id
    $Self->{FormID} = $Self->{ParamObject}->GetParam( Param => 'FormID' );

    # create form id
    if ( !$Self->{FormID} ) {
        $Self->{FormID} = $Self->{UploadCacheObject}->FormIDCreate();
    }

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get configitem id and class id
    my $ConfigItem = {};
    $ConfigItem->{ConfigItemID} = $Self->{ParamObject}->GetParam( Param => 'ConfigItemID' ) || 0;
    $ConfigItem->{ClassID}      = $Self->{ParamObject}->GetParam( Param => 'ClassID' )      || 0;
    my $DuplicateID = $Self->{ParamObject}->GetParam( Param => 'DuplicateID' ) || 0;

    my $HasAccess;

    # get needed data
    if ( $ConfigItem->{ConfigItemID} && $ConfigItem->{ConfigItemID} ne 'NEW' ) {

        # check access for config item
        $HasAccess = $Self->{ConfigItemObject}->Permission(
            Scope  => 'Item',
            ItemID => $ConfigItem->{ConfigItemID},
            UserID => $Self->{UserID},
            Type   => $Self->{Config}->{Permission},
        );

        # get config item
        $ConfigItem = $Self->{ConfigItemObject}->ConfigItemGet(
            ConfigItemID => $ConfigItem->{ConfigItemID},
        );
    }
    elsif ($DuplicateID) {

        # get config item to duplicate
        $ConfigItem = $Self->{ConfigItemObject}->ConfigItemGet(
            ConfigItemID => $DuplicateID,
        );

        # check access for config item
        $HasAccess = $Self->{ConfigItemObject}->Permission(
            Scope  => 'Item',
            ItemID => $ConfigItem->{ConfigItemID},
            UserID => $Self->{UserID},
            Type   => $Self->{Config}->{Permission},
        );

        # set config item id and number
        $ConfigItem->{ConfigItemID} = 'NEW';
        $ConfigItem->{Number}       = 'NEW';
    }
    elsif ( $ConfigItem->{ClassID} ) {

        # set config item id and number
        $ConfigItem->{ConfigItemID} = 'NEW';
        $ConfigItem->{Number}       = 'NEW';

        # check access for config item
        $HasAccess = $Self->{ConfigItemObject}->Permission(
            Scope   => 'Class',
            ClassID => $ConfigItem->{ClassID},
            UserID  => $Self->{UserID},
            Type    => $Self->{Config}->{Permission},
        );

        # get class list
        my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
            Class => 'ITSM::ConfigItem::Class',
        );
        $ConfigItem->{Class} = $ClassList->{ $ConfigItem->{ClassID} };
    }
    else {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => 'No ConfigItemID, DuplicateID or ClassID is given!',
            Comment => 'Please contact the admin.',
        );
    }

    # if user has no access rights show error page
    if ( !$HasAccess ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => 'No access is given!',
            Comment => 'Please contact the admin.',
        );
    }

    # get definition
    my $XMLDefinition = $Self->{ConfigItemObject}->DefinitionGet(
        ClassID => $ConfigItem->{ClassID},
    );

    # abort, if no definition is defined
    if ( !$XMLDefinition->{DefinitionID} ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => "No Definition was defined for class $ConfigItem->{Class}!",
            Comment => 'Please contact the admin.',
        );
    }

    # when there's no ClassID it means, an existing config item is edited as the ClassID is only
    # provided as GET param when creating a new config item
    if ( !$Self->{ParamObject}->GetParam( Param => 'ClassID' ) ) {

        # get all attachments meta data
        my @ExistingAttachments = $Self->{ConfigItemObject}->ConfigItemAttachmentList(
            ConfigItemID => $ConfigItem->{ConfigItemID},
        );

        # copy all existing attachments to upload cache
        FILENAME:
        for my $Filename (@ExistingAttachments) {

            # get the existing attachment data
            my $AttachmentData = $Self->{ConfigItemObject}->ConfigItemAttachmentGet(
                ConfigItemID => $ConfigItem->{ConfigItemID},
                Filename     => $Filename,
                UserID       => $Self->{UserID},
            );

            # add attachment to the upload cache
            $Self->{UploadCacheObject}->FormIDAddFile(
                FormID      => $Self->{FormID},
                Filename    => $AttachmentData->{Filename},
                Content     => $AttachmentData->{Content},
                ContentType => $AttachmentData->{ContentType},
            );
        }
    }

    # get submit save
    my $SubmitSave = $Self->{ParamObject}->GetParam( Param => 'SubmitSave' );

    # get xml data
    my $Version = {};
    my $NameDuplicates;
    my $CINameRegexErrorMessage;
    if ( $Self->{Subaction} eq 'VersionSave' ) {

        # check if an attachment must be deleted
        ATTACHMENT:
        for my $Number ( 1 .. 32 ) {

            # check if the delete button was pressed for this attachment
            my $Delete = $Self->{ParamObject}->GetParam( Param => "AttachmentDelete$Number" );

            # check next attachment if it was not pressed
            next ATTACHMENT if !$Delete;

            # remove the attachment from the upload cache
            $Self->{UploadCacheObject}->FormIDRemoveFile(
                FormID => $Self->{FormID},
                FileID => $Number,
            );
        }

        # check if there was an attachment upload
        if ( $Self->{ParamObject}->GetParam( Param => 'AttachmentUpload' ) ) {

            # get the uploaded attachment
            my %UploadStuff = $Self->{ParamObject}->GetUploadAll(
                Param  => 'FileUpload',
                Source => 'string',
            );

            # add attachment to the upload cache
            $Self->{UploadCacheObject}->FormIDAddFile(
                FormID => $Self->{FormID},
                %UploadStuff,
            );
        }

        my $AllRequired = 1;

        # get general form data
        for my $FormParam (qw(Name DeplStateID InciStateID)) {
            $Version->{$FormParam} = $Self->{ParamObject}->GetParam( Param => $FormParam );
            if ( !$Version->{$FormParam} ) {
                $AllRequired = 0;
            }
        }

        # get xml form data
        $Version->{XMLData}->[1]->{Version}->[1] = $Self->_XMLFormGet(
            XMLDefinition => $XMLDefinition->{DefinitionRef},
            AllRequired   => \$AllRequired,
            ConfigItemID  => $ConfigItem->{ConfigItemID},
        );

        # check, whether the feature to check for a unique name is enabled
        if (
            IsStringWithData( $Version->{Name} )
            && $Self->{ConfigObject}->Get('UniqueCIName::EnableUniquenessCheck')
            )
        {

            if ( $Self->{ConfigObject}->{Debug} > 0 ) {
                $Self->{LogObject}->Log(
                    Priority => 'debug',
                    Message  => "Checking for duplicate names (ClassID: $ConfigItem->{ClassID}, "
                        . "Name: $Version->{Name}, ConfigItemID: $ConfigItem->{ConfigItemID})",
                );
            }

            $NameDuplicates = $Self->{ConfigItemObject}->UniqueNameCheck(
                ConfigItemID => $ConfigItem->{ConfigItemID},
                ClassID      => $ConfigItem->{ClassID},
                Name         => $Version->{Name},
            );

            # stop processing if the name is not unique
            if ( IsArrayRefWithData($NameDuplicates) ) {

                $AllRequired = 0;

                # build a string of all duplicate IDs
                my $NameDuplicatesString = join ', ', @{$NameDuplicates};

                $Self->{LogObject}->Log(
                    Priority => 'error',
                    Message =>
                        "The name $Version->{Name} is already in use by the ConfigItemID(s): "
                        . $NameDuplicatesString,
                );
            }
        }

        # get the config option for the name regex checks
        my $CINameRegexConfig = $Self->{ConfigObject}->Get("ITSMConfigItem::CINameRegex");

        # check if the CI name is given and should be checked with a regular expression
        if ( IsStringWithData( $Version->{Name} ) && $CINameRegexConfig ) {

            # get class list
            my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
                Class => 'ITSM::ConfigItem::Class',
            );

            # get the class name
            my $ClassName = $ClassList->{ $ConfigItem->{ClassID} } || '';

            # get the regex for this class
            my $CINameRegex = $CINameRegexConfig->{ $ClassName . '::' . 'CINameRegex' } || '';

            # if a regex is defined and the CI name does not match the regular expression
            if ( $CINameRegex && $Version->{Name} !~ m{ $CINameRegex }xms ) {

                $AllRequired = 0;

                # get the error message for this class
                $CINameRegexErrorMessage
                    = $CINameRegexConfig->{ $ClassName . '::' . 'CINameRegexErrorMessage' } || '';
            }
        }

        # save version to database
        if ( $SubmitSave && $AllRequired ) {

            if ( $ConfigItem->{ConfigItemID} eq 'NEW' ) {
                $ConfigItem->{ConfigItemID} = $Self->{ConfigItemObject}->ConfigItemAdd(
                    ClassID => $ConfigItem->{ClassID},
                    UserID  => $Self->{UserID},
                );
            }

            # get all attachments from upload cache
            my @Attachments = $Self->{UploadCacheObject}->FormIDGetAllFilesData(
                FormID => $Self->{FormID},
            );

            # build a lookup lookup hash of the new attachments
            my %NewAttachment;
            for my $Attachment (@Attachments) {

                # the key is the filename + filesize + content type
                my $Key = $Attachment->{Filename}
                    . $Attachment->{Filesize}
                    . $Attachment->{ContentType};

                # store all of the new attachment data
                $NewAttachment{$Key} = $Attachment;
            }

            # get all attachments meta data
            my @ExistingAttachments = $Self->{ConfigItemObject}->ConfigItemAttachmentList(
                ConfigItemID => $ConfigItem->{ConfigItemID},
            );

            # check the existing attachments
            FILENAME:
            for my $Filename (@ExistingAttachments) {

                # get the existing attachment data
                my $AttachmentData = $Self->{ConfigItemObject}->ConfigItemAttachmentGet(
                    ConfigItemID => $ConfigItem->{ConfigItemID},
                    Filename     => $Filename,
                    UserID       => $Self->{UserID},
                );

                # the key is the filename + filesize + content type
                # (no content id, as existing attachments don't have it)
                my $Key = $AttachmentData->{Filename}
                    . $AttachmentData->{Filesize}
                    . $AttachmentData->{ContentType};

                # attachment is already existing, we can delete it from the new attachment hash
                if ( $NewAttachment{$Key} ) {
                    delete $NewAttachment{$Key};
                }

                # existing attachment is no longer in new attachments hash
                else {

                    # delete the existing attachment
                    my $DeleteSuccessful = $Self->{ConfigItemObject}->ConfigItemAttachmentDelete(
                        ConfigItemID => $ConfigItem->{ConfigItemID},
                        Filename     => $Filename,
                        UserID       => $Self->{UserID},
                    );

                    # check error
                    if ( !$DeleteSuccessful ) {
                        return $Self->{LayoutObject}->FatalError();
                    }
                }
            }

            # write the new attachments
            ATTACHMENT:
            for my $Attachment ( values %NewAttachment ) {

                # add attachment
                my $Success = $Self->{ConfigItemObject}->ConfigItemAttachmentAdd(
                    %{$Attachment},
                    ConfigItemID => $ConfigItem->{ConfigItemID},
                    UserID       => $Self->{UserID},
                );

                # check error
                if ( !$Success ) {
                    return $Self->{LayoutObject}->FatalError();
                }
            }

            # add version
            $Self->{ConfigItemObject}->VersionAdd(
                %{$Version},
                ConfigItemID => $ConfigItem->{ConfigItemID},
                DefinitionID => $XMLDefinition->{DefinitionID},
                UserID       => $Self->{UserID},
            );

            # redirect to zoom mask
            my $ScreenType = $Self->{ParamObject}->GetParam( Param => 'ScreenType' ) || 0;
            if ($ScreenType) {
                return $Self->{LayoutObject}->PopupClose(
                    URL =>
                        "Action=AgentITSMConfigItemZoom;ConfigItemID=$ConfigItem->{ConfigItemID}",
                );
            }
            else {
                return $Self->{LayoutObject}->Redirect(
                    OP => "Action=AgentITSMConfigItemZoom;ConfigItemID=$ConfigItem->{ConfigItemID}",
                );
            }
        }
    }
    elsif ($DuplicateID) {
        my $VersionID = $Self->{ParamObject}->GetParam( Param => 'VersionID' );
        if ($VersionID) {

            # get version data to duplicate config item
            $Version = $Self->{ConfigItemObject}->VersionGet(
                VersionID => $VersionID,
            );
        }
        else {

            # get last version data to duplicate config item
            $Version = $Self->{ConfigItemObject}->VersionGet(
                ConfigItemID => $DuplicateID,
            );
        }
    }
    elsif ( $ConfigItem->{ConfigItemID} ne 'NEW' ) {

        # get last version data
        $Version = $Self->{ConfigItemObject}->VersionGet(
            ConfigItemID => $ConfigItem->{ConfigItemID},
        );
    }

    my %XMLFormOutputParam;
    if ( $Version->{XMLData}->[1]->{Version}->[1] ) {
        $XMLFormOutputParam{XMLData} = $Version->{XMLData}->[1]->{Version}->[1];
    }

    # output deployment state invalid block
    my $RowNameInvalid = '';
    if ( !$Version->{Name} && $Self->{Subaction} eq 'VersionSave' && $SubmitSave ) {
        $RowNameInvalid = 'ServerError';
    }

    # check for name duplicates
    if ( IsArrayRefWithData($NameDuplicates) ) {
        $RowNameInvalid = 'ServerError';
    }

    # check for not matched name regex
    if ($CINameRegexErrorMessage) {
        $RowNameInvalid = 'ServerError';
    }

    # output name block
    $Self->{LayoutObject}->Block(
        Name => 'RowName',
        Data => {
            %{$Version},
            RowNameInvalid => $RowNameInvalid,
        },
    );

    if (
        IsStringWithData($RowNameInvalid)
        && !IsArrayRefWithData($NameDuplicates)
        && !$CINameRegexErrorMessage
        )
    {

        if ( $Self->{ConfigObject}->{Debug} > 0 ) {
            $Self->{LogObject}->Log(
                Priority => 'debug',
                Message  => "Rendering default error block",
            );
        }

        $Self->{LayoutObject}->Block(
            Name => 'RowNameErrorDefault',
        );
    }
    elsif ( IsArrayRefWithData($NameDuplicates) ) {

        # build array with CI-Numbers
        my @NameDuplicatesByCINumber;
        for my $ConfigItemID ( @{$NameDuplicates} ) {

            # lookup the CI number
            my $CINumber = $Self->{ConfigItemObject}->ConfigItemLookup(
                ConfigItemID => $ConfigItemID,
            );

            push @NameDuplicatesByCINumber, $CINumber;
        }

        my $DuplicateString = join ', ', @NameDuplicatesByCINumber;

        if ( $Self->{ConfigObject}->{Debug} > 0 ) {
            $Self->{LogObject}->Log(
                Priority => 'debug',
                Message =>
                    "Rendering block for duplicates (CI-Numbers: $DuplicateString) error message",
            );
        }

        $Self->{LayoutObject}->Block(
            Name => 'RowNameErrorDuplicates',
            Data => {
                Duplicates => $DuplicateString,
            },
        );
    }

    elsif ($CINameRegexErrorMessage) {

        $Self->{LayoutObject}->Block(
            Name => 'RowNameErrorRegEx',
            Data => {
                RegExErrorMessage => $CINameRegexErrorMessage,
            },
        );
    }

    # get deployment state list
    my $DeplStateList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::DeploymentState',
    );

    # output deployment state invalid block
    my $RowDeplStateInvalid = '';
    if ( !$Version->{DeplStateID} && $Self->{Subaction} eq 'VersionSave' && $SubmitSave ) {
        $RowDeplStateInvalid = ' ServerError';
    }

    # generate DeplStateOptionStrg
    my $DeplStateOptionStrg = $Self->{LayoutObject}->BuildSelection(
        Data         => $DeplStateList,
        Name         => 'DeplStateID',
        PossibleNone => 1,
        Class        => 'Validate_Required' . $RowDeplStateInvalid,
        SelectedID   => $Version->{DeplStateID},
    );

    # output deployment state block
    $Self->{LayoutObject}->Block(
        Name => 'RowDeplState',
        Data => {
            DeplStateOptionStrg => $DeplStateOptionStrg,
        },
    );

    # get incident state list
    my $InciStateList = $Self->{GeneralCatalogObject}->ItemList(
        Class       => 'ITSM::Core::IncidentState',
        Preferences => {
            Functionality => [ 'operational', 'incident' ],
        },
    );

    # output deployment state invalid block
    my $RowInciStateInvalid = '';
    if ( !$Version->{InciStateID} && $Self->{Subaction} eq 'VersionSave' && $SubmitSave ) {
        $RowInciStateInvalid = ' ServerError';
    }

    # generate InciStateOptionStrg
    my $InciStateOptionStrg = $Self->{LayoutObject}->BuildSelection(
        Data         => $InciStateList,
        Name         => 'InciStateID',
        PossibleNone => 1,
        Class        => 'Validate_Required' . $RowInciStateInvalid,
        SelectedID   => $Version->{InciStateID},
    );

    # output incident state block
    $Self->{LayoutObject}->Block(
        Name => 'RowInciState',
        Data => {
            InciStateOptionStrg => $InciStateOptionStrg,
        },
    );

    # output xml form
    if ( $XMLDefinition->{Definition} ) {
        $Self->_XMLFormOutput(
            XMLDefinition => $XMLDefinition->{DefinitionRef},
            %XMLFormOutputParam,
        );
    }

    # show the attachment upload button
    $Self->{LayoutObject}->Block(
        Name => 'AttachmentUpload',
        Data => {%Param},
    );

    # get all attachments meta data
    my @Attachments = $Self->{UploadCacheObject}->FormIDGetAllFilesMeta(
        FormID => $Self->{FormID},
    );

    # show attachments
    ATTACHMENT:
    for my $Attachment (@Attachments) {
        $Self->{LayoutObject}->Block(
            Name => 'Attachment',
            Data => $Attachment,
        );
    }

    my $Output = '';
    if ( ( $ConfigItem->{ConfigItemID} && $ConfigItem->{ConfigItemID} ne 'NEW' ) || $DuplicateID ) {

        # output block
        $Self->{LayoutObject}->Block(
            Name => 'StartSmall',
            Data => {
                %Param,
                %{$ConfigItem},
            },
        );
        $Self->{LayoutObject}->Block( Name => 'EndSmall' );

        # output header
        $Output .= $Self->{LayoutObject}->Header(
            Title => 'Edit',
            Type  => 'Small',
        );

        # start template output
        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AgentITSMConfigItemEdit',
            Data         => {
                %Param,
                %{$ConfigItem},
                DuplicateID => $DuplicateID,
                FormID      => $Self->{FormID},
            },
        );
        $Output .= $Self->{LayoutObject}->Footer( Type => 'Small' );
    }
    else {

        # Necessary stuff for Add New
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

        # generate ClassOptionStrg
        my $ClassOptionStrg = $Self->{LayoutObject}->BuildSelection(
            Data         => $ClassList,
            Name         => 'ClassID',
            PossibleNone => 1,
            Translation  => 0,
            Class        => 'W100pc',
            SelectedID   => $ConfigItem->{ClassID},
        );

        # End Necessary stuff for Add New

        # output block
        $Self->{LayoutObject}->Block(
            Name => 'StartNormal',
            Data => {
                ClassOptionStrg => $ClassOptionStrg,
                %Param,
                %{$ConfigItem},
            },
        );

        $Self->{LayoutObject}->Block( Name => 'EndNormal' );

        # output header
        $Output .= $Self->{LayoutObject}->Header( Title => 'Edit' );
        $Output .= $Self->{LayoutObject}->NavigationBar();

        # start template output
        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AgentITSMConfigItemEdit',
            Data         => {
                %Param,
                %{$ConfigItem},
                DuplicateID => $DuplicateID,
                FormID      => $Self->{FormID},
            },
        );
        $Output .= $Self->{LayoutObject}->Footer();
    }

    return $Output;
}

sub _XMLFormGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if !$Param{AllRequired};
    return if ref $Param{XMLDefinition} ne 'ARRAY';
    return if ref $Param{AllRequired} ne 'SCALAR';
    return if !$Param{ConfigItemID};

    my $FormData = {};

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {
        my $CounterInsert = 1;

        COUNTER:
        for my $Counter ( 1 .. $Item->{CountMax} ) {

            # create inputkey and addkey
            my $InputKey = $Item->{Key} . '::' . $Counter;
            my $AddKey   = $Item->{Key} . '::Add';
            if ( $Param{Prefix} ) {
                $InputKey = $Param{Prefix} . '::' . $InputKey;
                $AddKey   = $Param{Prefix} . '::' . $AddKey;
            }

            # get param
            my $FormValues = $Self->{LayoutObject}->ITSMConfigItemFormDataGet(
                Key          => $InputKey,
                Item         => $Item,
                ConfigItemID => $Param{ConfigItemID},
            );

            if ( defined $FormValues->{Value} ) {

                # check required value
                if ( $FormValues->{Invalid} ) {
                    ${ $Param{AllRequired} } = 0;
                }

                # check delete button
                next COUNTER if $Self->{ParamObject}->GetParam( Param => $InputKey . '::Delete' );

                # start recursion, if "Sub" was found
                if ( $Item->{Sub} ) {
                    my $SubFormData = $Self->_XMLFormGet(
                        XMLDefinition => $Item->{Sub},
                        Prefix        => $InputKey,
                        AllRequired   => $Param{AllRequired},
                        ConfigItemID  => $Param{ConfigItemID},
                    );
                    $FormData->{ $Item->{Key} }->[$CounterInsert] = $SubFormData;
                }
                $FormData->{ $Item->{Key} }->[$CounterInsert]->{Content} = $FormValues->{Value};
                $CounterInsert++;
            }
            else {

                # check add button
                if ( $Self->{ParamObject}->GetParam( Param => $AddKey ) ) {
                    if ( $Item->{Sub} ) {
                        $FormData->{ $Item->{Key} }->[$CounterInsert] = $Self->_XMLDefaultSet(
                            XMLDefinition => $Item->{Sub},
                        );
                    }
                    $FormData->{ $Item->{Key} }->[$CounterInsert]->{Content} = '';
                }
                last COUNTER;
            }
        }
    }

    return $FormData;
}

sub _XMLDefaultSet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if ref $Param{XMLDefinition} ne 'ARRAY';

    my $DefaultData = {};

    for my $Item ( @{ $Param{XMLDefinition} } ) {
        for my $Counter ( 1 .. $Item->{CountDefault} ) {

            # start recursion, if "Sub" was found
            if ( $Item->{Sub} ) {
                $DefaultData->{ $Item->{Key} }->[$Counter] = $Self->_XMLDefaultSet(
                    XMLDefinition => $Item->{Sub},
                );
            }

            $DefaultData->{ $Item->{Key} }->[$Counter]->{Content} = '';
        }
    }

    return $DefaultData;
}

sub _XMLFormOutput {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if ref $Param{XMLDefinition} ne 'ARRAY';

    $Param{Level}  ||= 0;
    $Param{Prefix} ||= '';

    # get submit save
    my $SubmitSave = $Self->{ParamObject}->GetParam( Param => 'SubmitSave' );

    # set data present mode
    my $DataPresentMode = 0;
    if ( $Param{XMLData} && ref $Param{XMLData} eq 'HASH' ) {
        $DataPresentMode = 1;
    }

    my $ItemCounter = 1;
    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {

        # set loop
        my $Loop = $Item->{CountDefault};
        if ($DataPresentMode) {
            $Loop = 0;

            # search the last content
            COUNTER:
            for my $Counter ( 1 .. $Item->{CountMax} ) {
                last COUNTER if !defined $Param{XMLData}->{ $Item->{Key} }->[$Counter]->{Content};
                $Loop = $Counter;
            }

            # set absolut minimum
            if ( $Loop < $Item->{CountMin} ) {
                $Loop = $Item->{CountMin};
            }
        }

        # set delete
        my $Delete = 0;
        if ( $Loop > $Item->{CountMin} ) {
            $Delete = 1;
        }

        # output content rows
        for my $Counter ( 1 .. $Loop ) {

            # output row block
            $Self->{LayoutObject}->Block( Name => 'XMLRow' );

            if ( !$Param{Level} ) {
                $Self->{LayoutObject}->Block( Name => 'XMLRowFieldsetStart' );
            }

            # create inputkey and addkey
            my $InputKey = $Item->{Key} . '::' . $Counter;
            if ( $Param{Prefix} ) {
                $InputKey = $Param{Prefix} . '::' . $InputKey;
            }

            # output blue required star
            my $XMLRowValueContentRequired = 0;
            my $LabelClass                 = '';
            if ( $Item->{Input}->{Required} ) {
                $XMLRowValueContentRequired = 1;
                $LabelClass                 = 'Mandatory';
            }

            # output red invalid star
            my $XMLRowValueContentInvalid = 0;
            if ( $Item->{Form}->{$InputKey}->{Invalid} && $SubmitSave ) {
                $XMLRowValueContentInvalid = 1;
            }

            my $ItemID = 'Item' . $ItemCounter++ . $Param{Prefix} . $Param{Level};

            if ( $Item->{Input}->{Type} eq 'Customer' ) {

                $Self->{LayoutObject}->Block(
                    Name => 'CustomerSearchInit',
                    Data => {
                        ItemID => $ItemID,
                    },
                );
            }

            # create input element
            my $InputString = $Self->{LayoutObject}->ITSMConfigItemInputCreate(
                Key      => $InputKey,
                Item     => $Item,
                Value    => $Param{XMLData}->{ $Item->{Key} }->[$Counter]->{Content},
                ItemId   => $ItemID,
                Required => $XMLRowValueContentRequired,
                Invalid  => $XMLRowValueContentInvalid,
            );

            # ID?
            my $LabelFor = $ItemID;
            if ( $Item->{Input}->{Type} eq 'Date' || $Item->{Input}->{Type} eq 'DateTime' ) {
                $LabelFor = '';
            }

            # id needed?
            if ($LabelFor) {
                $LabelFor = 'for="' . $LabelFor . '"';
            }

            # is this a sub field?
            my $Class = '';
            if ( $Param{Level} ) {
                $Class = 'SubElement';
            }

            # class needed?
            if ($LabelClass) {
                $LabelClass = 'class="' . "$Class  $LabelClass" . '"';
            }
            else {
                $LabelClass = 'class="' . $Class . '"';
            }

            # output row value content block
            $Self->{LayoutObject}->Block(
                Name => 'XMLRowValue',
                Data => {
                    Name        => $Item->{Name},
                    ItemID      => $ItemID,
                    LabelFor    => $LabelFor || '',
                    Description => $Item->{Description} || $Item->{Name},
                    InputString => $InputString,
                    LabelClass  => $LabelClass || '',
                    Class       => $Class || '',
                },
            );

            if ( $Item->{Input}->{Required} ) {
                $Self->{LayoutObject}->Block( Name => 'XMLRowValueContentRequired' );
            }

            # output delete button
            if ($Delete) {
                $Self->{LayoutObject}->Block(
                    Name => 'XMLRowValueContentDelete',
                    Data => {
                        InputKey => $InputKey,
                    },
                );
            }

            # the content is invalid
            if ($XMLRowValueContentInvalid) {

                # show regex error message block
                if ( $Item->{Form}->{$InputKey}->{RegExErrorMessage} ) {

                    $Self->{LayoutObject}->Block(
                        Name => 'XMLRowValueRegExError',
                        Data => {
                            ItemID            => $ItemID,
                            RegExErrorMessage => $Item->{Form}->{$InputKey}->{RegExErrorMessage},
                        },
                    );
                }

                # otherwise show normal server error block
                else {
                    $Self->{LayoutObject}->Block(
                        Name => 'XMLRowValueServerError',
                        Data => {
                            ItemID => $ItemID,
                        },
                    );
                }
            }

            # start recursion, if "Sub" was found
            if ( $Item->{Sub} ) {
                my %XMLFormOutputParam;
                if (
                    $DataPresentMode
                    && defined $Param{XMLData}->{ $Item->{Key} }->[$Counter]->{Content}
                    )
                {
                    $XMLFormOutputParam{XMLData} = $Param{XMLData}->{ $Item->{Key} }->[$Counter];
                }

                $Self->_XMLFormOutput(
                    XMLDefinition => $Item->{Sub},
                    %XMLFormOutputParam,
                    Level  => $Param{Level} + 1,
                    Prefix => $InputKey,
                );
            }

            if ( !$Param{Level} ) {
                $Self->{LayoutObject}->Block( Name => 'XMLRowFieldsetEnd' );
            }

            # output row to sort rows correctly
            $Self->{LayoutObject}->Block( Name => 'XMLRow' );
        }

        # output add button
        if ( $Loop < $Item->{CountMax} ) {

            # if no item should be shown we need to show the add button
            # and therefore we need to show the XMLRow block
            if ( !$Loop ) {
                $Self->{LayoutObject}->Block( Name => 'XMLRow' );
            }

            my $Class = '';
            if ( $Param{Level} ) {
                $Class = 'class="SubElement"';
            }
            else {
                $Self->{LayoutObject}->Block( Name => 'XMLRowFieldsetEnd' );
                $Self->{LayoutObject}->Block( Name => 'XMLRowFieldsetStart' );
            }

            # set prefix
            my $InputKey = $Item->{Key};
            if ( $Param{Prefix} ) {
                $InputKey = $Param{Prefix} . '::' . $InputKey;
            }

            # output row add content block
            $Self->{LayoutObject}->Block(
                Name => 'XMLRowAddContent',
                Data => {
                    ItemID      => $InputKey . 'Add',
                    Name        => $Item->{Name},
                    Description => $Item->{Description} || $Item->{Name},
                    InputKey    => $InputKey,
                    Class       => $Class,
                },
            );
        }
    }

    return 1;
}

1;
