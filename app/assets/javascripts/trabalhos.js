// require grid/efeito_grid
// require grid/imagesloaded.pkgd
// require grid/masonry.pkgd.min
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

$(document).ready(function(){
	$('#trabalhos .menu_trabalhos a, .titulo h1 a, #grid .item a').bind('ajax:beforeSend',function() {
		loading();
	});
	$('#trabalhos .menu_trabalhos a, .titulo h1 a, #grid .item a').bind('ajax:complete ',function() {
		stoploading();
	});
	
	window.fbAsyncInit = function() {
		// Wait until FB object is loaded and initialized to refresh the embeds.
		//FB.init();
		FB.init({
		    appId      : '1501616463400377',
		    status     : true,
		    cookie     : true,
		    xfbml      : true
		});
		FB.XFBML.parse();
		$(document).trigger("facebook:ready");
	};
	window.fbReady = function(func){
    	alert('fbReady');
    };
    //recarregar();
	
});
/*$(document).live("facebook:ready", function(){
  alert('acebook:ready');
});
*/

/*$(document).ready(function() {
	recarregar();
});*/