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
@EXPORT = qw(define_word);
@EXPORT_OK = qw(define_word);
%EXPORT_TAGS = ();

sub define_word {
	my (%keys) = @_;
	my $word = $keys{WORD};
	my $index = $keys{INDEX} || 0;
	my $urban_url = "http://api.urbandictionary.com/v0/define?term=";
	my @definitions = @{decode_json(get($urban_url . $word))->{'list'}};
	return $definitions[$index]->{'definition'}
}

sub dummy {
	print "dummy\n";
	return 0;
}

1;