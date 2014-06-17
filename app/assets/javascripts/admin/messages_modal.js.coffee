# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#$(".fechar").on("click",function(e){
#  alert('c');
#  e.preventDefault();
#  $("#erros").fadeOut(300, function() { $("#erros").remove(); });
#  return false;
#});
$.rails.allowAction = (link) ->
  return true unless link.attr('data-confirm')
  $.rails.showConfirmDialog(link) # look bellow for implementations
  false # always stops the action since code runs asynchronously

$.rails.confirmed = (link) ->
  link.removeAttr('data-confirm')
  link.trigger('click.rails')
  

$.rails.showConfirmDialog = (link) ->
  message = link.attr 'data-message'
  title = link.attr 'data-confirm'
  #alert(message)
  #a = confirm(message)
  #if a == true
  #  $.rails.confirmed(link)
  #else
  #  alert('nao vai nao')
  html = """ 
      <div id="erros">
        <div class="erros_info">
          <h2>#{title}</h2><br/>
          <h4>#{message}</h4>
          <ul>
            <li></li>
          </ul>
          <div class="item_info_botoes">
            <h3>O que você gostaria de fazer? </h3>
            <a id="confirm_modal" href="#" class="link_salvar">Confirmar</a>
            <a id="cancel_modal" href="#" class="link_limpar">Cancelar</a>
          </div>
        </div>
      </div>
         """
  $("body").append(html);
  $("#confirm_modal").on 'click', -> 
    $.rails.confirmed(link)
    $("#erros").remove();
  $("#cancel_modal").on 'click', ->
    $("#erros").remove();
    #$("#erros").fadeOut(200, function() { $(this).remove(); })
  #html = """
  #       <div class="modal" id="confirmationDialog">
  #         <div class="modal-header">
  #           <a class="close" data-dismiss="modal">×</a>
  #           <h3>#{message}</h3>
  #         </div>
  #         <div class="modal-body">
  #           <p>Are you sure you want to delete?</p>
  #         </div>
  #         <div class="modal-footer">
  #           <a data-dismiss="modal" class="btn">Cancel</a>
  #           <a data-dismiss="modal" class="btn btn-primary confirm">OK</a>
  #         </div>
  #       </div>
  #      """
  #$(html).modal()
  #$('#confirmationDialog .confirm').on 'click', -> $.rails.confirmed(link)
