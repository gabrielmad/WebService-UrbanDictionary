use Test;
BEGIN { plan tests => 3 }
use WebService::UrbanDictionary;

ok(1);

my $author = author(word => 'perl');
my $author2 = author(word => 'perl', index => '0');

ok($author =~ m/[A-Za-z0-9\-_ ]/);
ok($author2 =~ m/[A-Za-z0-9\-_ ]/);