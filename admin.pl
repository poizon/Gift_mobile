#!/usr/bin/env perl
use common::sense;
use Mojolicious::Lite;
use Digest::MD5 qw (md5_hex);
use POSIX qw(ceil);
use Image::Size;
use Image::Resize;

use Giftec::DB;
use Giftec::MjCat::Manager;
use Giftec::MjPage::Manager;
use Giftec::MjLang::Manager;
use Giftec::MjUser::Manager;
use Giftec::MjContact::Manager;
#use Data::Dumper;
# debug
#$Rose::DB::Object::Debug = 1; 
#$Rose::DB::Object::Manager::Debug = 1;
#

# глобальные настройки
my $cfg = plugin 'Config' => {file => 'app.conf'};
# размер загружаемых файлов
$ENV{MOJO_MAX_MESSAGE_SIZE} = $cfg->{max_size};
# db connect
Giftec::DB->registry->add_entry(%{$cfg->{db}});
# логирование
#my $log = Mojo::Log->new(
#   path  => $cfg->{logfile},
#   level => $cfg->{log_level},
#);

## дата для шаблона
helper pretty_date => sub {
    my ($self, $date) = @_;
    $date =~ /(\d{4})\-(\d{2})-(\d{2})/;
    return "$3.$2.$1";
};

helper is_admin => sub {
      my $self = shift;
      return 1 if($self->session('level') eq 10);
      return 0;
};

helper auth => sub {
    my ($self, $login,$passwd) = @_;
  # если есть сессия  - проверяем, возвращяем    
    if(my $id = $self->session('id')) {
      return Giftec::MjUser::Manager->check_session(id_user => $id);   
    }
    
    my $user_info = Giftec::MjUser::Manager->check_user(login => $login, password => $passwd);
    if ($user_info->[0]) {# admin admin
      $self->session(
                     id    => $user_info->[0],
                     level => $user_info->[1]);
      return 1;
    } else {
      return 0;
    }
};

