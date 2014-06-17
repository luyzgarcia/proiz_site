
$(document).ready(function(){
	$(".fechar").on("click",function(e){
		e.preventDefault();
		$("#erros").fadeOut(300, function() { $("#erros").remove(); });
		return false;
	});
});


