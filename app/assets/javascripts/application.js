// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//



//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.scrollorama
//= require_tree ./geral
//  require_tree ./touch_js
//= require_tree ./scrollrama
//= require jquery.remotipart
//= require tinymce
//= require tooltips.js
//= require_tree ./scroll 
//= require jquery-ui-scrollable
//= require visibility

$(document).ready(function(){
	//$('#menu').click(function() {
		//$('body').scrollTop();
		//disable_scroll();
		carregando();
		
		/*var scrollorama = $.scrollorama({blocks: 'body'});
		scrollorama
				.animate('#header',{duration:500, property:'padding-top', end: '30px'})
				.animate('#header',{duration:500, property:'padding-bottom', end: '30px'});
		console.log('teminou');
		
		/*var controller = $.superscrollorama();
		// individual element tween examples
		controller.addTween('#header', TweenMax.from( $('#header'), .5, {css:{opacity: 0}}));*/
	//});
});
var inProgress = false;
function carregando() {
		///
		$('html, body').animate({ scrollTop: 0 }, 0);
		if( inProgress ) return false;
			inProgress = true;
			$('.wrapper_carregando').addClass('la-animate');
			//classie.add( animEl, 'la-animate' );

			setTimeout( function() {
				//classie.remove( animEl, 'la-animate' );
				$('.wrapper_carregando').removeClass('la-animate');
				inProgress = false;
				loadingComplete();
		}, 1000 );
}
function loadingComplete() {
	$('html, body').animate({ scrollTop: 0 }, 0);
	$('#header').delay(300).animate({
		top: '0'
	}, 300,function() {
		$('#esconde').animate({
			opacity: 0,
			'z-index': -100
		}, 200);
		/*setTimeout( function() {
			mostrarIntro();
		}, 200);*/
	});
}
/*
 $('.item_info_detalhe').click(function(elemento) {
	elemento = this;
	$('.item_info .item_info_detalhe').each(function(i, value) {
		if(elemento == this) {
			$(this).css('background','#fff');
		}else {
			$(this).css('background','#f1f2f2');
		}
	});
});
* 
 * */

/*Configura o scrollbar da pagina*/
$(document).ready(function(){
	/*$("body").mCustomScrollbar({
		mouseWheelPixels: 400
	});
	*/
	
});


/*Deixar o fundo do menu superior branco*/
$(document).scroll(function(e){
	var top = $(window).scrollTop();
	//Verifica se esta no dispositivo movel
	if(detectmob() == false) {
		if(top > 300) {			
			$('#header span').fadeIn(500);
			$('#header').addClass('fundo_branco_wrapper');
			$('#idiomas').addClass('fundo_branco');
			//$('#idiomas a.idioma_ativo').css('color','#fdba31');
			//$('#header span').css('opacity','1');
		}else if(top < 300) {
			$('#header span').fadeOut(500);
			$('#idiomas').removeClass('fundo_branco');
			$('#header').removeClass('fundo_branco_wrapper');
			//$('#idiomas a.idioma_ativo').css('color','#bdbdbd');
			//$('#header').css('background-color','f1f2f2');
		}	
	}
});


$(document).ready(function(){
//var scrollorama = $.scrollorama({blocks: '.corpo'});
	//if(detectmob() == true) {
		/*scrollorama
			.animate('#header',{duration:400, property:'margin-top', end: '-60px'})
			.animate('#logo',{duration:200, property:'padding-top',start:'60px', end: '20px'})
			.animate('#logo',{duration:200, property:'padding-bottom',start:'60px', end: '20px'})
			.animate('#pull',{duration:200, property:'top',start:'140px', end: '110px'});
			*/
		

		$('#pull').click(function(e) {
			e.preventDefault();
			$('#menu').slideToggle();
		});
		
		
		(function() {
			function removeheader() {
				var top = $(window).scrollTop();
				if(top > 100) {	
					$('#header').addClass('hide_header');
				}else {
					$('#header').removeClass('hide_header');
				}
				
			}
			window.addEventListener('scroll', removeheader ,false);
			jQuery(document).on("ready", removeheader);
		})();
		
		
		
		
		
	//}
	
	
	
});

