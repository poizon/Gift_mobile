package Mobile::Controller::Index;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub welcome {
  my $self = shift;
  $self->render('index');
}

sub about_company {
  my $self = shift;
  $self->render('about_company');
}

1;
