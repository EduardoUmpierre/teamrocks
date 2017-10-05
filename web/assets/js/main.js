
var MaskBehavior = function (val) {
    return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
},
maskOptions = {
    onKeyPress: function(val, e, field, options) {
        field.mask(MaskBehavior.apply({}, arguments), options);
    }
};


$(document).ready( function () {

    var nav = $('.navbar.navbar-default'),
        $eq = $('.tr_eq'),
        $btnMobile = $('.btn-nav');

    /* BEGIN: MENU MOBILE */
    $btnMobile.on( 'click', function () {
       $('.menu_mobile').toggleClass('opened');
    });
    /* END: MENU MOBILE */

    /* BEGIN: AFFIX */
    nav.affix({
       offset: {
           top: 150
       }
    });
    /* END: AFFIX */

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

    /* BEGIN: LABEL PARA INPUT */
    var inputs = $('input, textarea');
    inputs.blur(function () {
        if ($(this).val()) {
            $(this).addClass('used');
        }
        else {
            $(this).removeClass('used');
        }
    });
    /* END: LABEL PARA INPUT */

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