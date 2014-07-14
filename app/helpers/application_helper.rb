module ApplicationHelper
  
  def valida_form(model, attribute)
    if model.errors.has_key? attribute
      content_tag :div, model.errors[attribute].first, :class => 'mensagem_erro'
    end
  end
  
  def corrige_acentos(texto)
    #replacements.each {|replacement| str.gsub!(replacement[0], replacement[1])}    
    texto.gsub('&Aacute;','Á').gsub('&aacute;','á').gsub('&Acirc;','Â').gsub('&acirc;','â')
         .gsub('&Agrave;','À').gsub('&agrave;','à').gsub('&Aring;','Å').gsub('&aring;','å')
         .gsub('&Atilde;','Ã').gsub('&atilde;','ã').gsub('&Auml;','Ä').gsub('&auml;','ä')
         .gsub('&AElig;','Æ').gsub('&aelig;','æ').gsub('&Eacute;','É').gsub('acute;','é')
         .gsub('&Ecirc;','Ê').gsub('&ecirc;','ê').gsub('&Egrave;','È').gsub('&egrave;','è')
         .gsub('&Euml;','Ë').gsub('&euml;','ë').gsub('&ETH;','Ð').gsub('&eth;','ð').gsub('&Iacute;','Í')
         .gsub('&iacute;','í').gsub('&Icirc;','Î').gsub('&icirc;','î').gsub('&Igrave;','Ì')
         .gsub('&igrave;','ì').gsub('&Iuml;','Ï').gsub('&iuml;','ï').gsub('&Oacute;','Ó')
         .gsub('&oacute;','ó').gsub('&Ocirc;','Ô').gsub('&ocirc;','ô').gsub('&Ograve;','Ò')
         .gsub('&ograve;','ò').gsub('&Oslash;','Ø').gsub('&oslash;','ø').gsub('&Otilde;','Õ')
         .gsub('&otilde;','õ').gsub('&Ouml;','Ö').gsub('&ouml;','ö').gsub('&Uacute;','Ú')
         .gsub('&uacute;','ú').gsub('&Ucirc;','Û').gsub('&ucirc;','û').gsub('&Ugrave;','Ù')
         .gsub('&ugrave;','ù').gsub('&Uuml;','Ü').gsub('&uuml;','ü').gsub('&Ccedil;','Ç').gsub('&ccedil;','ç')
         .gsub('&Ntilde;','Ñ').gsub('&ntilde;','ñ').gsub('&nbsp;',' ').gsub('&ldquo;','"').gsub('&rdquo;', '"')
  end
  
  def default_meta_tags
    {
      :title       => 'Proiz - Comunicação Integrada',
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


    url = "http://www.facebook.com/sharer/sharer.php?app_id=#{app_id}&sdk=joey&u=#{redirect_uri}"
    #     https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fproiz.herokuapp.com%2Fnoticias%2F1
    #url = "http://www.facebook.com/sharer.php?s=100&p[url]=http://proiz.heroku.com.br&p[title]=the title you want to share&p[summary]=the description/summary you want to share"
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
    
    link_to('', '#', :onclick => "popUp=window.open('https://twitter.com/intent/tweet?url=#{redirect_uri}&text=Olhe isso &count=none','popupwindow','scrollbars=yes,width=500,height=400');popUp.focus();return false", :class => classe)
    
  end
  
end
