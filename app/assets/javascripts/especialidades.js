//= require touch_js/jquery-ui.touch.js

//alert('iniciando...');


$(document).ready(function() {
	//alert('especialidades');
	configuraFormulario();
	defineTamanhoDescricaoItem();
	mostrarBoxEspecialidadesMin();

});

$(function() {
	$("#especialidades .especialidades_items .item .wrapper-descricao .descricao .fechar ").click(function(e) {
		e.preventDefault();
		$("#especialidades .especialidades_items .item .wrapper-descricao").animate({
			opacity: 0
		},300, function() {
			$(this).hide();
		});
	});
	var dragCheck = false;
	if($(window).width() > 480) {
		$('#especialidades .especialidades_items .item .item-child').unbind('click');
		$( "#especialidades .especialidades_items .item .item-child img" ).bind('mouseup', function() {
			if(!dragCheck) {
				var id = this.id;
				$('#especialidades .especialidades_items .item .wrapper-descricao').each(function() {
					var iditem = $(this).data('id');
					if(iditem == id) {
						$(this).show().css({'z-index':'10'});
						$(this).animate({
							opacity: 1
						},300);
					}
				});
				$("html, body").animate({ scrollTop: 150 }, "slow");				
			}
		});
		$('#especialidades .especialidades_items .item')
			.hover(function() {
				console.log('passando por cima....');
				$(this).find('img').animate({
					top: '35%'
				}, 200);
			},function() {
				//console.log('out');
				$(this).find('img').animate({
					top: '50%'
				}, 200);
			});
		$( "#especialidades .especialidades_items .item img" ).draggable({
			 						
			 start: function() {
			 },
			 drag: function() {
			 	$(this).css('z-index','9');
			 	dragCheck = true;
			 },
			stop:function(event, ui) {
				$('#especialidades .especialidades_drag_items').remove('drag_over');
				$(this).css('z-index','2');
				$(this).animate({
					top : '50%',
					left: 0
				}, 500);
				dragCheck = false;
			}
		});
		$( "#especialidades .especialidades_drag_items, .especialidades_drag_items_min" ).droppable({
			tolerance: 'pointer',
			over: function(e, ui) {
				$('.especialidades_drag_items_min').find('.wrapper_items').css('border', '3px solid #fff');
				$('.especialidades_drag_items').css('border', '3px solid #fff');
				
			},
			out: function(e, ui) {
				$('.especialidades_drag_items_min').find('.wrapper_items').css('border', 'none');
				$('.especialidades_drag_items').css('border', 'none');
			},
			drop: function(e, ui) {
				$('.especialidades_drag_items_min').find('.wrapper_items').css('border', 'none');
				$('.especialidades_drag_items').css('border', 'none');
				
				$('#especialidades .especialidades_drag_items, #especialidades .especialidades_drag_items_min').addClass('ocultar_frase');
				//Muda a cor do fundo
				$('#especialidades .especialidades_drag_items, #especialidades .especialidades_drag_items_min .wrapper_items').css('background','#78a22f');
				
				var possuiitem = false;
				$('.especialidades_drag_items > div > img').each(function() {
					
					var iditempassdo = ui.draggable[0].id;
					if(this.id == iditempassdo) {
						possuiitem = true;
						return false;
					}
				});
				if(!possuiitem) {
					//Adiciona a imagem no div grande
					$('.especialidades_drag_items > div').append(('<img src='+ui.draggable[0].src+' class="imagem_zero" id='+ui.draggable[0].id+'><span data-id='+ui.draggable[0].id+'></span></img>'));
					$('.especialidades_drag_items > div > img').last().animate( 600, function() {
						$('.especialidades_drag_items > div > img').last().removeClass('imagem_zero');
					});
					
					//adiciona no pequeno
					$('.especialidades_drag_items_min > div').append(('<img src='+ui.draggable[0].src+' class="imagem_zero" id='+ui.draggable[0].id+'><span data-id='+ui.draggable[0].id+'></span></img>'));
					$('.especialidades_drag_items_min > div > img').last().animate( 600, function() {
						$('.especialidades_drag_items_min > div > img').last().removeClass('imagem_zero');
					});
					
					
					var descricao = $(ui.draggable[0]).data('desc');
					$('.especialidades_formulario .especialidades_selecionadas ul').append('<li id='+ui.draggable[0].id+'>'+descricao+'</li>');		
					adicionarClick();					
				}	
			}
		});
	}
});
//(function() {
	function configuraFormulario() {
		//alert('adicionaCheckInputs');
		$('.formulario_padrao_1 input').each(function(index) {
		  $(this).keyup(function() {
			  checkFilled(this);
			  });
		});
		//$("#telefone").mask("(999) 9999-9999?9");
		$('#telefone').mask("(999) 9999-9999?9");
		
		$(".formulario_padrao_1").validate({
			rules:{
				nome:{ required: true },
				email:{ required: true, email: true },
				sobrenome:{ required: true },
				telefone:{required: true}			
			},
			
			messages:{
				nome:{
					required: "Digite seu nome"
				},
				sobrenome:{
					required: "Digite seu sobrenome"
				},
				email:{
					required: "Digite seu e-mail",
					email: "Digite um e-mail válido"
				},
				telefone:{
					required: "Digite seu telefone"
				},								
			},
			submitHandler: function(form) {
				var esp = "";
				$('.especialidades_selecionadas ul li').each(function(index) {
				  esp = esp+''+$(this).html()+' - ';
				});
				
				$('<input />').attr('type', 'hidden')
					.attr('name', "especialidades")
		          	.attr('value', esp)
		          	.appendTo('.formulario_padrao_1');
				loading();
				(form).ajaxSubmit();
			}
		});
	}
