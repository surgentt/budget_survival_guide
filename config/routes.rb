Rails.application.routes.draw do

  root'budgets#home'

  get  'budgets/home'   => 'budgets#home',   :as => 'home' 
  get  'budgets/income' => 'budgets#income', :as => 'new_budget'
  post 'budgets' => 'budgets#create'

  get 'budgets/:id/housing' => 'budgets#housing', :as => 'housing'
  
  resources :budgets

end
