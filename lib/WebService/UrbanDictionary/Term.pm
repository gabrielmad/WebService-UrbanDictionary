package WebService::UrbanDictionary::Term;

use Moo;
use WebService::UrbanDictionary::Term::Definition;

has 'term'        => ( is => 'ro' );
has 'tags'        => ( is => 'ro' );
has 'result_type' => ( is => 'ro' );
has 'definitions' => ( is => 'ro' );
has 'sounds'      => ( is => 'ro' );

sub BUILD {
	my $self = shift;
	$self->{definitions} = [
		map { WebService::UrbanDictionary::Term::Definition->new($_) } @{$self->{list}}
	];
}

sub definition {
	my $defs = shift->definitions;
	wantarray ? @$defs : $defs->[0]->definition;
}

1;