//	jQuery(document).on("ready", adicionaCheckInputs);
//})();
//Define o tamanho da descricao
//(function() {
	
	function defineTamanhoDescricaoItem() {
		if($(window).width() > 480) {
			setTimeout(function() {
				var elemento = $('#especialidades .wrapper_especialidades'); 
				var offsetelement = elemento.offset();
				var largura = elemento.width();
				var altura = elemento.height();
				
				$('#especialidades .especialidades_items .item .wrapper-descricao').each(function() {
					$(this).removeAttr('style');
					var offset = $(this).offset();
					var topo = offsetelement.top - offset.top;
					var esquerda = offsetelement.left - offset.left;
					$(this).css({
						top: topo,
						left: esquerda,
						width: largura,
						height: altura + 200
					});
				});
			}, 1000);
		}else {
			$('#especialidades .especialidades_items .item .item-child').unbind('click');
			$('#especialidades .especialidades_items .item .item-child').bind('click',function(e){
				elemento = this;
				if($(window).width() <= 480) {
					if(!$(elemento).hasClass('especialidade_detalhada')) {
						var descricao = $(elemento).find('.wrapper-descricao');
						descricao.removeAttr('style');
						
						var alturaitem = $(elemento).height();
						var alturadesc = descricao.children('.descricao').height();
						console.log('Altura: '+(alturaitem + alturadesc +30));
						$(elemento).animate({
							height : alturaitem + alturadesc +30
						}, 300, function() {
							descricao.css({
								opacity: 1,
								'z-index':'10'
							});
						});
						$(elemento).addClass('especialidade_detalhada');
					}else if($(elemento).hasClass('especialidade_detalhada')){
						var item = $(elemento);
						
						$(elemento).find('.wrapper-descricao').animate({
							opacity: 0,
							'z-index':'-5'
						}, 300, function() {
							item.removeClass('especialidade_detalhada');
							item.removeAttr('style');
							
						});
					}
				}
			});
		}
	}
//	jQuery(document).on("ready", defineTamanhoDescricaoItem);
//	jQuery(window).on("resize", defineTamanhoDescricaoItem);
	
//})();


