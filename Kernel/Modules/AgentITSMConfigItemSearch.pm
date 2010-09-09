# --
# Kernel/Modules/AgentITSMConfigItemSearch.pm - the OTRS::ITSM config item search module
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: AgentITSMConfigItemSearch.pm,v 1.14 2010-09-09 22:29:50 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMConfigItemSearch;

use strict;
use warnings;

use Kernel::System::ITSMConfigItem;
use Kernel::System::GeneralCatalog;
use Kernel::System::SearchProfile;
use Kernel::System::CSV;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.14 $) [1];

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
    $Self->{SearchProfileObject}  = Kernel::System::SearchProfile->new(%Param);
    $Self->{CSVObject}            = Kernel::System::CSV->new(%Param);

    # get config of frontend module
    $Self->{Config} = $Self->{ConfigObject}->Get("ITSMConfigItem::Frontend::$Self->{Action}");

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;
    my $Output;

    # get config data
    $Self->{StartHit} = int( $Self->{ParamObject}->GetParam( Param => 'StartHit' ) || 1 );
    $Self->{SearchLimit} = $Self->{Config}->{SearchLimit} || 500;
    $Self->{Profile}        = $Self->{ParamObject}->GetParam( Param => 'Profile' )        || '';
    $Self->{SaveProfile}    = $Self->{ParamObject}->GetParam( Param => 'SaveProfile' )    || '';
    $Self->{TakeLastSearch} = $Self->{ParamObject}->GetParam( Param => 'TakeLastSearch' ) || '';

    # get class list
    my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    # check for access rights on the classes
    for my $ClassID ( keys %{$ClassList} ) {
        my $HasAccess = $Self->{ConfigItemObject}->Permission(
            Type    => $Self->{Config}->{Permission},
            Scope   => 'Class',
            ClassID => $ClassID,
            UserID  => $Self->{UserID},
        );

        delete $ClassList->{$ClassID} if !$HasAccess;
    }

    # get class id
    my $ClassID = $Self->{ParamObject}->GetParam( Param => 'ClassID' );

    # ------------------------------------------------------------ #
    # delete search profiles
    # ------------------------------------------------------------ #
    if ( $Self->{Subaction} eq 'AJAXProfileDelete' ) {
        my $Profile = $Self->{ParamObject}->GetParam( Param => 'Profile' );

        # remove old profile stuff
        $Self->{SearchProfileObject}->SearchProfileDelete(
            Base      => 'ConfigItemSearch' . $ClassID,
            Name      => $Profile,
            UserLogin => $Self->{UserLogin},
        );
        my $Output = $Self->{LayoutObject}->JSONEncode(
            Data => 1,
        );
        return $Self->{LayoutObject}->Attachment(
            NoCache     => 1,
            ContentType => 'text/html',
            Content     => $Output,
            Type        => 'inline'
        );
    }

    # ------------------------------------------------------------ #
    # init search dialog (select class)
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'AJAX' ) {

        # attributes used for searching and for restoring previous input
        my %GetParam;

        my $Profile = $Self->{ParamObject}->GetParam( Param => 'Profile' );

        # generate dropdown for selecting the class
        # automatically show search mask after selecting a class via AJAX
        my $ClassOptionStrg = $Self->{LayoutObject}->BuildSelection(
            Data         => $ClassList,
            Name         => 'SearchClassID',
            PossibleNone => 1,
            SelectedID   => $ClassID || '',
            Translation  => 0,
        );

        # html search mask output
        $Self->{LayoutObject}->Block(
            Name => 'SearchAJAX',
            Data => {
                ClassOptionStrg => $ClassOptionStrg,
                Profile         => $Profile,
            },
        );

        # output template
        $Output = $Self->{LayoutObject}->Output(
            TemplateFile => 'AgentITSMConfigItemSearch',
        );

        return $Output;
    }

    # ------------------------------------------------------------ #
    # set sesarch fields for selected class
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'AJAXUpdate' ) {

        # ClassID is required for the search mask and for actual searching
        if ( !$ClassID ) {
            return $Self->{LayoutObject}->ErrorScreen(
                Message => 'No ClassID is given!',
                Comment => 'Please contact the admin.',
            );
        }

        # check if user is allowed to search class
        my $HasAccess = $Self->{ConfigItemObject}->Permission(
            Type    => $Self->{Config}->{Permission},
            Scope   => 'Class',
            ClassID => $ClassID,
            UserID  => $Self->{UserID},
        );

        # show error screen
        if ( !$HasAccess ) {
            return $Self->{LayoutObject}->ErrorScreen(
                Message => 'No access rights for this class given!',
                Comment => 'Please contact the admin.',
            );
        }

        # get current definition
        my $XMLDefinition = $Self->{ConfigItemObject}->DefinitionGet(
            ClassID => $ClassID,
        );

        # abort, if no definition is defined
        if ( !$XMLDefinition->{DefinitionID} ) {
            return $Self->{LayoutObject}->ErrorScreen(
                Message => "No Definition was defined for class $ClassID!",
                Comment => 'Please contact the admin.',
            );
        }

        my @XMLAttributes = [
            {
                Key   => 'Number',
                Value => 'Number',
            },
            {
                Key   => 'Name',
                Value => 'Name',
            },
            {
                Key   => 'DeplStateIDs',
                Value => 'Deployment State',
            },
            {
                Key   => 'InciStateIDs',
                Value => 'Incident State',
            },
        ];

        my $Profile = $Self->{ParamObject}->GetParam( Param => 'Profile' );

        my %GetParam = $Self->{SearchProfileObject}->SearchProfileGet(
            Base      => 'ConfigItemSearch' . $ClassID,
            Name      => $Profile,
            UserLogin => $Self->{UserLogin},
        );

        # get attributes to include in attributes string
        if ( $XMLDefinition->{Definition} ) {
            $Self->_XMLSearchAttributesGet(
                XMLDefinition => $XMLDefinition->{DefinitionRef},
                XMLAttributes => @XMLAttributes,
            );
        }

        # build attributes string for attributes list
        $Param{AttributesStrg} = $Self->{LayoutObject}->BuildSelection(
            Data     => @XMLAttributes,
            Name     => 'Attribute',
            Multiple => 0,
        );

        # build attributes string for recovery on add or subtract search fields
        $Param{AttributesOrigStrg} = $Self->{LayoutObject}->BuildSelection(
            Data     => @XMLAttributes,
            Name     => 'AttributeOrig',
            Multiple => 0,
        );

        my %Profiles = $Self->{SearchProfileObject}->SearchProfileList(
            Base      => 'ConfigItemSearch' . $ClassID,
            UserLogin => $Self->{UserLogin},
        );

        delete $Profiles{''};
        $Profiles{'last-search'} = '-';
        $Param{ProfilesStrg} = $Self->{LayoutObject}->BuildSelection(
            Data       => \%Profiles,
            Name       => 'Profile',
            SelectedID => $Profile,
        );

        # get deployment state list
        my $DeplStateList = $Self->{GeneralCatalogObject}->ItemList(
            Class => 'ITSM::ConfigItem::DeploymentState',
        );

        # generate dropdown for selecting the wanted deployment states
        my $CurDeplStateOptionStrg = $Self->{LayoutObject}->BuildSelection(
            Data       => $DeplStateList,
            Name       => 'DeplStateIDs',
            SelectedID => $GetParam{DeplStateIDs} || [],
            Size       => 5,
            Multiple   => 1,
        );

        # get incident state list
        my $InciStateList = $Self->{GeneralCatalogObject}->ItemList(
            Class => 'ITSM::Core::IncidentState',
        );

        # generate dropdown for selecting the wanted incident states
        my $CurInciStateOptionStrg = $Self->{LayoutObject}->BuildSelection(
            Data       => $InciStateList,
            Name       => 'InciStateIDs',
            SelectedID => $GetParam{InciStateIDs} || [],
            Size       => 5,
            Multiple   => 1,
        );

        # generate PreviousVersionOptionStrg
        my $PreviousVersionOptionStrg = $Self->{LayoutObject}->BuildSelection(
            Name => 'PreviousVersionSearch',
            Data => {
                0 => 'No',
                1 => 'Yes',
            },
            SelectedID => $GetParam{PreviousVersionSearch} || '0',
        );

        # build output format string
        $Param{ResultFormStrg} = $Self->{LayoutObject}->BuildSelection(
            Data => {
                Normal => 'Normal',
                Print  => 'Print',
                CSV    => 'CSV',
            },
            Name => 'ResultForm',
            SelectedID => $GetParam{ResultForm} || 'Normal',
        );

        $Self->{LayoutObject}->Block(
            Name => 'AJAXContent',
            Data => {
                ClassID                   => $ClassID,
                AttributesStrg            => $Param{AttributesStrg},
                CurDeplStateOptionStrg    => $CurDeplStateOptionStrg,
                CurInciStateOptionStrg    => $CurInciStateOptionStrg,
                PreviousVersionOptionStrg => $PreviousVersionOptionStrg,
                AttributesStrg            => $Param{AttributesStrg},
                AttributesOrigStrg        => $Param{AttributesOrigStrg},
                ResultFormStrg            => $Param{ResultFormStrg},
                ProfilesStrg              => $Param{ProfilesStrg},
                Number                    => $GetParam{Number} || '',
                Name                      => $GetParam{Name} || '',
            },
        );

        # output xml search form
        if ( $XMLDefinition->{Definition} ) {
            $Self->_XMLSearchFormOutput(
                XMLDefinition => $XMLDefinition->{DefinitionRef},
                XMLAttributes => @XMLAttributes,
                GetParam      => \%GetParam,
            );
        }

        # show attributes
        my $AttributeIsUsed = 0;
        for my $Key ( sort keys %GetParam ) {
            next if !$Key;
            next if !defined $GetParam{$Key};
            next if $GetParam{$Key} eq '';

            $AttributeIsUsed = 1;
            $Self->{LayoutObject}->Block(
                Name => 'SearchAJAXShow',
                Data => {
                    Attribute => $Key,
                },
            );
        }

        # output template
        $Output = $Self->{LayoutObject}->Output(
            TemplateFile => 'AgentITSMConfigItemSearch',
        );

        return $Output;
    }

    # ------------------------------------------------------------ #
    # perform search
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'Search' ) {

        # fill up profile name (e.g. with last-search)
        if ( !$Self->{Profile} || !$Self->{SaveProfile} ) {
            $Self->{Profile} = 'last-search';
        }

        # store last queue screen
        my $URL
            = "Action=AgentITSMConfigItemSearch;Subaction=Search;Profile=$Self->{Profile};"
            . "TakeLastSearch=1;StartHit=$Self->{StartHit}";

        if ($ClassID) {
            $URL .= ";ClassID=$ClassID";
        }

        $Self->{SessionObject}->UpdateSessionID(
            SessionID => $Self->{SessionID},
            Key       => 'LastScreenOverview',
            Value     => $URL,
        );
        $Self->{SessionObject}->UpdateSessionID(
            SessionID => $Self->{SessionID},
            Key       => 'LastScreenView',
            Value     => $URL,
        );

        # ClassID is required for the search mask and for actual searching
        if ( !$ClassID ) {
            return $Self->{LayoutObject}->ErrorScreen(
                Message => 'No ClassID is given!',
                Comment => 'Please contact the admin.',
            );
        }

        # check if user is allowed to search class
        my $HasAccess = $Self->{ConfigItemObject}->Permission(
            Type    => $Self->{Config}->{Permission},
            Scope   => 'Class',
            ClassID => $ClassID,
            UserID  => $Self->{UserID},
        );

        # show error screen
        if ( !$HasAccess ) {
            return $Self->{LayoutObject}->ErrorScreen(
                Message => 'No access rights for this class given!',
                Comment => 'Please contact the admin.',
            );
        }

        # get current definition
        my $XMLDefinition = $Self->{ConfigItemObject}->DefinitionGet(
            ClassID => $ClassID,
        );

        # abort, if no definition is defined
        if ( !$XMLDefinition->{DefinitionID} ) {
            return $Self->{LayoutObject}->ErrorScreen(
                Message => "No Definition was defined for class $ClassID!",
                Comment => 'Please contact the admin.',
            );
        }

        # attributes used for searching and for restoring previous input
        my %GetParam;

        # get scalar search attributes
        FORMVALUE:
        for my $FormValue (qw(Number Name PreviousVersionSearch ResultForm)) {

            my $Value = $Self->{ParamObject}->GetParam( Param => $FormValue );

            next FORMVALUE if !$Value;

            $GetParam{$FormValue} = $Value;
        }

        # get array search attributes
        FORMARRAY:
        for my $FormArray (qw(DeplStateIDs InciStateIDs)) {

            my @Array = $Self->{ParamObject}->GetArray( Param => $FormArray );

            next FORMARRAY if !@Array;

            $GetParam{$FormArray} = \@Array;
        }

        # get xml search form
        my $XMLFormData = [];
        my $XMLGetParam = [];
        $Self->_XMLSearchFormGet(
            XMLDefinition => $XMLDefinition->{DefinitionRef},
            XMLFormData   => $XMLFormData,
            XMLGetParam   => $XMLGetParam,
        );

        if ( @{$XMLFormData} ) {
            $GetParam{What} = $XMLFormData;
        }

        # save search profile (under last-search or real profile name)
        $Self->{SaveProfile} = 1;

        # remember last search values
        if ( $Self->{SaveProfile} && $Self->{Profile} ) {

            # remove old profile stuff
            $Self->{SearchProfileObject}->SearchProfileDelete(
                Base      => 'ConfigItemSearch' . $ClassID,
                Name      => $Self->{Profile},
                UserLogin => $Self->{UserLogin},
            );

            # insert new profile params
            for my $Key ( keys %GetParam ) {
                if ( $GetParam{$Key} && $Key ne 'What' ) {
                    $Self->{SearchProfileObject}->SearchProfileAdd(
                        Base      => 'ConfigItemSearch' . $ClassID,
                        Name      => $Self->{Profile},
                        Key       => $Key,
                        Value     => $GetParam{$Key},
                        UserLogin => $Self->{UserLogin},
                    );
                }
            }

            # insert new profile params also from XMLform
            if ( @{$XMLGetParam} ) {
                for my $Parameter ( @{$XMLGetParam} ) {
                    for my $Key ( keys %{$Parameter} ) {
                        if ( $Parameter->{$Key} ) {
                            $Self->{SearchProfileObject}->SearchProfileAdd(
                                Base      => 'ConfigItemSearch' . $ClassID,
                                Name      => $Self->{Profile},
                                Key       => $Key,
                                Value     => $Parameter->{$Key},
                                UserLogin => $Self->{UserLogin},
                            );

                        }
                    }
                }
            }

        }

        # start search
        my $SearchResultList = $Self->{ConfigItemObject}->ConfigItemSearchExtended(
            %GetParam,
            ClassIDs => [$ClassID],
        );

        $GetParam{ResultForm} = $Self->{ParamObject}->GetParam( Param => 'ResultForm' );

        # CSV output
        if ( $GetParam{ResultForm} eq 'CSV' ) {
            my @CSVData;
            my @CSVHead = (
                'Class',
                'Incident State',
                'Name',
                'Number',
                'Deployment State',
                'Version',
                'Create Time',
            );

            CONFIGITEMID:
            for my $ConfigItemID ( @{$SearchResultList} ) {

                # check for access rights
                my $HasAccess = $Self->{ConfigItemObject}->Permission(
                    Scope  => 'Item',
                    ItemID => $ConfigItemID,
                    UserID => $Self->{UserID},
                    Type   => $Self->{Config}->{Permission},
                );

                next CONFIGITEMID if !$HasAccess;

                # get version
                my $LastVersion = $Self->{ConfigItemObject}->VersionGet(
                    ConfigItemID => $ConfigItemID,
                    XMLDataGet   => 0,
                );

                # store data
                my @Data;
                for (qw(Class InciState Name Number DeplState VersionID CreateTime)) {
                    push @Data, $LastVersion->{$_};
                }
                push @CSVData, \@Data;
            }

            my $CSV = $Self->{CSVObject}->Array2CSV(
                Head      => \@CSVHead,
                Data      => \@CSVData,
                Separator => $Self->{UserCSVSeparator},
            );

            # return csv to download
            my $CSVFile = 'configitem_search';
            my ( $s, $m, $h, $D, $M, $Y ) = $Self->{TimeObject}->SystemTime2Date(
                SystemTime => $Self->{TimeObject}->SystemTime(),
            );
            $M = sprintf( "%02d", $M );
            $D = sprintf( "%02d", $D );
            $h = sprintf( "%02d", $h );
            $m = sprintf( "%02d", $m );
            return $Self->{LayoutObject}->Attachment(
                Filename    => $CSVFile . "_" . "$Y-$M-$D" . "_" . "$h-$m.csv",
                ContentType => "text/csv; charset=" . $Self->{LayoutObject}->{UserCharset},
                Content     => $CSV,
            );
        }

        # print output ( PDF or HTML (print only) )
        elsif ( $GetParam{ResultForm} eq 'Print' ) {

            my @PDFData;
            use Kernel::System::PDF;
            $Self->{PDFObject} = Kernel::System::PDF->new( %{$Self} );

            CONFIGITEMID:
            for my $ConfigItemID ( @{$SearchResultList} ) {

                # check for access rights
                my $HasAccess = $Self->{ConfigItemObject}->Permission(
                    Scope  => 'Item',
                    ItemID => $ConfigItemID,
                    UserID => $Self->{UserID},
                    Type   => $Self->{Config}->{Permission},
                );

                next CONFIGITEMID if !$HasAccess;

                # get version
                my $LastVersion = $Self->{ConfigItemObject}->VersionGet(
                    ConfigItemID => $ConfigItemID,
                    XMLDataGet   => 0,
                );

                # set pdf rows
                if ( $Self->{PDFObject} ) {
                    my @PDFRow;
                    for (qw(Class InciState Name Number DeplState VersionID CreateTime)) {
                        push @PDFRow, $LastVersion->{$_};
                    }
                    push @PDFData, \@PDFRow;
                }
                else {

                    # add table block
                    $Self->{LayoutObject}->Block(
                        Name => 'Record',
                        Data => { %{$LastVersion} },
                    );
                }
            }

            # PDF Output
            if ( $Self->{PDFObject} ) {
                my $Title = $Self->{LayoutObject}->{LanguageObject}->Get('Configuration Item') . ' '
                    . $Self->{LayoutObject}->{LanguageObject}->Get('Search');
                my $PrintedBy = $Self->{LayoutObject}->{LanguageObject}->Get('printed by');
                my $Page      = $Self->{LayoutObject}->{LanguageObject}->Get('Page');
                my $Time      = $Self->{LayoutObject}->Output( Template => '$Env{"Time"}' );
                my $Url       = '';
                if ( $ENV{REQUEST_URI} ) {
                    $Url
                        = $Self->{ConfigObject}->Get('HttpType') . '://'
                        . $Self->{ConfigObject}->Get('FQDN')
                        . $ENV{REQUEST_URI};
                }

                # get maximum number of pages
                my $MaxPages = $Self->{ConfigObject}->Get('PDF::MaxPages');
                if ( !$MaxPages || $MaxPages < 1 || $MaxPages > 1000 ) {
                    $MaxPages = 100;
                }

                # create the header
                my $CellData;
                $CellData->[0]->[0]->{Content}
                    = $Self->{LayoutObject}->{LanguageObject}->Get('Class');
                $CellData->[0]->[0]->{Font} = 'ProportionalBold';
                $CellData->[0]->[1]->{Content}
                    = $Self->{LayoutObject}->{LanguageObject}->Get('Incident State');
                $CellData->[0]->[1]->{Font} = 'ProportionalBold';
                $CellData->[0]->[2]->{Content}
                    = $Self->{LayoutObject}->{LanguageObject}->Get('Name');
                $CellData->[0]->[2]->{Font} = 'ProportionalBold';
                $CellData->[0]->[3]->{Content}
                    = $Self->{LayoutObject}->{LanguageObject}->Get('Number');
                $CellData->[0]->[3]->{Font} = 'ProportionalBold';
                $CellData->[0]->[4]->{Content}
                    = $Self->{LayoutObject}->{LanguageObject}->Get('Deployment State');
                $CellData->[0]->[4]->{Font} = 'ProportionalBold';
                $CellData->[0]->[5]->{Content}
                    = $Self->{LayoutObject}->{LanguageObject}->Get('Version');
                $CellData->[0]->[5]->{Font} = 'ProportionalBold';
                $CellData->[0]->[6]->{Content}
                    = $Self->{LayoutObject}->{LanguageObject}->Get('Create Time');
                $CellData->[0]->[6]->{Font} = 'ProportionalBold';

                # create the content array
                my $CounterRow = 1;
                for my $Row (@PDFData) {
                    my $CounterColumn = 0;
                    for my $Content ( @{$Row} ) {
                        $CellData->[$CounterRow]->[$CounterColumn]->{Content} = $Content;
                        $CounterColumn++;
                    }
                    $CounterRow++;
                }

                # output 'No Result', if no content was given
                if ( !$CellData->[0]->[0] ) {
                    $CellData->[0]->[0]->{Content}
                        = $Self->{LayoutObject}->{LanguageObject}->Get('No Result!');
                }

                # page params
                my %PageParam;
                $PageParam{PageOrientation} = 'landscape';
                $PageParam{MarginTop}       = 30;
                $PageParam{MarginRight}     = 40;
                $PageParam{MarginBottom}    = 40;
                $PageParam{MarginLeft}      = 40;
                $PageParam{HeaderRight}     = $Title;
                $PageParam{FooterLeft}      = $Url;
                $PageParam{HeadlineLeft}    = $Title;
                $PageParam{HeadlineRight}   = $PrintedBy . ' '
                    . $Self->{UserFirstname} . ' '
                    . $Self->{UserLastname} . ' ('
                    . $Self->{UserEmail} . ') '
                    . $Time;

                # table params
                my %TableParam;
                $TableParam{CellData}            = $CellData;
                $TableParam{Type}                = 'Cut';
                $TableParam{FontSize}            = 6;
                $TableParam{Border}              = 0;
                $TableParam{BackgroundColorEven} = '#AAAAAA';
                $TableParam{BackgroundColorOdd}  = '#DDDDDD';
                $TableParam{Padding}             = 1;
                $TableParam{PaddingTop}          = 3;
                $TableParam{PaddingBottom}       = 3;

                # create new pdf document
                $Self->{PDFObject}->DocumentNew(
                    Title  => $Self->{ConfigObject}->Get('Product') . ': ' . $Title,
                    Encode => $Self->{LayoutObject}->{UserCharset},
                );

                # start table output
                $Self->{PDFObject}->PageNew( %PageParam, FooterRight => $Page . ' 1', );
                for ( 2 .. $MaxPages ) {

                    # output table (or a fragment of it)
                    %TableParam = $Self->{PDFObject}->Table( %TableParam, );

                    # stop output or another page
                    if ( $TableParam{State} ) {
                        last;
                    }
                    else {
                        $Self->{PDFObject}->PageNew( %PageParam, FooterRight => $Page . ' ' . $_, );
                    }
                }

                # return the pdf document
                my $Filename = 'configitem_search';
                my ( $s, $m, $h, $D, $M, $Y )
                    = $Self->{TimeObject}->SystemTime2Date(
                    SystemTime => $Self->{TimeObject}->SystemTime(),
                    );
                $M = sprintf( "%02d", $M );
                $D = sprintf( "%02d", $D );
                $h = sprintf( "%02d", $h );
                $m = sprintf( "%02d", $m );
                my $PDFString = $Self->{PDFObject}->DocumentOutput();
                return $Self->{LayoutObject}->Attachment(
                    Filename    => $Filename . "_" . "$Y-$M-$D" . "_" . "$h-$m.pdf",
                    ContentType => "application/pdf",
                    Content     => $PDFString,
                    Type        => 'attachment',
                );
            }

            # output printable html result page
            else {
                $Output = $Self->{LayoutObject}->PrintHeader( Width => 800 );
                if ( @{$SearchResultList} == $Self->{SearchLimit} ) {
                    $Param{Warning} = '$Text{"Reached max. count of %s search hits!", "'
                        . $Self->{SearchLimit} . '"}';
                }
                $Output .= $Self->{LayoutObject}->Output(
                    TemplateFile => 'AgentITSMConfigItemSearchResultPrint',
                    Data         => \%Param,
                );

                # add footer
                $Output .= $Self->{LayoutObject}->PrintFooter();

                # return output
                return $Output;
            }
        }

        # normal HTML output
        else {

            # output normal result block
            $Self->{LayoutObject}->Block(
                Name => 'Result',
                Data => {
                    %GetParam,
                    TotalHits => scalar( @{$SearchResultList} ),
                    Class     => $ClassList->{$ClassID},
                    ClassID   => $ClassID,
                },
            );

            # set incident signal
            my %InciSignals = (
                operational => 'greenled',
                warning     => 'yellowled',
                incident    => 'redled',
            );

            # output the found config items
            CONFIGITEMID:
            for my $ConfigItemID ( @{$SearchResultList} ) {

                # check for access rights
                my $HasAccess = $Self->{ConfigItemObject}->Permission(
                    Scope  => 'Item',
                    ItemID => $ConfigItemID,
                    UserID => $Self->{UserID},
                    Type   => $Self->{Config}->{Permission},
                );

                next CONFIGITEMID if !$HasAccess;

                # get version
                my $LastVersion = $Self->{ConfigItemObject}->VersionGet(
                    ConfigItemID => $ConfigItemID,
                    XMLDataGet   => 0,
                );

                # output row
                $Self->{LayoutObject}->Block(
                    Name => 'ResultRow',
                    Data => {
                        %{$LastVersion},
                        CurInciSignal => $InciSignals{ $LastVersion->{CurInciStateType} },
                    },
                );
            }

            # output header
            my $Output = $Self->{LayoutObject}->Header( Title => 'Search' );
            $Output .= $Self->{LayoutObject}->NavigationBar();

            # output template
            $Output .= $Self->{LayoutObject}->Output(
                TemplateFile => 'AgentITSMConfigItemSearch',
            );

            # output footer
            $Output .= $Self->{LayoutObject}->Footer();

            return $Output;
        }
    }

    # ------------------------------------------------------------ #
    # call search dialog from search empty screen
    # ------------------------------------------------------------ #
    else {

        # show default search screen
        $Output = $Self->{LayoutObject}->Header();
        $Output .= $Self->{LayoutObject}->NavigationBar();

        $Self->{LayoutObject}->Block(
            Name => 'Search',
            Data => \%Param,
        );

        # output template
        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AgentITSMConfigItemSearch',
        );

        # output footer
        $Output .= $Self->{LayoutObject}->Footer();

        return $Output;
    }
}

