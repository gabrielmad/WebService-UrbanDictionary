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
@EXPORT = (define);
@EXPORT_OK = qw(define);
%EXPORT_TAGS = ();

my $urban_url = "http://api.urbandictionary.com/v0/define?term=";

sub define_word {
	my (%keys) = @_;
	my $word = $keys{WORD};
	my $index = $keys{INDEX} || 0;
	my @definitions = @{decode_json(get($urban_url . $word))->{'list'}};
	return $definitions[$index]->{'definition'}
}

1;