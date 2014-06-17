function mostrarIntro() {
	//Efeito na introdução inicial onde aparece palavra por palavra
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
}


(function() {
	function efeitoDivisores() {
		var scrollorama = $.scrollorama({blocks: '.corpo'});
		if(detectmob() == false) {
			scrollorama
					.animate('#header',{delay: 100,duration:250, property:'padding-top', end: '30px'})
					.animate('#header',{duration:250, property:'padding-bottom', end: '30px'});
		}
		
		/*var tamanhojanela = $(window).width();
		var scrollTop     = $(window).scrollTop(),
    		elementOffset = $('#home_comotrabalhamos').offset().top,
    		distance      = (elementOffset - scrollTop);
    		
    	console.log('top do elemento'+$('#home_comotrabalhamos').position().top);
		console.log('discancia do elemento: '+distance);
		console.log('tamanho da janela: '+tamanhojanela);
		alert(($('#home_comotrabalhamos').position().top)-tamanhojanela+300);
		alert(($('#home_noticias').position().top)-tamanhojanela+300);
		scrollorama
				.animate('#home_trabalhos',{delay:0,duration:550, property:'margin-top', end: '-300px'})
				.animate('#home_comotrabalhamos',{delay: ($('#home_comotrabalhamos').position().top)-tamanhojanela+300,duration:550, property:'margin-top', end: '-300px'})
				.animate('#home_noticias',{delay: ($('#home_noticias').position().top)-tamanhojanela+300,duration:550, property:'margin-top', end: '-300px'});
		
		if(jQuery(window).height() >= 800 && jQuery(window).width() > 1024) {
			console.log('1');
			scrollorama
				.animate('#home_trabalhos',{duration:700, property:'margin-top', end: '-300px'})
				.animate('#home_comotrabalhamos',{delay: 850,duration:550, property:'margin-top', end: '-300px'})
				.animate('#home_noticias',{delay: 2500,duration:550, property:'margin-top', end: '-300px'})
				.animate('#home_rodape',{delay: 3500,duration:550, property:'margin-top', end: '-300px'});
		}else if(jQuery(window).height() > 350 && $(window).width() > 1025 && detectmob() == false){
			console.log('2');
			scrollorama
				.animate('#home_trabalhos',{duration:1000, property:'margin-top', end: '-300px'})
				.animate('#home_comotrabalhamos',{delay: 1400,duration:550, property:'margin-top', end: '-300px'})
				.animate('#home_noticias',{delay: 2400,duration:550, property:'margin-top', end: '-300px'})
				.animate('#home_rodape',{delay: 3600,duration:550, property:'margin-top', end: '-300px'});
		}else if(jQuery(window).width() < 500 && detectmob() != true){
			console.log('3');
			scrollorama
				.animate('#home_trabalhos',{duration:500, property:'margin-top', end: '-300px'})
				.animate('#home_comotrabalhamos',{delay: 600,duration:550, property:'margin-top', end: '-300px'})
				.animate('#home_noticias',{delay: 1300,duration:550, property:'margin-top', end: '-300px'})
				.animate('#home_rodape',{delay: 2400,duration:550, property:'margin-top', end: '-300px'});
			}
		*/
		//var controller = $.superscrollorama();
		// individual element tween examples
		//controller.addTween('#header', TweenMax.from( $('#header'), .5, {css:{'padding-top': 30}}));
		//controller.pin($('#header',1000), {
		//	anim: (new TimelineLite()) 
		//	.append(
		//		TweenMax.to($('#header'), .5,{css:{'padding-top': 35}})
		//	)
		//});
		
		//controller.addTween('#header', TweenMax.fromTo( $('#header'), 1.25, {css:{'padding-top':85}, immediateRender:true, ease:Quad.easeInOut}, {css:{'padding-top':35}, ease:Quad.easeInOut}),0, 100);
	}
	jQuery(document).on("ready", efeitoDivisores);
	//jQuery(window).on("resize",efeitoDivisores);
})();
(function() {
		function divisao_1() {
			if($('#intervalo1').visible(true, true)) {
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
			if($('#intervalo2').visible(true, true)) {
				var scrollorama = $.scrollorama({blocks: '.corpo'});
				//scrollorama.animate('#home_comotrabalhamos',{delay:$(document).scrollTop()-200,duration:600, property:'margin-top', end: '-300px'});
				scrollorama.animate('#intervalo2',{delay:$(document).scrollTop()-200,duration:900, property:'height', end: '0px'});
				window.removeEventListener('scroll', divisao_2);
			};			
		}
		jQuery(document).on("ready", divisao_2);
		window.addEventListener('scroll', divisao_2 ,false);
})();
(function() {
		function divisao_3() {
			if($('#intervalo3').visible(true, true)) {
				var scrollorama = $.scrollorama({blocks: '.corpo'});
				scrollorama.animate('#home_noticias',{delay:$(document).scrollTop()-200,duration:900, property:'margin-top', end: '-300px'});
				window.removeEventListener('scroll', divisao_3);
			};			
		}
		jQuery(document).on("ready", divisao_3);
		window.addEventListener('scroll', divisao_3 ,false);
})();
(function() {
		function divisao_4() {
			if($('#intervalo4').visible(true, true)) {
				var scrollorama = $.scrollorama({blocks: '.corpo'});
				scrollorama.animate('#home_rodape',{delay:$(document).scrollTop(),duration:700, property:'margin-top', end: '-300px'});
				window.removeEventListener('scroll', divisao_4);
			};			
		}
		jQuery(document).on("ready", divisao_4);
		window.addEventListener('scroll', divisao_4 ,false);
})();


var mostroutrabalhos = false;
(function() {
		function mostrarComotrabalhamos() {
			if(detectmob() != false) {
				if( $('#home_comotrabalhamos .mostrar').visible()) {
					if(mostroutrabalhos) return false;
					
					$('#home_comotrabalhamos .mostrar').each(function(i){
						$(this).delay(400*i).animate({
							opacity: 1
						},700);
					});
					/*setTimeout( function() {
						mostroutrabalhos = true;
						window.removeEventListener('scroll', mostrarComotrabalhamos);
						window.addEventListener('scroll', ocultaComotrabalhamos ,false);
						
					}, 3000 );*/
				};				
			}else {
				if( $('#home_comotrabalhamos > div').visible()) {
					if(mostroutrabalhos) return false;
					
					$('#home_comotrabalhamos .mostrar').each(function(i){
						$(this).delay(400*i).animate({
							opacity: 1
						},700);
					});
					/*setTimeout( function() {
						mostroutrabalhos = true;
						window.removeEventListener('scroll', mostrarComotrabalhamos);
						window.addEventListener('scroll', ocultaComotrabalhamos ,false);
						
					}, 3000 );*/
				};	
			}
		}
		/*function ocultaComotrabalhamos() {
			if(!$('#home_comotrabalhamos .mostrar').visible()) {
				if(!mostroutrabalhos) return false;
				console.log('vai desaparecer....');
				$($("#home_comotrabalhamos .mostrar").get().reverse()).each(function(i){
					$(this).delay(200 * i).animate({
						opacity: 0
					},500);
				});
				setTimeout( function() {
					mostroutrabalhos = false;
					window.removeEventListener('scroll',ocultaComotrabalhamos);
					window.addEventListener('scroll',mostrarComotrabalhamos,false);
				}, 1000 );
						
			}
		}*/
		jQuery(document).on("ready", mostrarComotrabalhamos);
		window.addEventListener('scroll', mostrarComotrabalhamos ,false);
	})();
	
(function() {
	
	//jQuery(document).on("ready", mostrarComotrabalhamos);
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
				$('#home_comotrabalhamos > div:not(#home_comotrabalhamos > div:first-child) ').each(function(i) {
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
		if(!inProgress) {
			
			/*if($('#home_noticias .noticias').visible(true, false)) {
				//alert('entrou');
				$('#home_noticias .item_noticia').each(function(i){
					$(this).children('hr').delay(800 * i).animate({
						width: '100%'
					},1000);
					$(this).children('h5').delay(1000 * i).animate({
						'opacity': '1'
					},1000);
					$(this).children('p').delay(1000 * i).animate({
						'opacity': '1'
					},1000);
				});
				$('#home_noticias .bt_padrao1').delay(2500).animate({
					opacity: '1'
				});
				//noticias = true;
				
				window.removeEventListener('scroll', mostrarNoticias);
			}*/
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
			/*if(!$('#home_noticias').visible(true)) {
				$('#home_noticias .item_noticia').each(function(index) {
					$(this).removeClass('mostra_noticia');
				});
			}*/
			
			$('#home_noticias .bt_padrao1').delay(2500).animate({
				opacity: '1'
			});
			
		}
	}
	window.addEventListener('scroll', mostrarNoticias ,false);
	jQuery(document).on("ready", mostrarNoticias);
	//jQuery(document).on("scroll", mostrarNoticias);
	//jQuery(window).scroll(mostrarNoticias);
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
	
	$('.slider_menu input[type="range"]').on("change",moveSlider);
	
	function moveSlider() {
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
	
	
	$("#home_noticias .noticias .item_noticia").each(function() {
		if($(window).width() >= 480 && $(window).width() < 1024) {
			Hammer(this).on("tap", function() {
				$(this).addClass('mostrar_detalhe_materia');
			});
		}else if($(window).width() < 480) {
			
			Hammer(this).on("tap", function() {
				$(this).addClass('mostrar_detalhe_materia');
			});
		}
	});
	$("#home_noticias .noticias .item_noticia .compartilhar_noticia").each(function() {
		Hammer(this).on("tap", function() {
			$(this).addClass('mostrar_compartilhar');	
		});
	});
	
    
	
	Hammer(document.getElementById('newsletter')).on("tap", function(){
		if(detectmob()) {
			//$('#home_rodape .newsletter').css('height','230');
			$('#home_rodape .newsletter h4').hide();
			$("#home_rodape .newsletter form").show();
			$("#home_rodape .newsletter form input[type='text']").focus();
		}
	});
	
	jQuery(window).on("resize", function() {
		if(!detectmob()) {
			$("#home_rodape .newsletter form").hide();
			$('#home_rodape .newsletter h4').show();
			$('#home_rodape .newsletter').css('height','auto');
		}
	});
	
	var efeitonews = false;
	$('html').click(function(e) {
		if( efeitonews ) {
			return false;
		} else {
			efeitonews = true;
			var target = $(e.target);    
			if (target.parents('#home_rodape .newsletter').length) {			
				$("#home_rodape .newsletter form input[type='text']").focus();
				$('#home_rodape .newsletter h4').hide();
				if($(window).width() > 500) {
					$("#home_rodape .newsletter").animate({
						height : '39px'
					},500,function() {
						$("#home_rodape .newsletter form").show();
						$("#home_rodape .newsletter form input[type='text']").focus();
					});
				}else {
					$("#home_rodape .newsletter form").show();
					$("#home_rodape .newsletter form input[type='text']").focus();
				}
			}else {
				$('#home_rodape .newsletter h4').focus();
				$("#home_rodape .newsletter form").hide();
				if($(window).width() > 500) {
					$("#home_rodape .newsletter").animate({
						height : '22px'
					},500,function() {
						$('#home_rodape .newsletter h4').show();
					});
				}else {
					$('#home_rodape .newsletter h4').show();
				}
			}
			setTimeout( function() {
				efeitonews = false;
			}, 800); 
			
		}
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