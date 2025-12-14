Rails.application.routes.draw do
  get "/posts", to: "posts#index"
  get '/hola', to: 'pages#hola'

  resources :articles do # Genera todas las rutas para articles (INDEX, SHOW, NEW, CREATE, EDIT, UPDATE, DESTROY) 
    resources :comments
  end

  get '/about', to: 'pages#about'
  root 'articles#index'
end
