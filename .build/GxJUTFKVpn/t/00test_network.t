use Test;
BEGIN { plan tests => 2 }
use LWP::Simple;

ok(1);

print "############################################################################\n"
print "# These tests WILL FAIL unless your computer is connected to the internet. #\n"
print "############################################################################\n"

my $query = "http://google.com";
my $browser = LWP::UserAgent->new;
my $response = $browser->get( $query );

is $response->code, 200;