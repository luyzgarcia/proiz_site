//= require touch_js/jquery-ui.touch.js
//= require slider_trabalhos

(function() {
	function mostrarIntro() {
		//Efeito na introdução inicial onde aparece palavra por palavra
		
		setTimeout(function() {
			//$('.home_wrapper h1 span').scrollable()
			//.on('scrollin',function(e, ui){
				$('#home_intro h1 span').each(function(i){
					$(this).delay(800 * i).animate({
						opacity: 1
					},500);
				});
				$('#home_intro .mensagem').delay(2000).animate({
					opacity: 1
				},function() {
					$('#home_intro .mensagem .circulo').addClass('mostrar');
				});
		//	});
		},1000);
		
	}
	jQuery(document).on("ready", mostrarIntro);
})();

(function() {
	function efeitoDivisores() {
		var scrollorama = $.scrollorama({blocks: '.corpo'});
		if(detectmob() == false) {
			scrollorama
					.animate('#header',{delay: 100,duration:250, property:'padding-top', end: '30px'})
					.animate('#header',{duration:250, property:'padding-bottom', end: '30px'});
		}
	}
	jQuery(document).on("ready", efeitoDivisores);
	//jQuery(window).on("resize",efeitoDivisores);
})();
(function() {
		function divisao_1() {
			if($('#intervalo1').scrollable()) {
				var scrollorama = $.scrollorama({blocks: '.corpo'});
				scrollorama.animate('#home_trabalhos',{delay:$(document).scrollTop()-100,duration:800, property:'margin-top', end: '-300px'});
				window.removeEventListener('scroll', divisao_1);
			};			
		}
		jQuery(document).on("ready", divisao_1);
		window.addEventListener('scroll', divisao_1 ,false);
})();
(function() {
		function divisao_2() {
			$('#intervalo2').scrollable().on('scrollin', function (e,ui) {
				var scrollorama = $.scrollorama({blocks: '.corpo'});
				//scrollorama.animate('#home_comotrabalhamos',{delay:$(document).scrollTop()-200,duration:600, property:'margin-top', end: '-300px'});
				scrollorama.animate('#intervalo2',{delay:$(document).scrollTop()-200,duration:900, property:'height',start:'300px', end: '0px'});
				window.removeEventListener('scroll', divisao_2);
			});	
		}
		jQuery(document).on("ready", divisao_2);
		window.addEventListener('scroll', divisao_2 ,false);
})();
(function() {
		function divisao_3() {
			$('#intervalo3').scrollable().on('scrollin', function (e,ui) {
				var scrollorama = $.scrollorama({blocks: '.corpo'});
				scrollorama.animate('#home_noticias',{delay:$(document).scrollTop()-200,duration:900, property:'margin-top',start:'0px', end: '-300px'});
				window.removeEventListener('scroll', divisao_3);
			});			
		}
		jQuery(document).on("ready", divisao_3);
		window.addEventListener('scroll', divisao_3 ,false);
})();
(function() {
	jQuery(document).on("ready", divisao_4);
	window.addEventListener('scroll', divisao_4 ,false);
})();


var mostroutrabalhos = false;
(function() {
		function mostrarComotrabalhamos() {
			if(detectmob() == false) {
				$('#home_comotrabalhamos').scrollable({ offset: { y: '70%' } })
			      .on('scrollin', function (e,ui) {
				      	//if(mostroutrabalhos) return false;
						$('#home_comotrabalhamos .mostrar').each(function(i){
							$(this).delay(400*i).animate({
								opacity: 1
							},700);
						});	
			      })
			      .on('scrollout', function (e, ui) { 
						//if(mostroutrabalhos) return false;
						
						$($("#home_comotrabalhamos .mostrar").get().reverse()).each(function(i){
							$(this).delay(200 * i).animate({
								opacity: 0
							},500);
						});
			      	}); 
			}else {
				$('#home_comotrabalhamos').scrollable({ offset: { y: '50%' } })
			      .on('scrollin', function (e,ui) {
				      	//if(mostroutrabalhos) return false;
						$('#home_comotrabalhamos .mostrar').each(function(i){
							$(this).delay(400*i).animate({
								opacity: 1
							},500);
						});	
			      })
			}
		}
		
		jQuery(document).on("ready", mostrarComotrabalhamos);
		//window.addEventListener('scroll', mostrarComotrabalhamos ,false);
	})();
	
	