sub _XMLSearchFormOutput {
    my ( $Self, %Param ) = @_;

    my %GetParam = %{ $Param{GetParam} };

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if ref $Param{XMLDefinition} ne 'ARRAY';
    return if ref $Param{XMLAttributes} ne 'ARRAY';

    $Param{Level} ||= 0;
    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {

        # set prefix
        my $InputKey = $Item->{Key};
        my $Name     = $Item->{Name};
        if ( $Param{Prefix} ) {
            $InputKey = $Param{Prefix} . '::' . $InputKey;
            $Name     = $Param{PrefixName} . '::' . $Name;
        }

        # output attribute, if marked as searchable
        if ( $Item->{Searchable} ) {
            my $Value;

            # date type fields must to get all date parameters
            if ( $Item->{Input}->{Type} eq 'Date' ) {
                $Value =
                    {
                    $InputKey                      => $GetParam{$InputKey},
                    $InputKey . '::TimeStart::Day' => $GetParam{ $InputKey . '::TimeStart::Day' },
                    $InputKey
                        . '::TimeStart::Month' => $GetParam{ $InputKey . '::TimeStart::Month' },
                    $InputKey . '::TimeStart::Year' => $GetParam{ $InputKey . '::TimeStart::Year' },
                    $InputKey . '::TimeStop::Day'   => $GetParam{ $InputKey . '::TimeStop::Day' },
                    $InputKey . '::TimeStop::Month' => $GetParam{ $InputKey . '::TimeStop::Month' },
                    $InputKey . '::TimeStop::Year'  => $GetParam{ $InputKey . '::TimeStop::Year' },
                    } || '';
            }

            # date-time type fields must get all date and time parameters
            elsif ( $Item->{Input}->{Type} eq 'DateTime' ) {
                $Value =
                    {
                    $InputKey => $GetParam{$InputKey},
                    $InputKey
                        . '::TimeStart::Minute' => $GetParam{ $InputKey . '::TimeStart::Minute' },
                    $InputKey . '::TimeStart::Hour' => $GetParam{ $InputKey . '::TimeStart::Hour' },
                    $InputKey . '::TimeStart::Day'  => $GetParam{ $InputKey . '::TimeStart::Day' },
                    $InputKey
                        . '::TimeStart::Month' => $GetParam{ $InputKey . '::TimeStart::Month' },
                    $InputKey . '::TimeStart::Year' => $GetParam{ $InputKey . '::TimeStart::Year' },
                    $InputKey
                        . '::TimeStop::Minute' => $GetParam{ $InputKey . '::TimeStop::Minute' },
                    $InputKey . '::TimeStop::Hour'  => $GetParam{ $InputKey . '::TimeStop::Hour' },
                    $InputKey . '::TimeStop::Day'   => $GetParam{ $InputKey . '::TimeStop::Day' },
                    $InputKey . '::TimeStop::Month' => $GetParam{ $InputKey . '::TimeStop::Month' },
                    $InputKey . '::TimeStop::Year'  => $GetParam{ $InputKey . '::TimeStop::Year' },
                    } || '';
            }

            # other kinds of fields can get its value directly
            else {
                $Value = $GetParam{$InputKey} || '';
            }

            # create search input element
            my $InputString = $Self->{LayoutObject}->ITSMConfigItemSearchInputCreate(
                Key   => $InputKey,
                Item  => $Item,
                Value => $Value,
            );

            # output attribute row
            $Self->{LayoutObject}->Block(
                Name => 'AttributeRow',
                Data => {
                    Key         => $InputKey,
                    Name        => $Name,
                    Description => $Item->{Description} || $Item->{Name},
                    InputString => $InputString,
                },
            );

            push @{ $Param{XMLAttributes} }, (
                {
                    Key   => $InputKey,
                    Value => $Name,
                },
            );

        }

        next ITEM if !$Item->{Sub};

        # start recursion, if "Sub" was found
        $Self->_XMLSearchFormOutput(
            XMLDefinition => $Item->{Sub},
            Level         => $Param{Level} + 1,
            Prefix        => $InputKey,
            PrefixName    => $Name,
            GetParam      => \%GetParam,
        );
    }

    return 1;
}

