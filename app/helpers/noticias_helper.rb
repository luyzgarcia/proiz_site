module NoticiasHelper
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)",:confirm => "Excluir?", :class => 'bt_excluir_1')
  end
  
  def link_to_adicionar_foto(name, f)
    link_to_function(name, "adicionar_foto(this)", :class => 'adicionar_foto')
  end
  
  def link_to_adicionar_ficha(name, f)
    link_to_function(name, "adicionar_ficha(this)", :class => 'adicionar_foto')
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder, :novo => true)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end
end
