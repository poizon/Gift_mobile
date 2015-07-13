package Mobile::Controller::Admin;
use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper;
use Image::Size;
use Image::Resize;

sub welcome {
  my $self = shift;
  $self->render('admin/index');
}

sub not_found {
  my $self = shift;
  my $card_col = $self->session('card_col');
  $self->stash(card_col => $card_col);
  $self->render('not_found');
}

sub admin_item {
  my $self = shift;
  my $items = GDB::Item::Manager->get_items();
  $self->stash(items => $items);
  $self->render('admin/admin_item');
}


sub add_item {
  my $self = shift;
  my $cats = GDB::ItemsCat::Manager->get_items_cat();
  my $bonus = GDB::Bonus::Manager->get_bonuses();
  
  $self->stash(cats => $cats,
               bonus => $bonus);
  
  $self->render('admin/add_item');
}

sub save_item {
    my $self = shift;
    $self->render('admin/add_item');
}


sub uploader {
  my $self = shift;
#  my $file = $self->param('main_img');
#  
#  my $size = $file->size;
#  my $name = $file->name;
#  my $image_type = $file->headers->content_type;
#  my $filename = $file->filename;
#   eval {$file->move_to("$self->config->{upload_dir}/$filename");};
#   $name = resize_img($filename,$image_type);
#   my ($width, $height) = imgsize("$self->config->{upload_dir}/t/$name");
#    my $json->{upload}{image} = {
#			      name => $name,
#			      type => $image_type,
#			      width  => $width,
#			      height => $height,
#			      size => $size,
#			      };
    #$json->{upload}{links} = {original => qq(/files/t/$name)};
    my $json->{upload}{links} = {original => qq('')};
    $self->render_json($json);
}

1;
