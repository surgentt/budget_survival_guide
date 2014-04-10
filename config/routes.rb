Rails.application.routes.draw do

  root 'budgets#home'

  resources :budgets, :except => [:edit] do 
    get 'edit/:section' => 'budgets#edit', :as => 'edit',
      :defaults => {:section => BudgetsController::Sections.first}
  end

  match '/about', to: 'budgets#about', via: 'get'

end
