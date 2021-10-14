Rails.application.routes.draw do
  resources :recipes
  root "homepage#index"
end
