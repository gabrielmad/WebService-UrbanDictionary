use Test;
BEGIN { plan tests => 2 }
use WebService::UrbanDictionary;

ok(1);

my $link = get_permalink(WORD => 'perl');

ok($link =~ m/http:\/\//);