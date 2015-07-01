package Mobile::Controller::Admin;
use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper;


sub welcome {
  my $self = shift;
  $self->render('admin/index');
}

sub not_found {
  my $self = shift;
  #$self->session(card_col => 0);
  my $card_col = $self->session('card_col');
  $self->stash(card_col => $card_col);
  $self->render('not_found');
}



1;
