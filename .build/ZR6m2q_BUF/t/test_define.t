use Test;
BEGIN { plan tests => 1 }
use WWW::Query::UrbanDictionary;

ok(1);

my $def = define(WORD => 'hello');
my $def2 = define(WORD => 'hello', INDEX => '1');

ok($def);
ok($def2);