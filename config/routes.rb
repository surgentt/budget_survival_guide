Rails.application.routes.draw do

  root 'budgets#home'

  resources :budgets, :except => [:edit] do 
    get 'edit/:section' => 'budgets#edit', :as => 'edit',
      :defaults => {:section => BudgetsController::Sections.first}

  end

<<<<<<< HEAD
  match '/about', to: 'budgets#about', via: 'get'



=======
>>>>>>> 4adf4de6e1cf9d3fe991102fdf71c6c978bbd305
end
