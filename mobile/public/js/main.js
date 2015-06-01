$(function(){
    //Поиск
    var search_text = $('#search-text');
    var search_clear = $('#search-clear');

    search_text.keyup(function(){
        if ($(this).val()){
            search_clear.fadeIn(200);
        }
        else{
            search_clear.fadeOut(200);
        }
    })
    .focusin(function(){
        $(this).removeAttr('placeholder');
    });

    search_clear.click(function(){
        search_text.val('');
        $(this).fadeOut(200, function(){
            search_text.focus();
        });
    });

    //Сворачивание и разворачивание контента (карточка товара)
    $('.read-more_btn').click(function(){
        $read_more = $(this).parents('.read-more');

        if ($(this).hasClass('__closed')){
            $(this).text('Open');
        }
        else{
            $(this).text('Close');
        }
        $(this).toggleClass('__closed');
        $read_more.toggleClass('__closed');
    });

    //Ввод в поле только цифр
    $('[data-num="number"]').focusout(function(){
        if (isNaN($(this).val())){
            $(this).val('1');
        }
    });

    //Появление и скрытие строки поиска
    $('#search-btn').click(function(e) {
        var $message = $('#search');
        var self = $(this);

        if ($message.hasClass('is-hidden')) {
            $message.removeClass('is-hidden');
            self.addClass('is-hidden');

            var firstClick = true;
            $(document).bind('click.myEvent', function(e) {
                if (!firstClick && $(e.target).closest('#search').length == 0) {
                    $message.addClass('is-hidden');
                    self.removeClass('is-hidden');
                    $(document).unbind('click.myEvent');
                }
                firstClick = false;
            });
        }

        e.preventDefault();
    });
});