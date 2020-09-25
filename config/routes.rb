Rails.application.routes.draw do
  get 'welcome/index'

  resources :movies
  resources :casts
  resources :genres

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
