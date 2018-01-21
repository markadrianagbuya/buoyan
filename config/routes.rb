Rails.application.routes.draw do
  devise_for :admins
  get 'dashboard/index'

  root 'dashboard#index'
  resources :purchases
  resources :attendances
  resources :workshops
  resources :students
  resources :teachers, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
