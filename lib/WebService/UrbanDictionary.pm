# UrbanDictionary.pm
# Grabs UrbanDictionary.com definitions and other data using its JSON API
# Author: William Woodruff
# License: MIT
# ABSTRACT: An interfact to UrbanDictionary.com's JSON API

package WebService::UrbanDictionary;

use strict;
use warnings;

use Exporter;
use LWP::Simple;
use JSON qw(decode_json);
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION = 1.00;
@ISA = qw(Exporter);
@EXPORT = qw(define author permalink thumbs_up thumbs_down tags);
@EXPORT_OK = qw(define author permalink thumbs_up thumbs_down tags);

our $urban_url = "http://api.urbandictionary.com/v0/define?term=";

sub define {
	my (%keys) = @_;
	my $word = $keys{word} || die "No word provided.\n";
	my $index = $keys{index} || 0;
	my @definitions = @{decode_json(get($urban_url . $word))->{'list'}};
	return $definitions[$index]->{'definition'}
}

sub author {
	my (%keys) = @_;
	my $word = $keys{word} || die "No word provided.\n";
	my $index = $keys{index} || 0;
	my @definitions = @{decode_json(get($urban_url . $word))->{'list'}};
	return $definitions[$index]->{'author'}
}

sub permalink {
	my (%keys) = @_;
	my $word = $keys{word} || die "No word provided.\n";
	my $index = $keys{index} || 0;
	my @definitions = @{decode_json(get($urban_url . $word))->{'list'}};
	return $definitions[$index]->{'permalink'}
}

sub thumbs_up {
	my (%keys) = @_;
	my $word = $keys{word} || die "No word provided.\n";
	my $index = $keys{index} || 0;
	my @definitions = @{decode_json(get($urban_url . $word))->{'list'}};
	return $definitions[$index]->{'thumbs_up'}
}

sub thumbs_down {
	my (%keys) = @_;
	my $word = $keys{word} || die "No word provided.\n";
	my $index = $keys{index} || 0;
	my @definitions = @{decode_json(get($urban_url . $word))->{'list'}};
	return $definitions[$index]->{'thumbs_down'}
}

sub tags {
	my (%keys) = @_;
	my $word = $keys{word} || die "No word provided.\n";
	return @{decode_json(get($urban_url . $word))->{'tags'}};
}

1;

=head1 SYNOPSIS

C<use WWW::Query::UrbanDictionary;>

C<< my $definition = define_word(word => 'perl'); >>

=head1 DESCRIPTION

WWW::Query::UrbanDictionary provides a set of simple methods for accessing definitions
and other data available through UrbanDictionary's online JSON API.

=head2 Methods

=over 12

=item C<< define(word => $word, index => $index) >>

Returns the defintion for the word at the given index.
If no index is given, the first definition is given (index 0).

=item C<< author(word => $word, index => $index) >>

Returns the author of the word's definition at the given index.
If no index is given, the first definition is given (index 0).

=item C<< permalink(word => $word, index => $index) >>

Returns a permalink to the word's definition at the given index.
If no index is given, the first definition is given (index 0).

=item C<< thumbs_up(word => $word, index => $index) >>

Returns the number of 'thumbs up's given to the word's definition at the given index.
If no index is given, the first definition is given (index 0).

=item C<< thumbs_down(word => $word, index => $index) >>

Returns the number of 'thumbs down's given to the word's definition at the given index.
If no index is given, the first definition is given (index 0).

=item C<< tags(word => $word) >>

Returns an array of tags associated with the given word.

=back

=head1 SEE ALSO

L<http://search.cpan.org/~sock/WWW-Search-UrbanDictionary-0.4/lib/WWW/Search/UrbanDictionary.pm>

=cut