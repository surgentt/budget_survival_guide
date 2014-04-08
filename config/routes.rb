Rails.application.routes.draw do

  root'budgets#home'

  resources :budgets

end
