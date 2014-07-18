$(document).ready(function(){
//Efeito draggable Trabalhos Recentes (Imagens e Barra de rolagem)
	var imagens = $('#home_trabalhos .projetos_slider .slider_imagens ul li').length;
	$('#home_trabalhos .projetos_slider .slider_imagens ul').width(imagens * 890);
	
	(function (){					
		var ul_width = $('#home_trabalhos .projetos_slider .slider_imagens ul').width();
		var ul_left=0;
		var tam_tela=0;
		var rail_width=0;//largura barra de rolagem px
		var bar_width=0;//Largura da barra de rolagem para compensar a porcentagem em relação ao trilho
		var x_div=0;
		var x_movel=0;
		var w_tela=0;
		var resultado=0;
		var bar_max=0;
				
		//Arrasta as imagens (touch)
		
		function imageSlider() {			
			$( ".slider_imagens ul" ).draggable({					       		
	        	axis: "x",
	        	start: function(){
	        		tam_tela = $('#home_trabalhos .projetos_slider .slider_imagens').width();	
	        		rail_width = $('#container_range span').width();		           
		            bar_width = $('.slider_menu .range').width();
		            bar_max = rail_width-bar_width;	 	
		            w_tela = $(window).width();     
	        	},        	
	        	drag: function(event, ui) {
	        		ul_left =$('#home_trabalhos .projetos_slider .slider_imagens ul').position().left;		            
		            var perc_ul = ul_left / (ul_width-tam_tela);		                       
		            var bar = -bar_max * perc_ul;	            
		            x_div = $( ".slider_imagens" ).offset().left;         
		         	x_movel = ui.offset.left;		         	        		
		         	resultado = (x_movel + ul_width) - w_tela;		         	
		         	
		         	if(x_movel-200 > x_div || resultado+200 < 0) {
		         		return false;
		            }		         	
		         	//Move a barra de rolagem quando arrasta as imagens		            
		            if (bar >= 0 && bar < bar_max ){		            			            	    
		            	$('#home_trabalhos .projetos_slider .range').css('left', bar );						    
		            }          	        		           		       	
	        	},
	        	stop: function(event, ui){	      		       	         			         	
		         	if(x_movel > x_div || resultado < 0) {
		         		if(x_movel > x_div) {		         			
		         			$(this).animate({
								left: 0
							},200);
		         		}
		         		if(resultado < 0) {
		         			var res = x_movel - resultado;
		         			$(this).animate({
								left: res - x_div
							},200);
		         		}		         		
		         	}
	        	}
	      	});
		}
		if(detectmob() == true) {
			jQuery(document).on("ready", imageSlider);
		}
		//Barra rolagem imagens	
		function rangeSlider() {			
			$( ".slider_menu .range" ).draggable({
	       		containment: "parent",
	        	axis: "x",
	        	start: function(){
	        		rail_width = $('#container_range span').width();//largura barra de rolagem px	         		
			        bar_width = $('.slider_menu .range').width();//Largura da barra de rolagem para compensar a porcentagem em relação ao trilho
			        tam_tela = $('#home_trabalhos .projetos_slider .slider_imagens').width();
	        	},
	        	drag: function(event, ui) {	         
	        		var posBar = $('.slider_menu .range').position().left;//posição em px à margem esquerda da barra de rolagem		
			        var percBar = posBar/(rail_width-bar_width);         
			        var mostrar = -percBar * (ul_width - tam_tela);      
			        $('#home_trabalhos .projetos_slider .slider_imagens ul').css({left: mostrar});	         
	        	}
	      	});
		}
		jQuery(document).on("ready", rangeSlider);
	})();
});