(function() {
	function mostrarComoTrabalhamosFilhos() {
		//Efeito hover nos campos "como_Trabalhamos"
		//Caso seja deskop tera efeito no mouse click
		if(jQuery(window).width() > 1024) {
			$('#home_comotrabalhamos > div:not(#home_comotrabalhamos > div:first-child)').unbind('click');
			$('#home_comotrabalhamos > div:not(#home_comotrabalhamos > div:first-child)').mouseenter(function() {
				//$(this).find('.normal').hide();
				//$(this).find('.hover').css('display','inline-block');

				//$(this).find('.hover .titulo, .hover .texto').css('display','inline-block');
				//$(this).children('div').addClass('fundo_hover',1000);
			}).mouseleave(function(){
				//$(this).children('div').removeClass('fundo_hover',1500);
				//$(this).find('.hover').hide();
				//$(this).find('.normal').show();			
			});
		}else if(jQuery(window).width() > 481) {
			//Caso seja mobile (tablet, ipad) sera um efeito no on click
			//$('#home_comotrabalhamos > div:not(#home_comotrabalhamos > div:first-child)').unbind('mouseenter');
			//$('#home_comotrabalhamos > div:not(#home_comotrabalhamos > div:first-child)').unbind('mouseleave');
			
			var elementoativo = false;
			$('#home_comotrabalhamos > div:not(#home_comotrabalhamos > div:last-child)').click(function() {
				if(elementoativo == false) {
					elementoativo = true;
					$(this).find('.tb-info-frente').css({opacity:0});
					$(this).find('.tb-info-tras').css({opacity:1});
					
					var esse = $(this);
					$('#home_comotrabalhamos > div:not(#home_comotrabalhamos > div:last-child) ').each(function(i) {
						if(!$(esse).is($(this))) {
							$(this).animate({
								opacity: 0.55
							},400);
						}
					});
				}
			});
			$('#home_comotrabalhamos .tb-info-tras .voltar').click(function() {
				$(this).parents().eq(2).find('.tb-info-tras').css({opacity:0});
				$(this).parents().eq(2).find('.tb-info-frente').css({opacity:1});
				var esse = $(this);
				$('#home_comotrabalhamos > div:not(#home_comotrabalhamos > div:last-child) ').each(function(i) {
					if(!$(esse).is($(this))) {
						$(this).animate({
							opacity: 1
						},400);
					}
				});
				elementoativo = false;
				return false;
			});
		}
	}
	jQuery(document).on("ready", mostrarComoTrabalhamosFilhos);
	jQuery(window).on("resize",mostrarComoTrabalhamosFilhos);
})();

(function(){
	function mostrarNoticias() {
		//if(!noticias) {
		//if(!inProgress) {
		if(!detectmob()) {
			
			function checkbotao() {
				if($('.botao_noticias').visible()) {
					console.log('achou.');
					$('.botao_noticias').animate({
						opacity: '1'
					},800);	
				}		
				$('#home_noticias .item_noticia').each(function(i){
					if($(this).visible()) {
						$(this).addClass('mostra_noticia');
					}
				});
				
				$('#home_noticias .item_noticia').each(function(i){
					if(!$(this).visible()) {
						$(this).removeClass('mostra_noticia');
					}
				});		
			};
			$('#home_noticias').scrollable({ 
				in: function(e, ui) {
					console.log('in');
					window.addEventListener('scroll', checkbotao ,false);	
				},
				out: function(e, ui) {
					console.log('out');
					window.removeEventListener('scroll', checkbotao ,false);
				}
			});
		}else {
			//Caso seja mobile
			$('#home_noticias .noticias .item_noticia .link_noticia').click(function(e) {
				e.preventDefault();
			});
		}
	}
	//window.addEventListener('scroll', mostrarNoticias ,false);
	jQuery(document).on("ready", mostrarNoticias);
})();

