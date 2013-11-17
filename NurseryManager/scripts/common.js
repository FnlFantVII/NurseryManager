
$(init);

function init() {
    $('#menuIcon').click(toggleMenu);
    $('#login').hover(toggleLogin);
    $('nav').load('content/nav.html', navLoaded);
};

function navLoaded() {

    $('nav ul').find('li:first').addClass('current_page_item');

    $('nav a').click(function (e) {
        e.preventDefault();
        $('#Container').load(e.target.href + ' #Content');
        $('nav ul li').removeClass('current_page_item');
        $(e.target).parent().addClass('current_page_item');
    });
}

function toggleMenu() {
    if ($('nav').hasClass('closed')) {
        $('nav').toggleClass('closed');
        $('nav').slideDown("medium");
    } else {
        $('nav').slideUp("medium");
        $('nav').toggleClass('closed');
    }
};

function toggleLogin() {
    if ($('#lgnLogin').hasClass('closed')) {
        $('#lgnLogin').toggleClass('closed');
        $('#lgnLogin').slideDown("medium");
    } else {
        $('#lgnLogin').slideUp("medium");
        $('#lgnLogin').toggleClass('closed');
    }
};