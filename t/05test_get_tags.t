use Test;
BEGIN { plan tests => 2 }
use WebService::UrbanDictionary;

ok(1);

my @tags = get_tags(WORD => 'perl');

ok($tags[0] =~ m/[A-Za-z0-9\+\-_\[\] ]/);