$(document).ready(function(){
	
	$('#home_trabalhos .trabalhos_recentes .bt_esconder').click(function(e) {
		e.preventDefault();
		if(!$(this).hasClass('escondido')) {
			$(this).addClass('escondido');
			$('#home_trabalhos .trabalhos_recentes').animate({
				width: '30px'
			},500);
			$('#home_trabalhos .projetos_slider').animate({
				marginLeft: '30px'
			},500);
		}else {
			$(this).removeClass('escondido');
			$('#home_trabalhos .trabalhos_recentes').animate({
				width: '450px',
			},500);
			$('#home_trabalhos .projetos_slider').animate({
				marginLeft: '450px'
			},500);
		}
	});
	
	//$('.slider_menu input[type="range"]').on("change",moveSlider);
	
	/*function moveSlider() {
		//Pega a quantida de itens nop slide
		var tamanhotela = $('#home_trabalhos .projetos_slider .slider_imagens').width();
		var slideCount = $('#home_trabalhos .projetos_slider .slider_imagens ul li').length;
		var itemWidth = $('#home_trabalhos .projetos_slider .slider_imagens ul li').width();
		
		var sliderUlWidth = slideCount * itemWidth;
		
		var a =sliderUlWidth - tamanhotela;
		
		var max = this.max;
		a = a/max;
		var posleft = a * $(this).val();
		
		$('#home_trabalhos .projetos_slider .slider_imagens ul').css({left: - posleft});
	}
	*/
	
	$("#home_noticias .noticias .item_noticia").each(function() {
		if($(window).width() >= 480 && $(window).width() < 1024) {
			Hammer(this).on("tap", function(e) {
				
				$(this).addClass('mostrar_detalhe_materia');
			});
		}else if($(window).width() < 480) {
			$(this).find('.link_noticia').click(function(e) {
				e.preventDefault();
				});
			Hammer(this).on("tap", function(e) {
				e.preventDefault();
				$(this).addClass('mostrar_detalhe_materia');
			});
		}
	});
	
	$("#home_noticias .noticias .item_noticia .compartilhar_noticia").each(function() {
		Hammer(this).on("tap", function() {
			$(this).addClass('mostrar_compartilhar');	
		});
	});
	
    
	
	
	
	
	
	//Efeito para quado o circulo 'Continue' seja clicado a pagina desça até os trabalhos
	$('#home_intro .mensagem .continue').click(function(e) {
		$('html,body').animate({
	        scrollTop: $('#home_trabalhos').offset().top-330},
	    1200);
	});
	//Essa função faz com que todas as divs que tenha a classe wrapper tenham
	//o mesmo tamanho da janela 
	(function(){
		function wrapperInit(){
			if(jQuery(window).width() > 700) {
				var wrapper = jQuery('.wrapper'),
					ww = jQuery(window).width(),
					wh = jQuery(window).height(),
					wrapperHeight = wh;
				console.log(wrapperHeight);
				if(wrapperHeight < 750) {
					wrapper.css({'min-height':+(450)+'px'});
				}else {
				wrapper.css({'min-height':+(wrapperHeight-300)+'px'});
				}
				//wrapper.css({'min-height':'95%'});
				//alert(window.screen.width);
				//var wrapperVcenter = $('.wrapper ')
				
			}
		}
		
		jQuery(window).on("resize", wrapperInit);
		jQuery(document).on("ready", wrapperInit);
	})();
	
	
	
	//Adiciona o efeito no range das imagens
	(function(){
		function rangeSlider() {
			
			$( ".slider_menu .range" ).draggable({
	       		containment: "parent",
	        	axis: "x",
	        	drag: function(event, ui) {
	         		var trilhoBar = $('#container_range span').width();//largura barra de rolagem px
	         		var posBar = $('.slider_menu .range').position().left;//posição em px à margem esquerda da barra de rolagem
			        var largBar = $('.slider_menu .range').width();//Largura da barra de rolagem para compensar a porcentagem em relação ao trilho
			        var percBar = posBar/(trilhoBar-largBar);
			         
			        var tamanhotela = $('#home_trabalhos .projetos_slider .slider_imagens').width();
			        var qtdeImg = $('#home_trabalhos .projetos_slider .slider_imagens ul li').length;
			        var largImg = $('#home_trabalhos .projetos_slider .slider_imagens ul li').width();         
			        var largTotalImg = qtdeImg * largImg;         
			        var posImgMax = -(largTotalImg - tamanhotela - 1);        
			        var mostrar = percBar * posImgMax;        
			      
			        $('#home_trabalhos .projetos_slider .slider_imagens ul').css({left: mostrar});
	         
	        	}
	      	});
		}
		jQuery(document).on("ready", rangeSlider);
	})();
	
});

$(document).ready(function(){
	//console.log('iniciando...');
	
    /*
    $('#home_comotrabalhamos').scrollable({ offset: { y: '50%' } })
      .on('scrollin', function (e,ui) { console.log( 'in '); })
      .on('scrollout', function (e, ui) { console.log( 'out '); });*/ 
});
