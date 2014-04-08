Rails.application.routes.draw do

  root 'budgets#home'

  resources :budgets, :except => [:edit] do 
    get 'edit/:section' => 'budgets#edit', :as => 'edit',
      :defaults => {:section => BudgetsController::Sections.first}
  end

  # patch '/budgets/:budget_id' => 'budgets#update'
  
  # resources :budgets, :except => [:edit] do
  #   get 'edit/(:section)' => 'budgets#edit', :as => 'edit',
  #       :defaults => {:section => BudgetsController::Sections.first}
  # end  

end
