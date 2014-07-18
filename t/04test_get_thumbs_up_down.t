use Test;
BEGIN { plan tests => 3 }
use WebService::UrbanDictionary;

ok(1);

my $up = thumbs_up(word => 'perl');
my $down = thumbs_down(word => 'perl');

ok($up =~ m/[0-9]/);
ok($down =~ m/[0-9]/);