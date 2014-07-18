use Test;
BEGIN { plan tests => 3 }
use WWW::Query::UrbanDictionary;

ok(1);

my $author = get_author(WORD => 'perl');
my $author2 = get_author(WORD => 'perl', INDEX => '1');

ok($author =~ m/jesus/);
ok($author2 =~ m/[A-Za-z0-9\-_ ]/);