//***desativar scroll****//
// left: 37, up: 38, right: 39, down: 40,
// spacebar: 32, pageup: 33, pagedown: 34, end: 35, home: 36
var keys = [37, 38, 39, 40];

function preventDefault(e) {
  e = e || window.event;
  if (e.preventDefault)
      e.preventDefault();
  e.returnValue = false;  
}

function keydown(e) {
    for (var i = keys.length; i--;) {
        if (e.keyCode === keys[i]) {
            preventDefault(e);
            return;
        }
    }
}

function wheel(e) {
  preventDefault(e);
}

function disable_scroll() {
  if (window.addEventListener) {
      window.addEventListener('DOMMouseScroll', wheel, false);
  }
  window.onmousewheel = document.onmousewheel = wheel;
  document.onkeydown = keydown;
}

function enable_scroll() {
    if (window.removeEventListener) {
        window.removeEventListener('DOMMouseScroll', wheel, false);
    }
    window.onmousewheel = document.onmousewheel = document.onkeydown = null;  
}

/*desativar scroll*/

/*Menu do sistema
$(document).ready(function(){
	configureMenu();
});
function configureMenu() {
	$('.item > li a').click(function() {
		if(!$(this).parent().hasClass('menu_ativo')) {
			$(this).parent().addClass('menu_ativo');
		}else {
			$(this).parent().removeClass('menu_ativo');
		}
		//$(this).children('.sub_menu').show();
	});
	$('.sub_menu li a').click(function() {
		$('.sub_menu li').each(function(a,d){
			$(this).removeClass('submenu_ativo');
		});
		if(!$(this).parent().hasClass('submenu_ativo')) {
			$(this).parent().addClass('submenu_ativo');
		}else {
			$(this).parent().removeClass('submenu_ativo');
		}
	});
}*/
/*
$(document).bind('ajaxSend', function(e, request, options) {
  configureMenu();
});

/*
$(document).ajaxComplete(function() {
  configureMenu();
});

*/
//Checa se o usuario digitou algo em um input e muda a cor do fundo
function checkFilled(element) {
    var inputVal = element.value;
    if (inputVal!= "") {
    	element.style.backgroundColor = "#fdba31";
        element.style.color = "#004961";
    }else {
    	element.style.backgroundColor = "#fff";
    	element.style.color = "#8dc63f";
    }
}

//Para adicionar o efeito em todas as paginas
(function() {
		function divisao_4() {
			if($('#intervalo4').visible(true, true)) {
				var scrollorama = $.scrollorama({blocks: '.corpo'});
				scrollorama.animate('#home_rodape',{delay:$(document).scrollTop(),duration:750, property:'margin-top', end: '-300px'});
				window.removeEventListener('scroll', divisao_4);
			};			
		}
		jQuery(document).on("ready", divisao_4);
		window.addEventListener('scroll', divisao_4 ,false);
})();

function detectmob() { 
 if( navigator.userAgent.match(/Android/i)
 || navigator.userAgent.match(/webOS/i)
 || navigator.userAgent.match(/iPhone/i)
 || navigator.userAgent.match(/iPad/i)
 || navigator.userAgent.match(/iPod/i)
 || navigator.userAgent.match(/BlackBerry/i)
 || navigator.userAgent.match(/Windows Phone/i)
 ){
    return true;
  }
 else {
    return false;
  }
}






/*Carregar a pagina sem refresh*/
$(document).ready(function(){
	$('#menu li a, #logo a').bind('ajax:beforeSend',function() {
		
		$('html, body').animate({ scrollTop: 0 }, 0);
		$('#esconde').animate({
			opacity: 1,
			'z-index': 100
		}, 100, function () {
			$('#header').animate({
				top: '-150px'
			}, 300);
			$('.wrapper_carregando').addClass('la-animate');
		});
		
		//$.getScript('assets'+$(this).attr("href")+'.js');
		history.pushState(null, document.title, this.href);
		
		
	});
	$('#menu li a').bind('ajax:complete ',function() {
		
		$('#esconde').animate({
			opacity: 0,
			'z-index': -100
		}, 100, function () {
			$('.wrapper_carregando').removeClass('la-animate');
			$('#header').animate({
				top: '0px'
			}, 300);
		});
		
	});
	
});
