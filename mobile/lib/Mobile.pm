package Mobile;
use Mojo::Base 'Mojolicious';

use GDB::DB::Object::AutoBase2;
use GDB::Slider::Manager;
use GDB::Diler::Manager;
use GDB::ItemsCat::Manager;
use GDB::Item::Manager;
use GDB::ItemsImage::Manager;
use GDB::ItemsSpec::Manager;
use GDB::ItemsBonu::Manager;
use GDB::Bonus::Manager;
use GDB::ItemsRelated::Manager;
use GDB::Order::Manager;
use GDB::Card::Manager;

$ENV{MOJO_CONFIG} = 'script/app.conf';
# This method will run once at server start
sub startup {
  my $self = shift;
  my $cfg = $self->plugin('Config');
  #$self->plugin('ITS_mojo::Helpers');
  $self->secrets([$cfg->{secret}]);
  $self->sessions->default_expiration($cfg->{session_exp});
  $self->sessions->cookie_name('gifmobile');
  # DB connect
  my $dbh = GDB::DB::Object::AutoBase2->init_db;
  # Router
  my $r = $self->routes;

  # Front-end interface (client)
  $r->get('/')->to('index#welcome');
  $r->get('/about_company')->to('index#about_company');
  $r->get('/contacts/:place' => {place => 0})->to('index#contacts');
  $r->get('/items_by_cat')->to('index#items_by_cat');
  $r->get('/services_by_cat')->to('index#services_by_cat');
  $r->get('/not_found')->to('index#not_found');
  $r->get('/shop/:name')->to('index#shop');
  $r->get('/item_card/:id')->to('index#item_card');
  $r->get('/add_to_card/:id' => {id => 0})->to('index#add_to_card');
  
}

1;
