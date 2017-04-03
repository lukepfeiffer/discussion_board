Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts
  resources :courses
  resources :users do
    collection do
      get 'make_admin'
      get 'remove_admin'
    end
    member do
      get :confirm_email
    end
  end
  resources :courses
  resources :comments

  resources :admins do
    collection do
      get 'posts'
      get 'overview'
    end
  end

  get '/contact', to: 'pages#contact'
  get '/about', to: 'pages#about'
  get '/sign_in', to: 'pages#sign_in'

  post '/sign_in', to: 'sessions#create'
  get '/like', to: 'comments#like'
  get '/dislike', to: 'comments#dislike'

  delete '/sign_out', to: 'sessions#destroy'
end
