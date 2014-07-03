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
	var grid = document.getElementById('grid');
	if(grid != null) {
		new AnimOnScroll(grid, {
			minDuration :0.4,
			maxDuration : 1,
			viewportFactor : 0.5
		});
	}
	$('#trabalhos .menu_trabalhos a, .titulo h1 a, #grid .item a, .titulo a').bind('ajax:beforeSend',function() {
		loading();
		$('.wrapper_carregando > span').css('width', '0');
		
		
	});
	$('.titulo h1 a, #grid .item a, .titulo a').bind('ajax:beforeSend',function() {
		loading();
		history.pushState(null, document.title, this.href);
	});
	$('#trabalhos .menu_trabalhos a, .titulo h1 a').bind('ajax:complete ',function() {
		stoploading();
	});
	
	//stopfullloading();
}

function adicionaClickItemsGrid() {
	$('#grid .item a').bind('click',function() {
		loading();
		history.pushState(null, document.title, this.href);
	});
}

function adicionaEfeitoImagensTrabalho() {
	
	$('#detalhe_modal img').css('opacity','0');
	//$('#detalhe_modal img').each(function(index) {
	/*  $('#detalhe_modal .image-info img').scrollable({ offset: { y: '70%'} })
		.on('scrollin', function (e,ui) {
			//console.log(this);
			$(this).css('opacity','1');
    	})
    	.on('scrollout', function(e,ui) {
    		console.log('saiu');
		});
	//});
	*/
	window.addEventListener('scroll', function() {
		$('#detalhe_modal img').each(function(index) {
			if($(this).visible(true, false)) {
				$(this).delay(500).animate({
					opacity: 1	
				}, 700);
			}
		});
	} ,false);	
	
}

$(document).ready(function(){
	recarregar();
	
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
		//$(document).trigger("facebook:ready");
	};
	//window.fbReady = function(func){
   // 	alert('fbReady');
   // };
    //recarregar();
    
    
	
});