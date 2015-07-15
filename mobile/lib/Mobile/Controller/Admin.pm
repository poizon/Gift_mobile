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

sub edit_item {
  my $self = shift;
  my $id = $self->param('id');
  my $cats = GDB::ItemsCat::Manager->get_items_cat();
  my $bonus = GDB::Bonus::Manager->get_bonuses();
  my $bon_item = GDB::ItemsBonu::Manager->get_items_bonus(query => [ id => $id]);
  my $item = GDB::Item->new(id => $id)->load;
  $self->stash(cats => $cats,
               bonus => $bonus,
               bon_item => $bon_item,
               item => $item);
  
  $self->render('admin/edit_item');
}

sub save_item {
    my $self = shift;
    my $id = $self->param('id') || 0;
    my @act;
    my $path = $self->config->{upload_dir};
    my $name = $self->param('name');
    my $note = $self->param('note');
    my $cat = $self->param('cat');
    my $price = $self->param('price');
    $price =~ s/[^0-9]+//g;
    my $old_price = $self->param('old_price');
    $old_price =~ s/[^0-9]+//g;
    my $main_img = $self->param('main_img');
    my $filename = $main_img->filename;
    my $descript = $self->param('descript');
    my $bonus = $self->every_param('bonus');
    print Dumper($bonus);
    my $action = $self->param('action');
    $main_img->move_to("$path/$filename");
    my $image_type = $main_img->headers->content_type;
    my $big_name = resize_img($filename,$image_type,$path,300,300,0);
    my $t_name = resize_img($filename,$image_type,$path,80,80,1);
    my $type_cat = GDB::ItemsCat->new(id => $cat)->load;
       @act = qw(0 0 0) if $action eq 0;
       @act = qw(1 0 0) if $action eq 1;
       @act = qw(0 1 0) if $action eq 2;
       @act = qw(0 0 1) if $action eq 3;
    
    if ($id) {
      #code
    } else {
    my $item = GDB::Item->new(type => $type_cat->type, cat => $cat, name => $name, note => $note, descript => $descript, price => $price, old_price => $old_price,
                              main_img => $filename, action => $act[0], popular => $act[1], new_item => $act[2]);
    $item->save;
    my $item_id = $item->id;
    # записываем бонусы
    foreach my $b(@$bonus) {
      my $bonuses = GDB::ItemsBonu->new(bonus_id => $b, item_id =>$item_id);
      $bonuses->save;
    }
    
    }
    
    
    $self->redirect_to('/admin_item');
}

# fake
sub uploader {
  my $self = shift;
   my $json->{upload}{links} = {original => qq('')};
    $self->render_json($json);
}

sub resize_img {
    my ($img,$type,$upload_dir,$w,$h, $thumb) = @_;
    my $image = Image::Resize->new("$upload_dir/$img");
    my $gd = $image->resize($w, $h, 1) or return 'error';
    open(FH, '>',"$upload_dir/thumbnails/" . $img) if $thumb;
    open(FH, '>',"$upload_dir/" . $img) unless $thumb;
    binmode FH;
    print FH $gd->jpeg();
    close(FH);
    return $img;
}

1;
