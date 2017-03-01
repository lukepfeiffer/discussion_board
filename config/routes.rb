Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts
  resources :users
  resources :courses
  resources :comments

  get '/contact', to: 'pages#contact'
  get '/about', to: 'pages#about'
  get '/sign_in', to: 'pages#sign_in'

  post '/sign_in', to: 'sessions#create'

  delete '/sign_out', to: 'sessions#destroy'
end
