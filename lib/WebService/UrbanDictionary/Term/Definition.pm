package WebService::UrbanDictionary::Term::Definition;

use Moo;

has 'defid'        => ( is => 'ro' );
has 'word'         => ( is => 'ro' );
has 'author'       => ( is => 'ro' );
has 'permalink'    => ( is => 'ro' );
has 'definition'   => ( is => 'ro' );
has 'example'      => ( is => 'ro' );
has 'thumbs_up'    => ( is => 'ro' );
has 'thumbs_down'  => ( is => 'ro' );
has 'current_vote' => ( is => 'ro' );

1;