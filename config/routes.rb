ProizAdmin::Application.routes.draw do
  
  get '/robots.txt' => 'application#robots'
  get '/sitemap.xml' => 'application#sitemap'
  #match '*a', :to => 'errors#routing'
  get "/404", :to => "errors#routing"
  get "/422", :to => "errors#routing"
  get "/500", :to => "errors#routing"

  get "/pt", :to => "define_idioma#portugues"
  get "/en", :to => "define_idioma#ingles"
  #get "/" => "define_idioma/ingles"
  
  get "define_idioma/portugues"
  get "define_idioma/ingles"
  
  get "clientes/edit"
  get "clientes/delete"
  get "clientes/update"
 #get "clientes/new"
  get "paginas/index"
  get "painel/index"
  get "sessions/new"
  get "users/new"
  get "users/show"
  get "users/index"
  
  get "contato/index"
  get "contato/sobre"
   
   
  resources :teste
  #get "log_in" => "sessions#new", :as => "log_in"
  #get "log_out" => "sessions#destroy", :as => "log_out"
  
  #get "contato" => "contato#index", :as => "contato"
  
  
  get "sign_up" => "users#new", :as => "sign_up"
  #root :to => "inicial#index"
 
  namespace :admin do
    root :to => "sessions#new"
    
    #get "define_idioma/portugues"
    #get "define_idioma/ingles"
    
    get "log_in" => "sessions#new", :as => "log_in"
    get "log_out" => "sessions#destroy", :as => "log_out"
    
    #Redireciona para a pagina de configurações do site
    get "/siteinfo" => "admin#edit", :as => "siteinfo"
    patch "/siteinfo" => "admin#update", :as => "update_info"    
    
    resources :sessions
    resources :clientes do
      member do 
        get :mudarstatus
      end
    end
    get "/trabalhos/new_midia" => "trabalhos#new_midia", :as => "trabalhos_new_midia"
    get "/trabalhos/midias" => "trabalhos#midias", :as => "trabalhos_midias"
    resources :trabalhos do
      member do
        get :mudarstatus
        get :destaque
        get :subirordem
        get :descerordem
      end
    end
    resources :categoriatrabalhos do
      member do
        get :mudarstatus
      end
    end
    resources :noticias do
      member do 
        get :mudarstatus
      end
    end
    resources :noticiacategs do
      member do 
        get :mudarstatus
      end
    end
    resources :especialidades do
      member do 
        get :mudarstatus
      end
    end
   resources :users do
      member do
        get :mudarstatus
      end
    end
    resources :lab_sliders do
      member do
        get :mudarstatus
      end
    end
    
    #resources :labs do
      
    #  member do
    #    get :mudarstatus
    #  end
    #end
  end 
  
  resources :users
  #resources :sessions
  #resources :labs
  get '/lab' => 'lab#index'
  resources :painel
  resources :paginas
  resources :clientes do
    member do
      get :mudarstatus
    end
  end
  
  #resources :artigos
  
  get "/trabalhos/:id" => "trabalhos#detalhe"
  #get "/midias_trabalhos" => "trabalhos#filtrar"
  resources :trabalhos do
    member do
      get :detalhe
      get :filtrar
      get :filtrarmidia
    end
  end
  get "midias_sociais" => "trabalhos#midias_sociais", :as => "midias_sociais"
  
  get "buscar_noticia" => "noticias#buscar", :as => "buscar_noticia"
  get "/noticias/:id" => "noticias#detalhe_noticia"
  get "mais_noticias" => 'noticias#mais_noticias'
  resources :noticias do
    
    member do
      get :detalhe_noticia, :as => 'detalhe'
      get :filtrar
    end
  end
  
  get "especialidade/contato"
  get "contato/contato"
  
  get "inicial" => "inicial#index", :as => "inicial"
  
  root :to => "inicial#index"
  get "sobre" => "sobre#index", :as => "sobre"
  
   
   resources :especialidades do
      collection do
        get 'contato'
      end
      member do
        
      end
    end
  
  get "contato" => "contato#index", :as => "contato"
  post "enviado" => "contato#enviado", :as => "enviado"
  
  #Newsletter
  get "subscribe" => "newsletter#subscribe", :as => "subscribe"
  get "unsubscribe" => "newsletter#unsubscribe", :as => "unsubscribe"
end
