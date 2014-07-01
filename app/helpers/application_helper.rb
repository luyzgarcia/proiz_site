module ApplicationHelper
  
  def valida_form(model, attribute)
    if model.errors.has_key? attribute
      content_tag :div, model.errors[attribute].first, :class => 'mensagem_erro'
    end
  end
  
  def default_meta_tags
    logger.debug 'default meta tags'
    {
      :title       => 'Proiz',
      :separator   => "&mdash;".html_safe,
    }
  end
  
  def fb_share(app_id, redirect_uri, classe, opts={})
    o = {:text => '',
      :name => 'Proiz testes',
      :display => '',
      :caption => '',
      :description => 'Conteudo de teste',
      :link => 'http://www.google.com',
      :picture => '',
      :source => 'Proiz',
      :properties => {},
      :actions => {}}.merge!(opts)
    
    opts_array = []

    opts.each do |key, value| 
      case
      
        when key.to_s == 'properties' 
          @prop = value.to_json
        when key.to_s == 'actions'
          @action = value.to_json
        else 
        opts_array.push("#{key}=#{value}")

      end
    end   


    #url = "http://www.facebook.com/sharer/sharer.php?app_id=#{app_id}&sdk=joey&u=#{redirect_uri}&#{opts_array.join("&")}&properties=#{@prop}&actions=#{@action}"
    url = "http://www.facebook.com/sharer.php?s=100&p[url]=http://proiz.heroku.com.br&p[title]=the title you want to share&p[summary]=the description/summary you want to share"
    # => http://www.facebook.com/sharer.php?s=100&p[url]=http://www.google.com&p[title]=the title you want to share&p[summary]=the description/summary you want to share
    #     https://www.facebook.com/sharer/sharer.php?app_id=1501616463400377&sdk=joey&u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&display=popup

    link_to("#{o[:text]}", url, :onclick => 'return fbs_click(550, 300, this)', :class => classe)
        
  end
  
  def google_share(redirect_uri, classe)
    
    #<a href="#" onclick="popUp=window.open('https://plus.google.com/share?url=www.google.com','popupwindow','scrollbars=yes,width=500,height=400');
    # popUp.focus();return false">Gogole+</a>
    
    link_to('', '#', :onclick => "popUp=window.open('https://plus.google.com/share?url=#{redirect_uri}','popupwindow','scrollbars=yes,width=500,height=400');popUp.focus();return false", :class => classe )
    
  end
  
  def twitter_share(redirect_uri, classe)
    
    #<a href="#" onclick="popUp=window.open('https://twitter.com/intent/tweet?url=www.google.com&text=Olhe isso &count=none','popupwindow','scrollbars=yes,width=500,height=400');popUp.focus();return false" data-related="jasoncosta" data-lang="en" data-size="large" data-count="none">Tweet</a>
    
    link_to('', '#', :onclick => "popUp=window.open('https://twitter.com/intent/tweet?url=#{redirect_uri}&text=Olhe isso #{redirect_uri} &count=none','popupwindow','scrollbars=yes,width=500,height=400');popUp.focus();return false", :class => classe)
    
  end
  
end
