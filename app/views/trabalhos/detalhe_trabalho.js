
$('#detalhe_modal').html("<%= escape_javascript(render 'detalhe_trabalho', :trab => @trabalho) %>")

$('#detalhe_modal').fadeIn('slow',function(){
	//Ao terminar de mostrar a janela, ele aumenta o tamanho da div interna para nao explodir a altura
	alturamodal = $('#trabalho').height();
	alturacontainer = $('.corpo_trabalhos').height();
	//alert(alturamodal);
	if(alturamodal > alturacontainer) {
		$('.corpo_trabalhos').css('height',alturamodal +10+'px');	
	}	
});