//Verifica se o box grande esta visivel pra mostrar o box menor 
//(function(){
	function mostrarBoxEspecialidadesMin() {		
		//if($(window).width() > 480) {
			if($(window).width() <= 480) {
				$('#especialidades .especialidades_drag_items_min').fadeOut('slow');
			}else if(window.pageYOffset < 1000){
				$('#especialidades .especialidades_drag_items_min').fadeIn('slow');
			}
			
			$('#especialidades .especialidades_drag_items').scrollable({ offset: { y: '20%'} })
			.on('scrollin', function (e,ui) {
				
				//if( window.pageYOffset < $('#especialidades .especialidades_drag_items').offset().top) {
					$('#especialidades .especialidades_drag_items_min').fadeOut('slow');
				//}
			})
			
			.on('scrollout', function(e,ui) {
				//console.log('window Y: '+window.pageYOffset);
				//console.log($('#especialidades .especialidades_drag_items').offset().top);
				if( window.pageYOffset < $('#especialidades .especialidades_drag_items').offset().top) {
					//$('#especialidades .especialidades_drag_items_min').fadeIn('slow');
				}
			});
			
		
		//}
		/*jQuery(window).scroll(function() {
			console.log('window Y: '+window.pageYOffset);
			console.log($('#especialidades .especialidades_drag_items').offset().top);
			
			if( window.pageYOffset > $('#especialidades .especialidades_drag_items').offset().top) {
				$('#especialidades .especialidades_drag_items_min').fadeOut('slow');
			}
		});*/
	}
(function(){
	function ocultarBarra() {
		var topBarra = $('#especialidades .especialidades_drag_items').offset().top - 500;
		console.log(window.pageYOffset + '>' + topBarra);
		if(window.pageYOffset > topBarra){			
			$('#especialidades .especialidades_drag_items_min').fadeOut('fast');
		}else {
			$('#especialidades .especialidades_drag_items_min').fadeIn('normal');
		}
	}

	jQuery(document).on("ready", ocultarBarra);
	jQuery(window).on("scroll", ocultarBarra);
	
})();

function adicionarClick() {
	//Adiciona o click no item da caixa, este click ira remover o item;
	$('#especialidades .especialidades_drag_items span').click(function() {removeItemSelecionado(parseInt($(this).data('id')));});
	$('.especialidades_drag_items_min .wrapper_items span').click(function() {removeItemSelecionado(parseInt($(this).data('id')));});
	$("#especialidades .especialidades_formulario .especialidades_selecionadas ul li" ).click(function() {removeItemSelecionado(this.id);});
}

function removeItemSelecionado(idItem) {
	var iditem = idItem;
	//console.log(idItem);
	$('.especialidades_drag_items > div img, .especialidades_drag_items_min > div img').each(function() {
		if(iditem == -1 || iditem == this.id) {
			var itemremover = this;
			setTimeout(function(){
				$(itemremover).remove();
				verificaItemLista();
			}, 400);
			$(this).addClass('imagem_zero');
		}
	});
	$('.especialidades_drag_items > div span, .especialidades_drag_items_min > div span').each(function() {
		//console.log("entrou");
		var idspan = parseInt($(this).data('id'));
		if(iditem == -1 || idspan == iditem) {
			$(this).remove();
		}
	});
	$("#especialidades .especialidades_formulario .especialidades_selecionadas ul li" ).each(function(index) {
		if(iditem == -1 || iditem == this.id) {
			$(this).hide('fade',function() {$(this).remove();});
		}
	});				
}

function verificaItemLista() {
	if($('.especialidades_drag_items > div > img').length == 0) {
		$('#especialidades .especialidades_drag_items, .especialidades_drag_items_min').removeClass('ocultar_frase');
		$('#especialidades .especialidades_drag_items, #especialidades .especialidades_drag_items_min .wrapper_items').css('background','#97d346');
	}
}

function removerTodos() {
	removeItemSelecionado(-1);
	/*$('.especialidades_drag_items > div img, .especialidades_drag_items_min > div img').each(function() {
		var itemremover = this;
		setTimeout(function(){
			$(itemremover).remove();
				verificaItemLista();
		}, 400);
		$(this).addClass('imagem_zero');
	});
	$('.wrapper_items span').each(function() {
		$(this).remove();
	});
	$("#especialidades .especialidades_formulario .especialidades_selecionadas ul li" ).each(function(index) {
		$(this).hide('fade',function() {$(this).remove();});
	});*/
}
