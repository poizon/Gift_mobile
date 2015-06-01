package Mobile::Controller::Index;
use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper;
# This action will render a template
sub welcome {
  my $self = shift;
  my $sliders = GDB::Slider::Manager->get_sliders(query =>[public => 1]);
  my $action = GDB::Item::Manager->get_items(query => [action => 1]);
  my $popular = GDB::Item::Manager->get_items(query => [popular => 1]);
  my $card_col = $self->session('card_col');
  $self->stash(sliders => $sliders,
               action => $action,
               popular => $popular,
               card_col => $card_col,
               );
  $self->render('index');
}

sub about_company {
  my $self = shift;
  my $card_col = $self->session('card_col');
  $self->stash(card_col => $card_col);
  $self->render('about_company');
}

sub contacts {
  my $self = shift;
  my $place = $self->param('place') || 0;
  $place =~ s/[^0-9]+//g;
  my $card_col = $self->session('card_col');
  if ($place) {
  my $cnt = GDB::Diler->new(id => $place);
  $self->redirect_to('/not_found') unless ($cnt->load(speculative => 1));
  $self->stash(cnt => $cnt,
               card_col => $card_col);
  $self->render('contact');
  } else {
  my $contacts = GDB::Diler::Manager->get_dilers(query =>[public => 1]);
  $self->stash(contacts => $contacts,
               card_col => $card_col);  
  $self->render('contacts');  
  }
  
}
# товары категории
sub items_by_cat {
  my $self = shift;
  my $categories = GDB::ItemsCat::Manager->get_items_cat(query => [type => 'I', sub_id => 0]);
  my $card_col = $self->session('card_col');
  $self->stash(title => 'Товары',
               url_title => 'items_by_cat',
               breadcrumbs => '',
               categories => $categories,
               card_col => $card_col);
  $self->render('categories');  
}

# услуги категории
sub services_by_cat {
  my $self = shift;
  my $card_col = $self->session('card_col');
  my $categories = GDB::ItemsCat::Manager->get_items_cat(query => [type => 'S']);
  $self->stash(title => 'Услуги',
               url_title => 'services_by_cat',
               breadcrumbs => '',
               categories => $categories,
               card_col => $card_col);
  $self->render('categories');  
}

#
sub shop {
  my $self = shift;
  my $name = $self->param('name');
  $name =~ s/[^aA-zZ,_]+//g;
  my $card_col = $self->session('card_col');
  my $cat_req = GDB::ItemsCat->new(chpurl => $name);
  my ($breadcrumbs, $title, $id, $url_title);
  if ($cat_req->load(speculative => 1)) {
      $breadcrumbs = $cat_req->descript;
      $title = ($cat_req->type eq 'I') ?  'Товары' : 'Услуги';
      $url_title = ($cat_req->type eq 'I') ?  'items_by_cat' : 'services_by_cat';
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
                 url_title =>  $url_title,
                 breadcrumbs => $breadcrumbs,
                 categories => $cat,
                 card_col => $card_col
                 );
    $self->render('categories'); 
  } else {
  
  my $items = GDB::Item::Manager->get_items(query => [cat => $id ]);
  # если товаров в данной категории несколько - выводим список товаров
        if ((scalar @$items)>1) {
        my $sub_name = GDB::ItemsCat::Manager->get_objects_from_sql(
          qq{SELECT descript,chpurl FROM giftec_site.items_cat where id=(select sub_id from giftec_site.items_cat where id='$id')}
          );
        
        $self->stash(title => $title,
                     url_title =>  $url_title,
                       breadcrumbs => $breadcrumbs,
                       sub_name => $sub_name->[0]->descript,
                       sub_url => $sub_name->[0]->chpurl,
                       items   => $items,
                       card_col => $card_col
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
  my $card_col = $self->session('card_col');
  $self->redirect_to('/not_found') unless ($item->load(speculative => 1));
  # определяем breadcrumbs
  my $title = ($item->type eq 'I') ?  'Товары' : 'Услуги';
  my $url_title = ($item->type eq 'I') ?  'items_by_cat' : 'services_by_cat';
  my $cat_url = $item->items_cat->chpurl;
  my $cat_name = $item->items_cat->descript;
  my $sub_cat = $item->items_cat->sub_id;
  my $main_cat = '';
  if ($sub_cat ne 0) {
  $main_cat = GDB::ItemsCat->new(id => $sub_cat);
  $main_cat = '' unless ($main_cat->load(speculative => 1));  
  }
  # определяем тех. характеристики
  my $spec = GDB::ItemsSpec::Manager->get_items_specs(query => [item_id => $item_id], sort_by => 'id');
  # определяем картинки
  my $images = GDB::ItemsImage::Manager->get_items_images(query => [item_id => $item_id, main => 0]);
  # определяем бонусы
  my $bonus = GDB::ItemsBonu::Manager->get_items_bonus(query => [item_id => $item_id]);
  # определяем сопутствующие товары
  my $related = GDB::ItemsRelated::Manager->get_items_related(query => [item_id => $item_id]);
  $self->stash(item => $item,
               title => $title,
               url_title =>  $url_title,
               main_cat => $main_cat,
               cat_url => $cat_url,
               cat_name => $cat_name,
               spec => $spec,
               images => $images,
               bonus  => $bonus,
               related => $related,
               card_col => $card_col
               );
  $self->render('goods_card'); 
}
# 
sub add_to_card {
  my $self = shift;
  my $item_id = $self->param('id');
  $item_id =~ s/[^0-9]+//g;
  # восстанавливаем № сессии (номер пакета)
  my $packet_id = $self->session('packet_id');
  unless($packet_id) {
  $packet_id = GDB::Card::Manager->get_card_count(query => [packet_id => {gt => 1 }], debug => 1);
  $packet_id+=1;
  }                                                     
   # получаем все товары по этому пакету
  my $items = GDB::Card::get_card(query => [packet_id => $packet_id, status => 'O']);# с закрытым статусом не учитываем

  if ($items->total) {# если есть данные по пакету -
    # проверяем есть ли такой товар в заказе - и если есть - увеличиваем кол-во на 1 шт.
    
    # если нет - инсертим новую позицию
  } else {
    # если нет пакета - добавляем строку и прописываем кол-во в сессию
    my $new_line = GDB::Card->new(packet_id => $packet_id, item_id => $item_id, qty => 1, status => 'O');
    $new_line->save;
    $self->session(packet_id => $packet_id);# сохраняем в сессию  номер пакета
    $self->session(card_col => 1); 
  }
  
  my $card_col = $self->session('card_col') || 0; # считаем кол-во
  $self->stash(
               card_col => $card_col,
               item     => $items
               );
  $self->render('card');
}

sub not_found {
  my $self = shift;
  #$self->session(card_col => 0);
  my $card_col = $self->session('card_col');
  $self->stash(card_col => $card_col);
  $self->render('not_found');
}


### SUBS ITERNAL ####
#sub _generate_packet_id {
#  my $current_id = GDB::Card::Manager->get_card_max();
#    return $current_id ? 1 : $current_id + 1;
#}

1;
