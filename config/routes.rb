ProizAdmin::Application.routes.draw do

  get "teste/index"
  get "inicial/index"
  get "index/index"
  get "sobre/index"
  get "contato/index"
  get "trabalhos/index"
  get "trabalhos/new"
  get "trabalhos/edit"
  get "trabalhos/update"
  get "trabalhos/delete"
  get "artigos/index"
  get "artigos/new"
  get "artigos/edit"
  get "artigos/update"
  get "artigos/delete"
  get "artigos/destroy"
  get "noticias/update"
  get "noticias/delete"
  get "categoriatrabalhos/index"
  get "categoriatrabalhos/new"
  get "categoriatrabalhos/edit"
  get "categoriatrabalhos/update"
  get "categoriatrabalhos/delete"
  get "categoriatrabalhos/destroy"
  get "recursos/show"
  get "recursos/index"
  get "recursos/new"
  get "recursos/create"
  get "recursos/edit"
  get "recursos/destroy"
  get "recursos/update"  
  #get "noticia/new"
  #get "noticia/show"
  #get "noticia/edit"
  #get "noticia/destroy"
  #get "noticia/index"  
  #get "noticiacategs/new"
  #get "noticiacategs/index"
  #get "noticiacategs/show"
  #get "noticiacategs/edit"
  #get "noticiacategs/destroy"
  #get "noticiacategs/update"
  
  #get "clientes/show"
  #get "clientes/index"
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
  get "sobre" => "sobre#index", :as => "sobre"
  
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "inicial#index"
 
  namespace :admin do
    root :to => "sessions#new"
    get "log_in" => "sessions#new", :as => "log_in"
    get "log_out" => "sessions#destroy", :as => "log_out"
    
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
  end
  
  resources :users
  #resources :sessions
  resources :painel
  resources :paginas
  resources :clientes do
    member do
      get :mudarstatus
    end
  end
  
  resources :artigos
  
  
  resources :trabalhos do
    member do
      get :detalhe
      get :filtrar
      get :filtrarmidia
    end
  end
  get "midias_trabalhos" => "trabalhos#midias_sociais", :as => "midias_trabalhos"
  
  get "buscar_noticia" => "noticias#buscar", :as => "buscar_noticia"
  resources :noticias do
    
    member do
      get :detalhe_noticia, :as => 'detalhe'
      get :filtrar
    end
  end
  resources :especialidades
  resources :inicials do
    
  end
  
  get "contato" => "contato#index", :as => "contato"
  post "enviado" => "contato#enviado", :as => "enviado"
  
  #resources :noticia
  #resources :noticias
  #resources :recursos
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
