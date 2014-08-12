package WebService::UrbanDictionary;

# ABSTRACT: An OO interface to UrbanDictionary.com's JSON API

our $VERSION = 2.000;

use Carp;
use strict;
use warnings;

use Moo;
use JSON;
use LWP::UserAgent;
use WebService::UrbanDictionary::Term;

has _ua            => ( is => 'ro', default => sub { LWP::UserAgent->new() } );
has _end_point_url => ( is => 'ro', default => sub { 'http://api.urbandictionary.com/v0/define?term=' } );

sub request {
	my $self = shift;
	my $term = shift or carp "No term provided.";
	my $url = $self->_end_point_url . $term;
	my $res = decode_json $self->_ua->get( $url )->decoded_content or carp "Error during fetch/decode.";
	$res->{term} = $term;
	WebService::UrbanDictionary::Term->new( $res );
}

1;