module ApplicationHelper
  def valida_form(model, attribute)
    if model.errors.has_key? attribute
      content_tag :div, model.errors[attribute].first, :class => 'mensagem_erro'
    end
  end
end
