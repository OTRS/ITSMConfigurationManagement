#!/usr/bin/env perl
# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# --
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

use strict;
use warnings;

## nofilter(TidyAll::Plugin::OTRS::Perl::Dumper)

# use ../ as lib location
use File::Basename;
use FindBin qw($RealBin);
use lib dirname($RealBin);

use SOAP::Lite;
use Data::Dumper;

# Variables to be defined

# this is the URL for the web service
# the format is
# <HTTP_TYPE>:://<OTRS_FQDN>/nph-genericinterface.pl/Webservice/<WEB_SERVICE_NAME>
# or
# <HTTP_TYPE>:://<OTRS_FQDN>/nph-genericinterface.pl/WebserviceID/<WEB_SERVICE_ID>
my $URL = 'http://localhost/otrs/nph-genericinterface.pl/Webservice/GenericConfigItemConnectorSOAP';

# this name space should match the specified name space in the SOAP transport for the web service
my $NameSpace = 'http://www.otrs.org/ConfigItemConnector';

my $Operation = 'ConfigItemCreate';

# this variable is used to store all the parameters to be included on a request in XML format, each
# operation has a determined set of mandatory and non mandatory parameters to work correctly, please
# check OTRS Admin Manual in order to get the complete list
my $XMLData = '
<UserLogin>root@localhost</UserLogin>
<Password>root</Password>
<ConfigItem>
        <Class>Computer</Class>
        <Name>Test</Name>
        <DeplState>Production</DeplState>
        <InciState>Operational</InciState>
        <CIXMLData>
            <Vendor>Lenovo</Vendor>
            <Model>Thinkpad</Model>
            <Description>Thinkpad X300</Description>
            <Type>Desktop</Type>
            <Owner>tt</Owner>
            <SerialNumber>abc12345abc</SerialNumber>
            <OperatingSystem>CentOS 6.0</OperatingSystem>
            <CPU>Intel Core i3</CPU>
            <Ram>4000</Ram>
            <Ram>2000</Ram>
            <HardDisk>
                <HardDisk>/dev</HardDisk>
                <Capacity>50000</Capacity>
            </HardDisk>
            <FQDN>host.example.com</FQDN>
            <NIC>
                <NIC>Eth0</NIC>
                <IPoverDHCP>No</IPoverDHCP>
                <IPAddress>192.168.30.1</IPAddress>
            </NIC>
            <NIC>
                <NIC>Eth1</NIC>
                <IPoverDHCP>Yes</IPoverDHCP>
                <IPAddress>200.34.56.78</IPAddress>
            </NIC>
            <GraphicAdapter>ATI Radeon 300</GraphicAdapter>
            <WarrantyExpirationDate>12/12/1977</WarrantyExpirationDate>
            <InstallDate>1977-12-12</InstallDate>
            <Note>This is a Demo CI</Note>
        </CIXMLData>
        <Attachment>
            <Content>VGhpcyBpcyBhbiBlbmNvZGVkIHRleHQ=</Content>
            <ContentType>text/plain</ContentType>
            <Filename>My Text.txt</Filename>
        </Attachment>
        <Attachment>
            <Content>VGhpcyBpcyBhbiBlbmNvZGVkIHRleHQ=</Content>
            <ContentType>text/plain; charset=ISO-8859-1</ContentType>
            <Filename>My Text2.txt</Filename>
        </Attachment>
</ConfigItem>
';

# create a SOAP::Lite data structure from the provided XML data structure
my $SOAPData = SOAP::Data->type( 'xml' => $XMLData );

my $SOAPObject = SOAP::Lite->uri($NameSpace)->proxy($URL)->soapversion('1.2')->$Operation($SOAPData);

# check for a fault in the soap code
if ( $SOAPObject->fault() ) {
    print $SOAPObject->faultcode(), " ", $SOAPObject->faultstring(), "\n";
}

# otherwise print the results
else {

    # get the XML response part from the SOAP message
    my $XMLResponse = $SOAPObject->context()->transport()->proxy()->http_response()->content();

    # deserialize response (convert it into a perl structure)
    my $Deserialized = eval {
        SOAP::Deserializer->deserialize($XMLResponse);
    };

    # remove all the headers and other not needed parts of the SOAP message
    my $Body = $Deserialized->body();

    # just output relevant data and no the operation name key
    for my $ResponseKey ( sort keys %{$Body} ) {
        print Dumper( $Body->{$ResponseKey} );    ## no critic
    }
}
