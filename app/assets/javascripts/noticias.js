function recarregarNoticias() {
	$('.categorias ul li:first-child').addClass('ativo');
	$('.categorias a').click(function(e) {
		e.preventDefault();
		$('.categorias ul li').removeClass('ativo');
		$(this).parent().addClass('ativo');
	});
	$('#noticias_buscar input').keyup(function () {
		console.log('digitando...');
		if((this).value == ''){
			$('.wrapper_noticia_destaque').slideDown();
		}
	    $.get($('#noticias_buscar').attr('action'),
	    $('#noticias_buscar').serialize(), null, 'script');  
	 	 return false;   
 	});
 	
 	$('.link_noticias').bind('ajax:beforeSend',function() {
		loading();
	});
	$('.link_noticias').bind('ajax:complete ',function() {
		history.pushState(null, document.title, this.href);
		stoploading();
	});
}

$(document).ready(function(){
	//Coloca no url o endereco da noticia	
	recarregarNoticias();
});