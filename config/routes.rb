Rails.application.routes.draw do

  root 'budgets#home'

  resources :budgets , :except => [:edit] do 
    get 'edit/:section' => 'budgets#edit', :as => 'edit',
      :defaults => {:section => BudgetsController::Sections.first}
  end
  
  

  # resources :budgets do
  #   get ':id/edit/(:section)' => 'budgets#edit', :as => 'edit',
  #       :defaults => {:section => BudgetsController::Sections.first}
  # end

  # resources :budgets, :except => [:edit] do
  #   get 'edit/(:section)' => 'budgets#edit', :as => 'edit',
  #       :defaults => {:section => BudgetsController::Sections.first}
  # end  

end
