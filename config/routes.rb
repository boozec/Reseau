Rails.application.routes.draw do
  resources :tests
  match ':controller(/:action(/:id))', :via => :get

  get '/about', to: 'pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#index'
end
