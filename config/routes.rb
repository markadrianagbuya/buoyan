Rails.application.routes.draw do
  get 'dashboard/index'

  root 'dashboard#index'
  resources :purchases
  resources :attendances
  resources :workshops
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
