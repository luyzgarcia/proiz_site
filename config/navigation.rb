# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.selected_class = 'menu_ativo'
  navigation.items do |primary|
    primary.item :clientes, 'Clientes', admin_clientes_path do |cliente|
      cliente.item :clientes, 'Listar cadastrados', admin_clientes_path, class: 'sub_menu'
      cliente.item :novo, 'Novo', new_admin_cliente_path, class: 'sub_menu'
    end
    primary.item :trabalhos, 'Trabalhos', admin_trabalhos_path, highlights_on: %r(/trabalhos) do |trabalho|
      trabalho.item :trabalhos, 'Listar trabalhos', admin_trabalhos_path, class: 'sub_menu'
      trabalho.item :novo, 'Novo trabalho', new_admin_trabalho_path, class: 'sub_menu'
      trabalho.item :categorias, 'Categorias', admin_categoriatrabalhos_path, class: 'sub_menu'
      trabalho.item :novo_categoria, 'Nova categoria', new_admin_categoriatrabalho_path, class: 'sub_menu'
      
      trabalho.item :midias, 'Midias', admin_trabalhos_midias_path, class: 'sub_menu'
      trabalho.item :novo, 'Novo Midia', admin_trabalhos_new_midia_path, class: 'sub_menu'
    end
    primary.item :noticas, 'Noticias', admin_noticias_path, highlights_on: %r(/noticias) do |trabalho|
      trabalho.item :noticias, 'Listar noticias', admin_noticias_path, class: 'sub_menu'
      trabalho.item :novo, 'Nova noticia', new_admin_noticia_path, class: 'sub_menu'
      trabalho.item :noticiacategs, 'Categorias', admin_noticiacategs_path, class: 'sub_menu'
      trabalho.item :noticiacategs, 'Nova categoria', new_admin_noticiacateg_path, class: 'sub_menu'
    end
    primary.item :especialidades, 'Especialidades', admin_especialidades_path, highlights_on: %r(/especialidades) do |trabalho|
      trabalho.item :especialidades, 'Listar especialidades', admin_especialidades_path, class: 'sub_menu'
      trabalho.item :novo, 'Nova especialidade', new_admin_especialidade_path, class: 'sub_menu'
    end
  end
end
