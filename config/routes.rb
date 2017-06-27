Rails.application.routes.draw do
  resources :users
  get '/about', to: 'pages#about'
  post '/signup', to: 'users#signup'
  get '/signup', to: 'users#signup'
  post '/signin', to: 'users#signin'
  get '/signin', to: 'users#signin'

  get '/logout', to: 'users#logout'

  get '/tags/(/:w)', to: 'pages#tags'

  get 't/(/:postID)', to: 'post#topic'

  get 'lovep/(/:id)', to: 'post#addVote'
  get 'lovec/(/:id)', to: 'post#addVoteComment'

  match '/commenta' => 'post#addComment', via: [:get, :post]
  match '/report/(/:id)' => 'pages#report', via: [:get, :post]

  get 'delc/(/:id)', to: 'post#delComment'
  get 'delp/(/:id)', to: 'post#delPost'

  match 'editp/(/:id)' => 'post#editPost', via: [:get, :put]
  match 'editc/(/:id)' => 'post#editComment', via: [:get, :put]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#index'
end
