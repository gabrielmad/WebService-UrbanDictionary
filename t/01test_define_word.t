use Test;
BEGIN { plan tests => 3 }
use WebService::UrbanDictionary;

ok(1);

my $def = define(word => 'perl');
my $def2 = define(word => 'hello', index => '0');

ok($def =~ m/pur'-el/);
ok($def2 =~ m/what/);