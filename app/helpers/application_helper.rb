module ApplicationHelper
  def valida_form(model, attribute)
    if model.errors.has_key? attribute
      content_tag :div, model.errors[attribute].first, :class => 'mensagem_erro'
    end
  end
  
  def default_meta_tags
    {
      :title       => 'Proiz',
      :separator   => "&mdash;".html_safe,
    }
  end  
end
