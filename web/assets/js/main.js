$(document).ready( function () {

    var $eq = $('.tr_eq'),
        $btnMobile = $('.open_menu'),
        $openProjects = $('.open_projects');

    $btnMobile.on('click', function () {
        const   _this       = $(this),
                _target     = $('nav.menu'),
                _t          = $('aside.sidebar');

        _this.children().toggleClass('fa-bars fa-times');
        _target.delay(150).toggleClass('menu_opened');
        _t.removeClass('menu_opened');
    });

    $openProjects.on('click', function () {
        const _target = $('aside.sidebar');
        _target.toggleClass('menu_opened');
    });

    /* BEGIN: MENU MOBILE */
    $btnMobile.on( 'click', function () {
        $('.menu_mobile').toggleClass('opened');
    });
    /* END: MENU MOBILE */

    /* BEGIN: PARALLAX */
    $('header.tr_header_home').each(function(){
        var $obj = $(this);

        $(window).scroll(function() {
            var yPos = -($(window).scrollTop() / $obj.data('speed'));

            var bgpos = '50% '+ yPos + 'px';

            $obj.css('background-position', bgpos );

        });
    });
    /* END: PARALLAX */

    /* BEGIN: EQUAL HEIGHT */
    var options = {
        byRow: false,
        property: 'height',
        target: null,
        remove: false
    };

    if(window.matchMedia('(min-width: 768px)').matches){
        $eq.matchHeight(options);
    }
    /* END: EQUAL HEIGHT */

});