
$(document).ready(function(){
	$(".fechar").on("click",function(e){
		e.preventDefault();
		$("#erros").fadeOut(300, function() { $("#erros").remove(); });
		return false;
	});
});

function subir_ordem(e) {
	mover = $(e).parents('tr');
	anterior = $(e).parents('tr').prev();
	//if(anterior.hasClass('form_many')) {
		mover.insertBefore(anterior);
	//}
	//atualizar_ordem($(e).parents('.lista_dependentes'));
}
function descer_ordem(e) {
	mover = $(e).parents('tr');
	proximo = $(e).parents('tr').next();
	//if(proximo.hasClass('form_many')) {
		mover.insertAfter(proximo);
	//}
	//atualizar_ordem($(e).parents('.lista_dependentes'));
	
}

/*function atualizar_ordem(item) {
	$(item.find('tr')).each(function(a,k) {
		$(this).find('.ordem_imagem').val(a+1);		
	});
}*/