sub _XMLSearchFormGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if !$Param{XMLFormData};
    return if !$Param{XMLGetParam};
    return if ref $Param{XMLDefinition} ne 'ARRAY';
    return if ref $Param{XMLFormData} ne 'ARRAY';
    return if ref $Param{XMLGetParam} ne 'ARRAY';

    $Param{Level} ||= 0;

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {

        # create inputkey
        my $InputKey = $Item->{Key};
        if ( $Param{Prefix} ) {
            $InputKey = $Param{Prefix} . '::' . $InputKey;
        }

        # get search form data
        my $Values = $Self->{LayoutObject}->ITSMConfigItemSearchFormDataGet(
            Key  => $InputKey,
            Item => $Item,
        );

        # create search key
        my $SearchKey = $InputKey;
        $SearchKey =~ s{ :: }{\'\}[%]\{\'}xmsg;
        $SearchKey = "[1]{'Version'}[1]{'$SearchKey'}[%]{'Content'}";

        # ITSMConfigItemSearchFormDataGet() can return string, arrayref or hashref
        if ( ref $Values eq 'ARRAY' ) {

            # filter empty elements
            my @SearchValues = grep {$_} @{$Values};

            if (@SearchValues) {
                push @{ $Param{XMLFormData} },
                    {
                    $SearchKey => \@SearchValues,
                    };

                push @{ $Param{XMLGetParam} },
                    {
                    $InputKey => \@SearchValues,
                    };
            }

        }
        elsif ($Values) {

            # e.g. for Date between searches
            push @{ $Param{XMLFormData} },
                {
                $SearchKey => $Values,
                };

            if ( ref $Values eq 'HASH' ) {
                if ( $Item->{Input}->{Type} eq 'Date' ) {
                    if ( $Values->{'-between'} ) {

                        # get time elemet values
                        my ( $StartDate, $StopDate ) = @{ $Values->{'-between'} };
                        my ( $StartYear, $StartMonth, $StartDay ) = split( /-/, $StartDate );
                        my ( $StopYear,  $StopMonth,  $StopDay )  = split( /-/, $StopDate );

                        # store time elment values
                        push @{ $Param{XMLGetParam} },
                            {
                            $InputKey                        => 1,
                            $InputKey . '::TimeStart::Day'   => $StartDay,
                            $InputKey . '::TimeStart::Month' => $StartMonth,
                            $InputKey . '::TimeStart::Year'  => $StartYear,
                            $InputKey . '::TimeStop::Day'    => $StopDay,
                            $InputKey . '::TimeStop::Month'  => $StopMonth,
                            $InputKey . '::TimeStop::Year'   => $StopYear,
                            };
                    }
                }
                elsif ( $Item->{Input}->{Type} eq 'DateTime' ) {
                    if ( $Values->{'-between'} ) {

                        # get time elemet values
                        my ( $StartDateTime, $StopDateTime ) = @{ $Values->{'-between'} };
                        my ( $StartDate, $StartTime ) = split( /\s/, $StartDateTime );
                        my ( $StartYear, $StartMonth,  $StartDay )    = split( /-/,  $StartDate );
                        my ( $StartHour, $StartMinute, $StartSecond ) = split( /\:/, $StartTime );

                        my ( $StopDate, $StopTime ) = split( /\s/, $StopDateTime );
                        my ( $StopYear, $StopMonth,  $StopDay )    = split( /-/,  $StopDate );
                        my ( $StopHour, $StopMinute, $StopSecond ) = split( /\:/, $StopTime );

                        # store time elment values
                        push @{ $Param{XMLGetParam} },
                            {
                            $InputKey                         => 1,
                            $InputKey . '::TimeStart::Minute' => $StartMinute,
                            $InputKey . '::TimeStart::Hour'   => $StartHour,
                            $InputKey . '::TimeStart::Day'    => $StartDay,
                            $InputKey . '::TimeStart::Month'  => $StartMonth,
                            $InputKey . '::TimeStart::Year'   => $StartYear,
                            $InputKey . '::TimeStop::Minute'  => $StopMinute,
                            $InputKey . '::TimeStop::Hour'    => $StopHour,
                            $InputKey . '::TimeStop::Day'     => $StopDay,
                            $InputKey . '::TimeStop::Month'   => $StopMonth,
                            $InputKey . '::TimeStop::Year'    => $StopYear,
                            };
                    }
                }
                else {
                }
            }
            else {
                push @{ $Param{XMLGetParam} },
                    {
                    $InputKey => $Values,
                    };
            }

        }

        next ITEM if !$Item->{Sub};

        # start recursion, if "Sub" was found
        $Self->_XMLSearchFormGet(
            XMLDefinition => $Item->{Sub},
            XMLFormData   => $Param{XMLFormData},
            XMLGetParam   => $Param{XMLGetParam},
            Level         => $Param{Level} + 1,
            Prefix        => $InputKey,
        );
    }

    return 1;
}

sub _XMLSearchAttributesGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if ref $Param{XMLDefinition} ne 'ARRAY';
    return if ref $Param{XMLAttributes} ne 'ARRAY';

    $Param{Level} ||= 0;
    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {

        # set prefix
        my $InputKey = $Item->{Key};
        my $Name     = $Item->{Name};
        if ( $Param{Prefix} ) {
            $InputKey = $Param{Prefix} . '::' . $InputKey;
            $Name     = $Param{PrefixName} . '::' . $Name;
        }

        # store attribute, if marked as searchable
        if ( $Item->{Searchable} ) {
            push @{ $Param{XMLAttributes} }, (
                {
                    Key   => $InputKey,
                    Value => $Name,
                },
            );
        }

        next ITEM if !$Item->{Sub};

        # start recursion, if "Sub" was found
        $Self->_XMLSearchAttributesGet(
            XMLDefinition => $Item->{Sub},
            Level         => $Param{Level} + 1,
            Prefix        => $InputKey,
            PrefixName    => $Name,
        );
    }

    return 1;
}

1;
