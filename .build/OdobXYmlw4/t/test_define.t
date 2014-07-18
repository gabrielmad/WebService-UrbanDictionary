use Test;
BEGIN { plan tests => 1 }
use WWW::Query::UrbanDictionary;

ok(1);

my $def = WWW::Query::UrbanDictionary::define_word(WORD => 'hello');
my $def2 = WWW::Query::UrbanDictionary::define_word(WORD => 'hello', INDEX => '1');

ok($def);
ok($def2);