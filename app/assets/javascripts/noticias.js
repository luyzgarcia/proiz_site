function recarregar() {
	$('.categorias ul li:first-child').addClass('ativo');
	$('.categorias a').click(function(e) {
		e.preventDefault();
		$('.categorias ul li').removeClass('ativo');
		$(this).parent().addClass('ativo');
	});
}

$(document).ready(function() {
	recarregar();
	
	$('#noticias_buscar input').keyup(function () {
		if((this).value == ''){
			$('.wrapper_noticia_destaque').slideDown();
		}
	    $.get($('#noticias_buscar').attr('action'),
	    $('#noticias_buscar').serialize(), null, 'script');  
	 	 return false;   
  });  
	
});