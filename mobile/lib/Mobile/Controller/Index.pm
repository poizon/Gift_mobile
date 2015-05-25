package Mobile::Controller::Index;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub welcome {
  my $self = shift;
  my $sliders = GDB::Slider::Manager->get_sliders(query =>[public => 1]);
  $self->stash(sliders => $sliders);
  $self->render('index');
}

sub about_company {
  my $self = shift;
  $self->render('about_company');
}

sub contacts {
  my $self = shift;
  my $place = $self->param('place') || 0;
  $place =~ s/[^0-9]+//g;
  if ($place) {
  my $cnt = GDB::Diler->new(id => $place);
  $self->redirect_to('/not_found') unless ($cnt->load(speculative => 1));
  $self->stash(cnt => $cnt);
  $self->render('contact');
  } else {
  my $contacts = GDB::Diler::Manager->get_dilers(query =>[public => 1]);
  $self->stash(contacts => $contacts);  
  $self->render('contacts');  
  }
  
}
# товары категории
sub items_by_cat {
  my $self = shift;
  my $categories = GDB::ItemsCat::Manager->get_items_cat(query => [type => 'I']);
  $self->stash(title => 'Каталоги товаров',
               url   => 'items_by_cat',
               categories => $categories);
  $self->render('categories');  
}

# услуги категории
sub services_by_cat {
  my $self = shift;
  my $categories = GDB::ItemsCat::Manager->get_items_cat(query => [type => 'S']);
  $self->stash(title => 'Каталог услуг',
               url   => 'services_by_cat',
               categories => $categories);
  $self->render('categories');  
}

sub not_found {
  my $self = shift;
  $self->render('not_found');
}

1;
