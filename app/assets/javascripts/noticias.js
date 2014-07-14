function recarregarNoticias() {
	$('.categorias ul li:first-child').addClass('ativo');
	$('.categorias a').click(function(e) {
		e.preventDefault();
		$('.categorias ul li').removeClass('ativo');
		$(this).parent().addClass('ativo');
	});
	$('#noticias_buscar input').keyup(function () {
		delay(function(){
			console.log('enviando...');
      		if((this).value == ''){
				$('.wrapper_noticia_destaque').slideDown();
			}
		    $.get($('#noticias_buscar').attr('action'),
		    $('#noticias_buscar').serialize(), null, 'script');  
		 	 return false;   
	 	 }, 1000 );
 	});
 	
 	$('.link_noticias').bind('ajax:beforeSend',function() {
		loading();
	});
	$('.link_noticias').bind('ajax:complete ',function() {
		history.pushState(null, document.title, this.href);
		stoploading();
	});
}

var delay = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout (timer);
    timer = setTimeout(callback, ms);
  };
})();


$(document).ready(function(){
	//Coloca no url o endereco da noticia	
	recarregarNoticias();
});