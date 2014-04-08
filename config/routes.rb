Rails.application.routes.draw do

  root'budgets#home'

  resources :budgets

  get 'budgets/:id/edit/income' => 'budgets#income', :as => "income"

end
