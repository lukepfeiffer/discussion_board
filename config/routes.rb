Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts
  get '/contact', to: 'pages#contact'
  get '/about', to: 'pages#about'
end
