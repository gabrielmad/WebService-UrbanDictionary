use Test;
BEGIN { plan tests => 2 }
use WebService::UrbanDictionary;

ok(1);

my $link = permalink(word => 'perl');

ok($link =~ m/http:\/\//);