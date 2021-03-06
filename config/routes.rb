Rails.application.routes.draw do

  root "homepage#index"

  resources :recipes

  resources :reviews

  get 'recent', to: 'recipes#recent'
  get 'categories', to: 'recipes#categories'
  get 'imprint', to: 'homepage#imprint'
  get 'privacy', to: 'homepage#privacy'
end
