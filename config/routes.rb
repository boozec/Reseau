Rails.application.routes.draw do
  match ':controller(/:action(/:id))', :via => :get

  get '/about', to: 'pages#about'
  match '/signin' => 'users#signin', via: [:get, :put]
  match '/signup' => 'users#signup', via: [:get, :post]

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

  match '/new' => 'post#new', via: [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#index'
end
