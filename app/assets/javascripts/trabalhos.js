// require grid/efeito_grid
// require grid/imagesloaded.pkgd
// require grid/masonry.pkgd.min

var flag_detalhetrabalho = false;

function esconder_detalhetrabalho(link) {
	/*
	 * $('.area_trabalhos').css('opacity','0');
		$('.area_trabalhos').css('zIndex', -9999);
		$('#carregando_trabalho').show();
		flag_detalhetrabalho = true;
		//loading();
		history.pushState(null, document.title, this.href);
	 * */
	$('.corpo_trabalhos').css('height','auto');
  	$('#detalhe_modal').fadeOut();
  	$('#detalhe_modal').html('');

  	$('.area_trabalhos').css('opacity','1');
  	$('.area_trabalhos').css('zIndex', 0);
  	$('.menu_trabalhos_modelo_2').css('zIndex','9');

	history.pushState(null, document.title, '/trabalhos');

  	/*$('html,body').animate({
	   scrollTop: $('#grid').offset().top-330},
	800);*/
	flag_detalhetrabalho = false;

}



function recarregar() {
	//fullloading();
	$('#trabalhos .menu_trabalhos li:first-child > a').addClass('ativo');
	$('#trabalhos .menu_trabalhos a').click(function(e) {
		e.preventDefault();
		$('#trabalhos .menu_trabalhos a').removeClass('ativo');
		$(this).addClass('ativo');
	});
	$('#trabalhos .titulo h1 a').click(function(e){
		$('#trabalhos .titulo h1').removeClass('trab_ativo');
		$(this).closest('h1').addClass('trab_ativo');
	});

	$('#trabalhos .menu_trabalhos a, .titulo h1 a, .titulo a').bind('ajax:beforeSend',function() {
		loading();
		$('.wrapper_carregando > span').css('width', '0');
	});
	$('.titulo h1 a, .titulo a').bind('ajax:beforeSend',function() {
		loading();
		history.pushState(null, document.title, this.href);
	});
	$('#trabalhos .menu_trabalhos a, .titulo h1 a').bind('ajax:complete ',function() {
		stoploading();
	});
	$('#grid .item a').bind('ajax:beforeSend',function() {
		$('html,body').animate({
	       scrollTop: $('#grid').offset().top-330},
	    800);
	    history.pushState(null, document.title, this.href);
	});
	$('#grid .item a, #trabalhos .menu_trabalhos a').bind('click',function() {
		$('#detalhe_modal').html('');
		$('#grid').css('opacity','0');
		$('#carregando_trabalho').show();
	});
	divisao_4();
	//stopfullloading();
}

function adicionaClickItemsGrid() {
	$('.seta_direita a, .detalhe_trabalho_link').click(function() {
		$('.area_trabalhos').css('opacity','0');
		$('.area_trabalhos').css('zIndex', -9999);
		$('#carregando_trabalho').show();
		flag_detalhetrabalho = true;
		//loading();
		history.pushState(null, document.title, this.href);

		$('html,body').animate({
		   scrollTop: $('#carregando_trabalho').offset().top-330},
		800);
		//return false;
	});
}

function adicionaEfeitoImagensTrabalho() {

	//$('#detalhe_modal img').css('opacity','0');
	//$('#detalhe_modal img').each(function(index) {
	/*  $('#detalhe_modal .image-info img').scrollable({ offset: { y: '70%'} })
		.on('scrollin', function (e,ui) {
			//console.log(this);
			$(this).css('opacity','1');
    	})
    	.on('scrollout', function(e,ui) {
    		console.log('saiu');
		});
	//});

	window.addEventListener('scroll', function() {
		$('#detalhe_modal img').each(function(index) {
			if($(this).visible(true, false)) {
				$(this).closest('.pinit').find('.pinit-overlay').show(500);
				$(this).delay(500).animate({
					opacity: 1
				}, 700);
			}
		});
	} ,false);

	$(window).scroll(function(){ocultarMostrar(); });*/
}

var carregando_trabalhos = false;

function invocaNovosTrabalhos() {

    if(!carregando_trabalhos && $('#flag_trabalhos').visible(true, false)
        && $('#nr_trabalhos').val() > 0 && !flag_detalhetrabalho) {
        $('.carregando_trabalho_novos_trabalhos').show();
        var url = $('#nr_trabalhos').data('url');
        carregando_trabalhos = true;
        $.ajax({
            type: 'GET',
            url: '/'+url,
            data: {nr_trabalhos : $('#nr_trabalhos').val(), categoria: $('#nr_trabalhos').data('categoria')}
        }).success(function (data) {
            //alert('deu certoo');
        	adicionaClickItemsGrid();
        }).fail(function(data ) {
            //console.log('deu erro');
        }).always(function() {
            //console.log( "complete" );
            carregando_trabalhos = false;
            $('.carregando_trabalho_novos_trabalhos').hide();
        });
    };

}

$(document).ready(function(){
	recarregar();

	//Evento quando o usuario rola a pagina e chega no final dos trabalhos
	//Ele ira trazer mais trabalhos
	$(window).scroll(function() {
        invocaNovosTrabalhos();
    });

	window.fbAsyncInit = function() {
		// Wait until FB object is loaded and initialized to refresh the embeds.
		//FB.init();
		FB.init({
		    appId      : '1501616463400377',
		    status     : true,
		    cookie     : true,
		    xfbml      : true
		});
		FB.XFBML.parse();
	};

});

function ocultarMostrar() {
	var headerTop = $(".detalhe_trabalho .detalhe").offset().top - 100;
	var $obj = $("#trabalho .trabalho_highlight");
	if ($(window).scrollTop() > headerTop && !$obj.hasClass('showing')) {
		$obj.animate({
			opacity: 1,
			zIndex: '9999'
		}, 200);
		$obj.addClass('showing');
    } else if($(window).scrollTop() <= headerTop && $obj.hasClass('showing')){
        $("#trabalho .trabalho_highlight").animate({
			opacity: 0,
			zIndex: '-9999'
		}, 200);
		$obj.removeClass('showing');
    }

}

var efeito = false;
function efeitoOcultarMostrar(mudar) {
	if(!efeito) {
		efeito = true;
		$("#detalhe_modal .fechar_detalhetrabalho").animate({
			opacity: 0
		}, 200, function() {
			if(mudar) {
		 		$("#detalhe_modal .fechar_detalhetrabalho").addClass("fixo");
		 	}else {
		 		$("#detalhe_modal .fechar_detalhetrabalho").removeClass("fixo");
		 	}
		 	$("#detalhe_modal .fechar_detalhetrabalho").animate({
				opacity: 1
		 	}, 200, function() {
		 		efeito = false;
		 	});
		});

	}

}

function diminuir_trabalho(e) {
	var pai = $(e).parent('.detalhe_item');

	if(pai.hasClass('diminuido')) {
		pai.removeClass('diminuido');
	}else{

		pai.addClass('diminuido');
	}

}


function detalhe_trabalho(e) {

}

$(document).ready(function (){
	var scrollorama = $.scrollorama({blocks: '.corpo'});
		scrollorama.animate('.menu_trabalhos_modelo_2',{delay: 100,duration:250, property:'top', start: '150px', end: '60px'});

	adicionaClickItemsGrid();

	var item = $('.detalhe_item');
	var hammertime = $(".tap").hammer({});
	hammertime.on('tap', function(ev) {
		//console.log(ev);
		$(this).parent('.detalhe_item').addClass('clicado');
		$(this).parent('.detalhe_item').find('.detalhe_trabalho_link').show();
		console.log(ev);
	    //console.log($(ev).attr('class'));
	    //return false;
	});



})
