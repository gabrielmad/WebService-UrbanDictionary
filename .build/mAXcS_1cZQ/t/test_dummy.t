use Test;
BEGIN { plan tests => 1 }
use WWW::Query::UrbanDictionary;

ok(1);

my $var = dummy();
ok($var);