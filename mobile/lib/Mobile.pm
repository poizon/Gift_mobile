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
  $self->plugin('Mobile::Helpers');
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
  $r->get('/del_item/:id')->to('index#del_item');
  $r->get('/order')->to('index#order');
  $r->post('/order_save')->to('index#order_save');
  $r->post('/search')->to('index#search');
  
  # admin interface
  $r->get('/admin/:cat' => {cat => 0 })->to('admin#welcome');
  $r->get('/admin_item')->to('admin#admin_item');
  $r->get('/add_item')->to('admin#add_item');
  $r->post('/add_item')->to('admin#save_item');
  $r->get('/edit_item/:id' => {id => 0})->to('admin#edit_item');
  $r->get('/add_spec/:id' => {id => 0})->to('admin#add_spec');
  $r->post('/save_row_spec')->to('admin#save_row_spec');
  
}

1;
