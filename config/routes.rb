Rails.application.routes.draw do

  root 'pages#home'

  get '/users/new' => 'users#new', :as => 'signup'
  match '/signup',  to: 'users#new', via: 'get' 
  post '/users' => 'users#create'

  get "/users/:id/edit" => 'users#edit', as: "edit_user"
  patch "/users/:id" => 'users#update', as: "user"

  resources :sessions, only: [:new, :create, :destroy]

  match '/signin', to: 'sessions#new', via: 'get'
  match '/about', to: 'pages#about', via: 'get'
  match '/home', to: 'pages#home', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  resources :budgets, :except => [:edit] do 
    get 'edit/:section' => 'budgets#edit', :as => 'edit',
      :defaults => {:section => BudgetsController::Sections.first}
  end

end
