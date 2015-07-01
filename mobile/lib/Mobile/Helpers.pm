package Mobile::Helpers;
use base 'Mojolicious::Plugin';
use common::sense;
#
# хелперы

#use Data::Dumper;

sub register {

      my ($self, $app) = @_;
# formatted date
   $app->helper( format_num  =>
     sub {
        my ($self, $num) = @_;
        $num =~ s/(?<=\d)(?=(\d{3})+(?!\d))/ /g;
        return $num;
        }  
    );   
# cut text
   $app->helper( cut_text  =>
     sub {
        my ($self, $text) = @_;
        $text = substr($text,0,30);
        return $text;
        }  
    );
}

1;
  
#########
