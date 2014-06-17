$(document).on('page:load', function() {
	$('.item > li a').click(function() {
		if(!$(this).parent().hasClass('menu_ativo')) {
			$(this).parent().addClass('menu_ativo');
		}else {
			$(this).parent().removeClass('menu_ativo');
		}
		//$(this).children('.sub_menu').show();
	});
	$('.sub_menu li a').click(function() {
		$('.sub_menu li').each(function(a,d){
			$(this).removeClass('submenu_ativo');
		});
		if(!$(this).parent().hasClass('submenu_ativo')) {
			$(this).parent().addClass('submenu_ativo');
		}else {
			$(this).parent().removeClass('submenu_ativo');
		}
	});
});
