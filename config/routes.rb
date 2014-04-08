Rails.application.routes.draw do

  root'budgets#home'

  get  'budgets/home'   => 'budgets#home',   :as => 'home' 
  get  'budgets/income' => 'budgets#income', :as => 'new_budget'
  post 'budgets' => 'budgets#create'

  get 'budgets/:id/housing' => 'budgets#housing', :as => 'housing'
  #patch 'budgets/:id/housing' => 'budgets#update'

  get 'budgets/:id/cable_internet' => 'budgets#cable_internet', :as => 'cable_internet'


  
  get 'budgets/:id/utilities' => 'budgets#utilities', :as => 'utilities'
  get 'budgets/:id/laundry' => 'budgets#laundry', :as => 'laundry'
  get 'budgets/:id/commute' => 'budgets#commute', :as => 'commute'
  get 'budgets/:id/food' => 'budgets#food', :as => 'food'
  get 'budgets/:id/debt_service' => 'budgets#debt_service', :as => 'debt_service'
  get 'budgets/:id/investing' => 'budgets#investing', :as => 'investing'
  get 'budgets/:id/emergency' => 'budgets#emergency', :as => 'emergency'
  get 'budgets/:id/result' => 'budgets#result', :as => 'result'

  resources :budgets

end
