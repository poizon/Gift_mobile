package Mobile::Controller::Index;
use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper;
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
  my $categories = GDB::ItemsCat::Manager->get_items_cat(query => [type => 'I', sub_id => 0]);
  $self->stash(title => 'Каталоги товаров',
               breadcrumbs => '',
               categories => $categories);
  $self->render('categories');  
}

# услуги категории
sub services_by_cat {
  my $self = shift;
  my $categories = GDB::ItemsCat::Manager->get_items_cat(query => [type => 'S']);
  $self->stash(title => 'Каталог услуг',
               breadcrumbs => '',
               categories => $categories);
  $self->render('categories');  
}

#
sub shop {
  my $self = shift;
  my $name = $self->param('name');
  $name =~ s/[^aA-zZ,_]+//g;
  my $cat_req = GDB::ItemsCat->new(chpurl => $name);
  my ($breadcrumbs, $title, $id);
  if ($cat_req->load(speculative => 1)) {
      $breadcrumbs = $cat_req->descript;
      $title = ($cat_req->type eq 'I') ?  'Каталоги товаров' : 'Каталог услуг';
      $id = $cat_req->id;
  } else {
    $self->redirect_to('/not_found');
  }
  
  # проверяем есть ли у категории подкатегории
  my $subcat = GDB::ItemsCat::Manager->get_items_cat_count(query => [sub_id => $id]);
  # если есть подкатегории - показываем их
  if ($subcat and ($id ne 0)) {
    my $cat = GDB::ItemsCat::Manager->get_items_cat(query => [sub_id => $id]);
    $self->stash(title => $title,
                 breadcrumbs => $breadcrumbs,
                 categories => $cat);
    $self->render('categories'); 
  } else {
  
  my $items = GDB::Item::Manager->get_items(query => [cat => $id ]);
  # если товаров в данной категории несколько - выводим список товаров
        if ((scalar @$items)>1) {
        my $sub_name = GDB::ItemsCat::Manager->get_objects_from_sql(
          qq{SELECT descript,chpurl FROM giftec_site.items_cat where id=(select sub_id from giftec_site.items_cat where id='$id')}
          );
        
        $self->stash(title => $title,
                       breadcrumbs => $breadcrumbs,
                       sub_name => $sub_name->[0]->descript,
                       sub_url => $sub_name->[0]->chpurl,
                       items   => $items,
                      );
        
        $self->render('goods');  
        }# если товар один - сразу показываем карточку товара
        else {
          $self->redirect_to('/item_card/'.$items->[0]->id);  
        }
  
  }
  
}


sub item_card {
  my $self = shift;
  my $item_id = $self->param('id');
  $item_id =~ s/[^0-9]+//g;
  my $item = GDB::Item->new(id => $item_id);
  $item->load;
  $self->stash(item => $item);
  $self->render('goods_card'); 
}

sub not_found {
  my $self = shift;
  $self->render('not_found');
}

1;
