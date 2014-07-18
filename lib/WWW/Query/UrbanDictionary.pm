# UrbanDictionary.pm
# Grabs UrbanDictionary.com definitions and other data using its JSON API
# Author: William Woodruff
# License: MIT
# ABSTRACT: Queries UrbanDictionary

package WWW::Query::UrbanDictionary;

use strict;
use warnings;

use Exporter;
use LWP::Simple;
use JSON qw(decode_json);
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION = 1.00;
@ISA = qw(Exporter);
@EXPORT = qw(define_word get_author get_permalink get_thumbs_up get_thumbs_down get_tags);
@EXPORT_OK = qw(define_word get_author get_permalink get_thumbs_up get_thumbs_down get_tags);

our $urban_url = "http://api.urbandictionary.com/v0/define?term=";

sub define_word {
	my (%keys) = @_;
	my $word = $keys{WORD} || die "No word provided.\n";
	my $index = $keys{INDEX} || 0;
	my @definitions = @{decode_json(get($urban_url . $word))->{'list'}};
	return $definitions[$index]->{'definition'}
}

sub get_author {
	my (%keys) = @_;
	my $word = $keys{WORD} || die "No word provided.\n";
	my $index = $keys{INDEX} || 0;
	my @definitions = @{decode_json(get($urban_url . $word))->{'list'}};
	return $definitions[$index]->{'author'}
}

sub get_permalink {
	my (%keys) = @_;
	my $word = $keys{WORD} || die "No word provided.\n";
	my $index = $keys{INDEX} || 0;
	my @definitions = @{decode_json(get($urban_url . $word))->{'list'}};
	return $definitions[$index]->{'permalink'}
}

sub get_thumbs_up {
	my (%keys) = @_;
	my $word = $keys{WORD} || die "No word provided.\n";
	my $index = $keys{INDEX} || 0;
	my @definitions = @{decode_json(get($urban_url . $word))->{'list'}};
	return $definitions[$index]->{'thumbs_up'}
}

sub get_thumbs_down {
	my (%keys) = @_;
	my $word = $keys{WORD} || die "No word provided.\n";
	my $index = $keys{INDEX} || 0;
	my @definitions = @{decode_json(get($urban_url . $word))->{'list'}};
	return $definitions[$index]->{'thumbs_down'}
}

sub get_tags {
	my (%keys) = @_;
	my $word = $keys{WORD} || die "No word provided.\n";
	return @{decode_json(get($urban_url . $word))->{'tags'}};
}

1;