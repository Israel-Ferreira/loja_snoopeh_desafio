Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :snoopeh_store do
    resources :categories
    resources :products
  end
end
