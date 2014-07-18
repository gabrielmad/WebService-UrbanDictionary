use Test;
BEGIN { plan tests => 3 }
use WWW::Query::UrbanDictionary;

ok(1);

my $tags = get_tags(WORD => 'perl');

ok(ref($tags) eq 'ARRAY');
