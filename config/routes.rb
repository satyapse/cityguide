Rails.application.routes.draw do

  root 'pages#home'
  get '/home', to: 'pages#home'
  
  resources :ptemples do
    member do
      post 'like'
    end
  end
end
