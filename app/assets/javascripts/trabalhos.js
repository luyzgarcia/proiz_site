//= require grid/efeito_grid
//= require grid/imagesloaded.pkgd
//= require grid/masonry.pkgd.min

function esconder_detalhetrabalho(link) {
  $('.corpo_trabalhos').css('height','auto');
  $('#detalhe_modal').fadeOut();
  $('#detalhe_modal').html('');
}



function recarregar() {
	//fullloading();
	$('#trabalhos .menu_trabalhos li:first-child > a').addClass('ativo');
	$('#trabalhos .menu_trabalhos a').click(function(e) {
		e.preventDefault();
		$('#trabalhos .menu_trabalhos a').removeClass('ativo');
		$(this).addClass('ativo');
	});
	$('#trabalhos .titulo h1 a').click(function(e){
		$('#trabalhos .titulo h1').removeClass('trab_ativo');
		$(this).closest('h1').addClass('trab_ativo');
	});
	new AnimOnScroll(document.getElementById('grid'), {
		minDuration :0.4,
		maxDuration : 1,
		viewportFactor : 0.5
	});
	//stopfullloading();
}
/*$(document).ready(function() {
	recarregar();
});*/