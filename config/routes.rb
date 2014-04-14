Rails.application.routes.draw do

  root 'pages#home'

  resources :users

  match '/signup',  to: 'users#new', via: 'get', :as => 'signup'
  match '/about', to: 'pages#about', via: 'get'
  match '/home', to: 'pages#home', via: 'get'

  resources :budgets, :except => [:edit] do 
    get 'edit/:section' => 'budgets#edit', :as => 'edit',
      :defaults => {:section => BudgetsController::Sections.first}
  end

end
