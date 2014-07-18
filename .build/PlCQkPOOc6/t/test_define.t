use Test;
BEGIN { plan tests => 2 }
use WWW::Query::UrbanDictionary;

ok(1);

my $def = &define_word({WORD => 'hello'});
my $def2 = &define_word({WORD => 'hello', INDEX => '1'});

ok($def);
ok($def2);