helper strip_lc => sub {
    my ($self, $string) = @_;
    $string =~ s/\s/_/g;
    $string =~ s/\.//g;
    $string =~ s/['"]+//g;
    return lc($string);
};

# логин
get '/login' => sub {
  my $self = shift;
  $self->render('login');
};
# логинимся
post '/login' => sub {
    my $self = shift;
    my $login  = $self->param('login') || 0;
    my $passwd = $self->param('password') || 0;
    if ($self->auth($login,md5_hex($passwd))) {
      my $user = Giftec::MjUser->new(login => $login)->load;
      $user->last_log('now()');# логгируем время входа
      eval{$user->save;};
      $self->flash(message => flash_message('success','Успешный вход!'));
      $self->redirect_to('/manager');
    }
    else {
      $self->flash(message => flash_message('error','Неверные данные для доступа!'));
      $self->redirect_to('/login');  
    }
};

under sub {
  my $self = shift;
  return 1 if $self->auth;
  $self->flash(message => flash_message('error','Ошибка доступа!'));
  $self->redirect_to('/login');
};

# успешный вход
get '/manager' => sub {
	my $self = shift;
	$self->param('some') || 0;
        my $session = $self->session('id') || 0;
        my $level = $self->session('level') || 0;
	$self->render('/manager/index');
};

# добавить категорию
get '/manager/add_cat' => sub {
	my $self = shift;
	$self->param('id_cat') || 0;
        my $lang = Giftec::MjLang::Manager->get_lang;
        $self->stash(langs => $lang);
        # проверка уровня полномочий
        if($self->is_admin) {
          $self->render('/manager/add_cat');
        }
        else {
          $self->flash(message => flash_message('error', 'Нет прав администратора!'));
          $self->redirect_to('/manager/list_cat');
        }
};
# сохранить изменения
post '/manager/add_cat' => sub {
	my $self = shift;
        my $hash = $self->req->params->to_hash;
        my $id_cat = $self->param('id_cat') || 0;
        my ($cat,$alert);
        if($id_cat) {
          delete $hash->{id_cat};
          eval { $cat = Giftec::MjCat::Manager->update_cat(set => $hash, where => [id_cat => $id_cat]); };
          $alert = $@ ? 'error' : 'success';
        }
        else {
          $cat = Giftec::MjCat->new(id_lang => $hash->{id_lang},name_cat => $hash->{name_cat},url_cat => $hash->{url_cat}, show => 1);
          eval { $cat->save; };
           $alert = $@ ? 'error' : 'success';
        }        
        $self->flash(message => flash_message($alert, prepare_msg($alert,$@)));
	$self->redirect_to('/manager/list_cat');
};
# список категорий
get '/manager/list_cat' => sub {
	my $self = shift;
        my $cats = Giftec::MjCat::Manager->get_cat;
        $self->stash(cats => $cats);
	$self->render('/manager/list_cat');
};

# изменить категорию
get '/manager/edit_cat/:id' => [id => qr/\d+/]  => sub {
	my $self = shift;
        my $id_cat = $self->param('id');
        if($self->is_admin) {
          my $cat = Giftec::MjCat->new(id_cat => $id_cat)->load;
          my $lang = Giftec::MjLang::Manager->get_lang;
          $self->stash(cat   => $cat,
                       langs => $lang,
                       );
          $self->render('/manager/edit_cat');
        }
        else {
          $self->flash(message => flash_message('error', 'Нет прав администратора!'));
          $self->redirect_to('/manager/list_cat');
        }
};
# для ajax запросов категорий
get '/ajax/cats' => sub {
    my $self = shift;
    my $id_lang = $self->param('id_lang') || $cfg->{default_lang};
    my @json;
    my $cats = Giftec::MjCat::Manager->get_cat(query => [id_lang => $id_lang]);
    for my $cat(@$cats) {
      push(@json,{id => $cat->id_cat , name => $cat->name_cat});
    }
    my %return = (type =>'success', cats => \@json);
    $self->render(json => \%return);
};
# удалить категорию
get '/manager/del_cat/:id' => [id => qr/\d+/]  => sub {
	my $self = shift;
        # проверка уровня полномочий
        if($self->is_admin) {
          my $cat = Giftec::MjCat->new(id_cat =>  $self->param('id'));
          my $alert = $cat->delete ? 'success' : 'error';
          $self->flash(message => flash_message($alert, prepare_msg($alert)));
          $self->redirect_to('/manager/list_cat');
        }
        else {
          $self->flash(message => flash_message('error', 'Нет прав администратора!'));
          $self->redirect_to('/manager/list_cat');
        }
};
# добавить запись
get '/manager/add_page' => sub {
	my $self = shift;
        my $langs = Giftec::MjLang::Manager->get_lang;
        my $cats = Giftec::MjCat::Manager->get_cat(query => [id_lang => $cfg->{default_lang}]);
        $self->stash(langs => $langs,
                     cats  => $cats,
                     default_lang => $cfg->{default_lang});
	$self->render('/manager/add_page2');
};
# добавить дочернюю запись 
get '/manager/add_subpage/:page' => [page => qr/\d+/] => sub {
	my $self = shift;
        my $page = $self->param('page');
        my $p = Giftec::MjPage->new(id_pages => $page)->load;
        $self->stash(p    => $p,
                     page => $page
                     );
	$self->render('/manager/add_subpage2');
};

# сохранить изменения
post '/manager/add_page' => sub {
	my $self = shift;
        my $hash = $self->req->params->to_hash;
        
	# некоторые модификации
        $hash->{parent_pages} =  $self->param('parent_pages') || 0;
        $hash->{date_pages} = format_date($hash->{date_pages});
        $hash->{root_pages} =   $self->param('root_pages') || 'N';
	$hash->{publish}    =   $self->param('publish') || 'N';
	$hash->{body_pages}  = $self->param('body_pages') || '';
	$hash->{old_url} = $self->param('old_url') || $self->param('id_pages');# для SEO заглушка
	#$log->error($img_dom);
	
        my ($page,$alert);
        if(defined $hash->{id_pages}) {
          #eval { $page = Giftec::MjPage::Manager->update_pages(set => $hash, where => [id_pages => $hash->{id_pages}]);};
	  eval {
	    $page = Giftec::MjPage::Manager->update_pages( set => { id_lang =>$hash->{id_lang},
								    id_cat => $hash->{id_cat},
								    name_pages => $hash->{name_pages},
								    date_pages => $hash->{date_pages},
								    root_pages => $hash->{root_pages},
								    body_pages => $hash->{body_pages},
								    parent_pages => $hash->{parent_pages},
								    name_alt   => $hash->{name_alt},
								    publish    => $hash->{publish},
								    old_url    => $hash->{old_url},
								    keywords   => $hash->{keywords},
								     }, where => [id_pages => $hash->{id_pages}]);
	  };
          $alert = $@ ? 'error' : 'success';
        } else {
                $page = Giftec::MjPage->new(id_lang =>$hash->{id_lang},
                                      id_cat => $hash->{id_cat},
                                      name_pages => $hash->{name_pages},
                                      date_pages => $hash->{date_pages},
                                      root_pages => $hash->{root_pages},
                                      body_pages => $hash->{body_pages},
                                      parent_pages => $hash->{parent_pages},
				      name_alt   => $hash->{name_alt},
				      publish    => $hash->{publish},
				      keywords   => $hash->{keywords},
                                      );
                eval { $page->save; };
                $alert = $@ ? 'error' : 'success';
        }
        
        $self->flash(message => flash_message($alert, prepare_msg($alert,$@)));
	# если правим страницу - редиректим на нее же
	if(defined $hash->{id_pages}) {
	$self->redirect_to('/manager/edit_page/'. $hash->{id_pages});
	} else { # если добавили новую - то на список записей
	$self->redirect_to('/manager/list_page');    
	}
};
# список записей
get '/manager/list_page/:page/(*sort)' => {page => 1 , sort => 'a.date_pages'} => sub {
	my $self = shift;
        my $cur_page = $self->param('page');
        my $sort = $self->param('sort');
        my $pages = Giftec::MjPage::Manager->list_pages(limit_s => ($cur_page-1)*$cfg->{per_page},limit_end => $cfg->{per_page} ,sort => $sort);
        my $max = Giftec::MjPage::Manager->get_pages_count();
        $max = ceil($max/$cfg->{per_page});# расчитываем максимальное кол-во страниц. округляем в большую сторону
        my $pagging = [1..$max];
        $self->stash(pages   => $pages,
                     pagging => $pagging,
                     cur_page => $cur_page,
                     sort     => $sort
                     );
	$self->render('/manager/list_page');
};

# записи в виде дерева
get '/manager/tree_page/:p' => {p => 0} => sub {
	my $self = shift;
	my $id = $self->param('p') || 0;
	my $pages = Giftec::MjPage::Manager->get_pages(query => [parent_pages => $id], sort_by => 'date_pages DESC');
	$self->stash(pages => $pages);
	$self->render('/manager/tree_page');
	
};

# изменить запись
get '/manager/edit_page/:page' => [page => qr/\d+/] => sub {
	my $self = shift;
	my $page = Giftec::MjPage->new(id_pages =>  $self->param('page'))->load;
	my $langs = Giftec::MjLang::Manager->get_lang;
        my $cats = Giftec::MjCat::Manager->get_cat(query => [id_lang => $page->id_lang]);

        $self->stash(langs 	  => $langs,
                     cats   	  => $cats,
                     default_lang => $cfg->{default_lang},
                     page   	  => $page,
		     );
	$self->render('/manager/edit_page2');
	#$self->render('/manager/edit_page');
};
# удалить запись
get '/manager/del_page/:page' => [page => qr/\d+/] => sub {
	my $self = shift;
        my $page = Giftec::MjPage->new(id_pages =>  $self->param('page'));
        my $alert = $page->delete ? 'success' : 'error';
        $self->flash(message => flash_message($alert, prepare_msg($alert)));
        $self->redirect_to('/manager/list_page');
};
# добавить пользователя
get '/manager/add_user' => sub {
	my $self = shift;
        # проверка уровня полномочий
        if($self->is_admin) {
            $self->stash(levels => $cfg->{level});
            $self->render('/manager/add_user');
        }
        else {
          $self->flash(message => flash_message('error', 'Нет прав администратора!'));
          $self->redirect_to('/manager/list_user');
        }

};
# сохранить изменения
post '/manager/add_user' => sub {
	my $self = shift;
        my $id_user = $self->param('id_user') || 0;	
        my $login = $self->param('login') || 0;	
        my $email = $self->param('email') || 0;
        my $password = ($self->param('password') eq $self->param('repassword')) ? $self->param('password') : 0;
        my $level = $self->param('level') || 20;
        my $blocked = $self->param('blocked') || 'N';
        my $user;
        if($id_user) {
            $user = Giftec::MjUser->new(id_user => $id_user)->load;
            $user->login($login);
            $user->email($email);
            $user->password(md5_hex($password));
            $user->level($level);
            $user->blocked($blocked);    
        }
        else {
        $user = Giftec::MjUser->new(login => $login, email => $email, password => md5_hex($password), level => $level, blocked => $blocked);  
        }
        # вызовы на запись в eval
        eval { $user->save;};
        my $alert = $@ ? 'error' : 'success';
                $self->flash(message => flash_message($alert, prepare_msg($alert) . $@));
	$self->redirect_to('/manager/list_user');

};
# список пользователей
get '/manager/list_user' => sub {
	my $self = shift;
	my $users = Giftec::MjUser::Manager->list_user;
        $self->stash(users => $users);
	$self->render('/manager/list_user');
};
# изменить пользователя
get '/manager/edit_user/:id' => [id => qr/\d+/] => sub {
	my $self = shift;
         # проверка уровня полномочий
        if($self->is_admin) {
          my $user = Giftec::MjUser->new(id_user => $self->param('id'))->load;
            $self->stash(levels => $cfg->{level}, user => $user);
            $self->render('/manager/edit_user');
        }
        else {
          $self->flash(message => flash_message('error', 'Нет прав администратора!'));
          $self->redirect_to('/manager/list_user');
        }
};
# удалить пользователя
get '/manager/del_user/:id' => [id => qr/\d+/]  => sub {
	my $self = shift;
                # проверка уровня полномочий
        if($self->is_admin) {
              my $user = Giftec::MjUser->new(id_user =>  $self->param('id'));
              my $alert = $user->delete ? 'success' : 'error';
              $self->flash(message => flash_message($alert, prepare_msg($alert) ));
              $self->redirect_to('/manager/list_user');
        }
        else {
          $self->flash(message => flash_message('error', 'Нет прав администратора!'));
          $self->redirect_to('/manager/list_user');
        }
        
};
# добавить язык
get '/manager/add_lang' => sub {
	my $self = shift;
        if($self->is_admin) {
              $self->render('/manager/add_lang');
        }
        else {
          $self->flash(message => flash_message('error', 'Нет прав администратора!'));
          $self->redirect_to('/manager/list_lang');
        }
};
# сохранить изменения
post '/manager/add_lang' => sub {
	my $self = shift;
        my $id = $self->param('id_exist') || 0;
	my $id_lang = $self->param('id_lang');
        my $name_lang = $self->param('name_lang');
        my $lang;
        if($id) {
           $lang = Giftec::MjLang->new(id_lang =>$id)->load;
	   my $serv = $self->param('title') || '99';
           $lang->name_lang($name_lang);
	   $lang->title($serv);
	   $lang->news_cat($self->param('news_cat'));
	   $lang->serv_cat($self->param('serv_cat'));
        } else {
          $lang = Giftec::MjLang->new(id_lang =>$id_lang,name_lang => $name_lang);  
        }
        my $alert = $lang->save ? 'success' : 'error';
           $self->flash(message => flash_message($alert, prepare_msg($alert)));
	$self->redirect_to('/manager/list_lang');
};
# список языков
get '/manager/list_lang' => sub {
	my $self = shift;
        my $langs = Giftec::MjLang::Manager->get_lang;
        $self->stash(langs => $langs);
	$self->render('/manager/list_lang');
};
# изменить язык
get '/manager/edit_lang/:id' => [id => qr/[a-zA-Z]+/] => sub {
	my $self = shift;
        if($self->is_admin) {            
          my $lang = Giftec::MjLang->new(id_lang =>  $self->param('id'))->load;
          $self->stash(lang => $lang);
          $self->render('/manager/edit_lang');
        }
        else {
          $self->flash(message => flash_message('error', 'Нет прав администратора!'));
          $self->redirect_to('/manager/list_lang');
        }

};
# удалить язык
get '/manager/del_lang/:id'  => [id => qr/[a-zA-Z]+/] => sub {
	my $self = shift;
        if($self->is_admin) {            
          my $lang = Giftec::MjLang->new(id_lang =>  $self->param('id'));
          my $alert = $lang->delete ? 'success' : 'error';
          $self->flash(message => flash_message($alert, prepare_msg($alert)));
          $self->redirect_to('/manager/list_lang');
        }
        else {
          $self->flash(message => flash_message('error', 'Нет прав администратора!'));
          $self->redirect_to('/manager/list_lang');
        }
        
};
# выход
get '/manager/logout' => sub {
	my $self = shift;
	$self->session(expires => 1);
        $self->redirect_to('/login');
};

#post '/manager/uploader' => sub {
#    my $self = shift;
#    if ($self->req->is_limit_exceeded) {
#      my $json = qq({'error':'File size more than $cfg->{max_size} Kb', 'file':'Error','tmpfile':'','size':'0' });
#      $self->render(inline => $json);
#    } else {
#    my $file = $self->param('file');
#    my $size = $file->size;
#    my $name = $file->filename;
#    eval {$file->move_to("$cfg->{upload_dir}/$name");};
#    my $json = qq({'error':'', 'file':'/upload/$name','tmpfile':'','size':'$size' });
#    $self->render(inline => $json);
#    }
#  };

post '/manager/uploader' => sub {
    my $self = shift;
    if ($self->req->is_limit_exceeded) {
      my $json->{upload}{image} = { error => "File size more than $cfg->{max_size} Kb",
				    size => 0,
				    name => 'error'
				   };
      $json->{upload}{links} = {original => 'files_too_big'};
      $self->render_json({error => $json});
    } else {
    my $file = $self->param('image');
    #$log->warn(Dumper($file));
    my $size = $file->size;
    my $name = $file->name;
    my $image_type = $file->headers->content_type;
    my $filename = $file->filename;
    eval {$file->move_to("$cfg->{upload_dir}/$filename");};
    # ресайзим картинку
    $name = resize_img($filename,$image_type);
    # определяем размеры картинки
    my ($width, $height) = imgsize("$cfg->{upload_dir}/t/$name");
    
    my $json->{upload}{image} = {
			      name => $name,
			      type => $image_type,
			      width  => $width,
			      height => $height,
			      size => $size,
			      };
    $json->{upload}{links} = {original => qq(/upload/t/$name)};
    
    $self->render_json($json);
    }
    
  };

# поиск по id записи
get '/manager/search' => sub {
    my $self = shift;
    my $id = $self->param('id') || 0;
    $id =~ s/[^0-9+]//g;
    $self->redirect_to("/manager/edit_page/$id");
};

# список контактов с сайта
get '/manager/list_cnt' => sub {
	my $self = shift;
	my $cnt = Giftec::MjContact::Manager->list_contacts;
        $self->stash(cnt => $cnt);
	$self->render('/manager/list_cnt');
};
# удалить контакт
get '/manager/del_cnt/:id'  => [id => qr/[0-9]+/] => sub {
	my $self = shift;
        if($self->is_admin) {            
          my $cnt = Giftec::MjContact->new(id_contacts =>  $self->param('id'));
          my $alert = $cnt->delete ? 'success' : 'error';
          $self->flash(message => flash_message($alert, prepare_msg($alert)));
          $self->redirect_to('/manager/list_cnt');
        }
        else {
          $self->flash(message => flash_message('error', 'Нет прав администратора!'));
          $self->redirect_to('/manager/list_cnt');
        }
        
};

app->secret($cfg->{secret});
app->log->level($cfg->{log_level});
app->sessions->default_expiration($cfg->{session_exp});
app->start;


###
sub prepare_msg {
  my $type = shift;# получаем success или error
  my $detail = shift || '';
  my %msg = (success => 'Успешно выполнено!', error => 'Ошибка выполнения!' . ' ' . $detail);
  return $msg{$type};
}

# дата для вставки в БД
sub format_date {
    my $date = shift || return '0000-00-00';
    $date =~ /(\d{2})\.(\d{2})\.(\d{4})/;
    return "$3-$2-$1";
}


sub flash_message {
  my ($type,$msg) = @_;
  return qq(
 <div class="span4 offset4">
        <div class="alert alert-$type">
        $msg
        </div>
  </div>  
  );
}

# изменяем размер изображения
sub resize_img {
    my ($img,$type) = @_;
    my $image = Image::Resize->new("$cfg->{upload_dir}/$img");
    my $gd = $image->resize(200, 200, 1) or return 'error';
    open(FH, '>',"$cfg->{upload_dir}/t/" . $img);
    binmode FH;
    print FH $gd->jpeg();
    close(FH);
    return $img;
}

## in develop
#sub highlight_image {
#	my $self = shift;
#    	my $dom = Mojo::DOM->new();
#	#my $in = $dom->parse($self->param('body_pages'));
#	#$log->error(Dumper($in));
#	my $img_dom = $dom->parse($self->param('body_pages'))->at('img');
#	# получаем src картинки
#	my $link = $img_dom->{src};
#	# меняем путь
#	$link =~ s/t\///;
#	$link = qq(<a href="$link" class="highslide" onclick="return hs.expand(this)">$img_dom</a>);
#	return $dom->parse($self->param('body_pages'))->at('img')->replace($link)->root;
#}
