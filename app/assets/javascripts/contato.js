$(document).ready( function () {
	configuraFormulario();
});

function configuraFormulario() {
	$('.formulario_padrao_1 input[type="text"], .formulario_padrao_1 textarea').each(function(index) {
		$(this).keyup(function() {
			checkFilled(this);
			});
	});
	
	$('#telefone').mask("(999) 9999-9999?9");
		
	$("#form_contato").validate({
		rules:{
			nome:{ required: true },
			email:{ required: true, email: true },
			mensagem:{ required: true }			
		},
		
		messages:{
			nome:{
				required: "Digite seu nome"
			},
			email:{
				required: "Digite seu e-mail",
				email: "Digite um e-mail válido"
			},
			mensagem:{
				required: "Digite sua mensagem"
			}								
		},
		submitHandler: function(form) {
			loading();
			(form).ajaxSubmit();
		}
	});

	
}

/*(function() {
	function adicionaCheckInputs() {
		
	}
	jQuery(document).on("ready", adicionaCheckInputs);	
})();
*/

$(document).ready( function () {
	
		// Declare parallax on layers
		$('.parallax').each(function(index) {
		  $('img',this).parallax(
		  	{mouseport: $(this)},
			{xparallax: '100px', yparallax: '50px'},
			{xparallax: '6px', yparallax: '6px'}			
		  );	
		});
	
	
	/*$('#pa img').mousemove(function(e){
		console.log(e.pageX);
	    var amountMovedX = (e.pageX * -1 / 30);
	    var amountMovedY = (e.pageY * -1 / 4);
	    $(this).css('top', amountMovedY + 'px');
	    $(this).css('left',amountMovedX + 'px');
	});
	*/
	
	setTimeout( function() {
		$('.mensagem img').removeClass('img_effect');
	},2000);
});
