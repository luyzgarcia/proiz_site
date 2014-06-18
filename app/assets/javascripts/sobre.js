$(document).ready( function(){
  (function() {
    function mostrardetalhessobre() {
      if(jQuery(window).width() > 700) {
        if($('#sobre .sobre_info_2 .mensagem').visible(false, true)) {
          $('#sobre .sobre_info_2 .mensagem h1').animate({
            top:0
          },1000);
          $('#sobre .sobre_info_2 .item').each(function(i) {
            $(this).delay(500 * i).animate({
              opacity:'1'
            },2500);
          }); 
        };
      }
    }
    $(document).on("ready", mostrardetalhessobre);
    $(window).scroll(mostrardetalhessobre);
  })();
  
  if(jQuery(window).width() < 500) {
    $('#sobre .sobre_info_2 .item h4').click(function () {
      var elemento = $(this).parent().children('p');
      if(!elemento.hasClass('show_info')){
        elemento.slideDown();
        elemento.addClass('show_info');
      }else {
        elemento.slideUp();
        elemento.removeClass('show_info');
      }
      
    });
  }
  
});