package Mobile;
use Mojo::Base 'Mojolicious';
use GDB::DB::Object::AutoBase2;

use GDB::Slider::Manager;
use GDB::Diler::Manager;

$ENV{MOJO_CONFIG} = 'script/app.conf';
# This method will run once at server start
sub startup {
  my $self = shift;
  my $cfg = $self->plugin('Config');
  #$self->plugin('ITS_mojo::Helpers');
  $self->secrets([$cfg->{secret}]);
  $self->sessions->default_expiration($cfg->{session_exp});
  # DB connect
  my $dbh = GDB::DB::Object::AutoBase2->init_db;
  # Router
  my $r = $self->routes;

  # Front-end interface (client)
  $r->get('/')->to('index#welcome');
  $r->get('/about_company')->to('index#about_company');
  $r->get('/contacts/:place' => {place => 0})->to('index#contacts');
  $r->get('/not_found')->to('index#not_found');
  
}

1;