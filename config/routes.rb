Rails.application.routes.draw do

  root 'pages#home'
  get '/home', to: 'pages#home'
  
  resources :ptemples do
    member do
      post 'like'
    end
  end
  
  resources :customers, except: [:new]
  
  get '/register', to: 'customers#new'
  
  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'
  
end
