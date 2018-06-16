Rails.application.routes.draw do
  resources :comments
  resources :blogs do
    resources :comments
  end
  devise_for :users
  resources :articles
  resources :reviews
  resources :products do
    get 'page/:page', action: :index, on: :collection
    resources :reviews   #Nested Route
  end

  get 'email_article/:id' => 'articles#email_article', as: 'email_article'

  get 'email_product/:id' => 'products#email_product', as: 'email_product'

  get 'store' => 'stores#index', as: 'store_index'

  get 'store/:id' => 'stores#show', as: 'store_show'

  get 'home',
      to: 'page#home',
      as: 'home'

  get 'contact_us',
      to: 'page#contact_us',
      as: 'contact_us'

  get 'page/products'

  get '/products' => 'products#index', as: 'all_products'

  get 'preferences',
      to: 'page#preferences',
      as: 'preferences'

  get 'blog',
      to: 'page#blog',
      as: 'page_blog'

  get 'calendar((/:month)/:year)',
      to: 'page#calendar',
      as: 'calendar'

  get 'page/articles'

  get '/articles' => 'articles#index', as: 'all_articles'

  get 'login',
      to: 'page#login',
      as: 'login'

  get '/puzzles/new' => 'puzzles#new', as: 'puzzles_new'
  post '/puzzles/create' => 'puzzles#create', as: 'puzzles_create'
  get '/puzzles/show' => 'puzzles#show', as: 'puzzles_show'

  root 'stores#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
