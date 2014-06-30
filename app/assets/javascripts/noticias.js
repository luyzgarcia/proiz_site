function recarregarNoticias() {
	$('.categorias ul li:first-child').addClass('ativo');
	$('.categorias a').click(function(e) {
		e.preventDefault();
		$('.categorias ul li').removeClass('ativo');
		$(this).parent().addClass('ativo');
	});
	
	$('#noticias_buscar input').keyup(function () {
		if((this).value == ''){
			$('.wrapper_noticia_destaque').slideDown();
		}
	    $.get($('#noticias_buscar').attr('action'),
	    $('#noticias_buscar').serialize(), null, 'script');  
	 	 return false;   
 	});
  $('.link_noticias').bind('ajax:beforeSend',function() {
		//$.getScript(this.href);
		history.pushState(null, document.title, this.href);
	});
}

$(document).ready(function(){
});