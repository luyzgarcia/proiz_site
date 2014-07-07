//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree ./admin
//= require tinymce

function enable_field(elemento) {
	$(elemento).css('background',"#004961");
	$(elemento).parents('.item_info_detalhe').css("background","#fff");
	$(elemento).parent().find(".bloqueado, .bloqueado input, .bloqueado textarea").prop('disabled', false);
	$(elemento).parent().find(".bloqueado").css('pointer-events', 'all');
	$(elemento).parent().find(".bloqueado").removeClass('bloqueado');
}

function subir_nivel(e) {
	//alert($(e).parents('.form_many').prev().html());
	mover = $(e).parents('.form_many');
	anterior = $(e).parents('.form_many').prev();
	if(anterior.hasClass('form_many')) {
		mover.insertBefore(anterior);
	}
	atualizar_ordem($(e).parents('.lista_dependentes'));
}
function descer_nivel(e) {
	mover = $(e).parents('.form_many');
	proximo = $(e).parents('.form_many').next();
	if(proximo.hasClass('form_many')) {
		mover.insertAfter(proximo);
	}
	atualizar_ordem($(e).parents('.lista_dependentes'));
	
}
function atualizar_ordem(item) {
	$(item.find('.form_many')).each(function(a,k) {
		$(this).find('.ordem_imagem').val(a+1);		
	});
}

function remove_fields(link) {	
	//alert($(link).prev("input[type=hidden]"));
	$(link).prev("input[type=hidden]").val("1");
	//alert('pasosu');
	//$(link).hide();
	$(link).parents('.form_many').fadeOut('slow');
	return false;
}
function adicionar_ficha(link) {
	/*$chave = $(link).parent(".form_ficha").find('.ficha_upload .chave');
	
	$chave.find('input').hide();
	$chave_desc = $chave.find('input').val();
	$chave.append($chave_desc);
	
	$valor = $(link).parent(".form_ficha").find('.ficha_upload .valor');
	
	$valor.find('input').hide();
	
	$conteudo = $valor.find('input').val();
	$valor.append($conteudo);
	*/
	
	
	//$(link).parent('.form_many').find('input').prop('disabled', true);
	
	
	//$(link).parent('.form_many').find('input').addClass('bloqueado');
	$(link).parent(".form_ficha").find('.adicionar_foto').hide();
	$('.bt_adicionar_nova_ficha').show();
	
	$(link).parent(".form_ficha").addClass('item_many');
	
	$(link).parent(".form_ficha").find(".ordem").removeClass('escondido');
	$(link).parent(".form_ficha").find(".ordem a").removeClass('bloqueado');
	
	//$(link).parent(".form_ficha").append('<a href="#" onclick="enable_field(this); return false;">EDIT</a>');
	//$(link).parent(".form_ficha").append('<a href="#" onclick="remove_fields(this); return false;">Remover</a>');
	$(link).parent(".form_ficha").find(".ordem").append('<a href="#" class="bt_excluir_1" onclick="remove_fields(this); return false;"></a>');
	
	$(link).parent(".form_ficha").appendTo(".lista_fichas");
	
	atualizar_ordem($('.lista_fichas'));	
}

function adicionar_foto(link) {
	
	$imagem = $(link).parent(".form_imagens").find('.imagem_upload .imagem');
	
	//$imagem.find('input').hide();
	console.log($imagem.find('.img_selecionada img'));
	$imagem.find('img').removeClass('escondido');
	
	$texto = $(link).parent(".form_imagens").find('.imagem_upload .descricao');
	
	//$texto.find('textarea').prop('disabled', true);
	$texto.find('textarea').addClass('bloqueado');
	
	//$conteudo = $texto.find('textarea').val();
	//$texto.append('<p>'+$conteudo+'</p>');
	
	$(link).parent(".form_imagens").find('.adicionar_foto').hide();
	
	$('.bt_adicionar_nova_foto').show();
	
	$(link).parent(".form_imagens").find(".ordem").removeClass('escondido');
	$(link).parent(".form_imagens").find(".ordem").append('<a href="#" class="bt_excluir_1" onclick="remove_fields(this); return false;"></a>');
	//$(link).parent(".form_imagens").append('<a href="#" onclick="enable_field(this); return false;">EDIT</a>');
	
	$(link).parent(".form_imagens").appendTo(".lista_imagens ");
	//alert('hei');
	atualizar_ordem($('.lista_imagens'));
}

function preview_image(e) {
	var oFReader = new FileReader();
    oFReader.readAsDataURL(e.files[0]);
    elemento = $(e).parents('.imagem');
    oFReader.onload = function (oFREvent) {
        $(elemento).find('.preview_image img').attr('src',oFREvent.target.result);
    };
}

function preview_imagem2(e) {
	var oFReader = new FileReader();
    oFReader.readAsDataURL(e.files[0]);
    $(e).parents('.imagem').find('img').remove();
    oFReader.onload = function (oFREvent) {
        $(e).parents('.imagem').find('.img_selecionada').html('<img src="'+oFREvent.target.result+'" >');
    };
}



function preview_imagem(e) {
	
	var filename = $(e).val();
    var lastIndex = filename.lastIndexOf("\\");
    if (lastIndex >= 0) {
       filename = filename.substring(lastIndex + 1);
    }
    
	
	var oFReader = new FileReader();
    oFReader.readAsDataURL(e.files[0]);
    
    oFReader.onload = function (oFREvent) {
    	$(e).closest('div').find('.caminho').html(filename);
        $(e).parents('.imagem').find('.img_selecionada').html('<img src="'+oFREvent.target.result+'">');
    };
}

function add_fields(link, association, content) {
	$(link).parent().hide();
	var new_id = new Date().getTime();
	var regexp = new RegExp("new_" + association, "g");
	//alert(association);
	//alert(content);
	//alert($(link).parents('.nova_imagem').html());
	$(link).parents('.item_info_detalhe').find('.nova').html(content.replace(regexp, new_id));
	//$('.adicionar_imagem').html(content.replace(regexp, new_id));
	
	//$(link).before(
	//	content.replace(regexp, new_id)
	//);
}


$(document).mouseup(function (e)
{
    var container = $(".lista_cadastrados");
	$(".lista_cadastrados").removeClass('item_foco');
    if (container.is(e.target) // if the target of the click isn't the container...
        || container.has(e.target).length >= 0) // ... nor a descendant of the container
    {
    	$(e.target).parents('.lista_cadastrados').addClass('item_foco');
    }
    
});


function checkFilled(element) {
    var inputVal = element.value;
    if (inputVal!= "") {
    	element.style.backgroundColor = "#fdba31";
        element.style.color = "#004961";
    }else {
    	element.style.backgroundColor = "#004961";
    	element.style.color = "#8dc63f";
    }
}