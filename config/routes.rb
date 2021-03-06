# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :snoopeh_store do
    resources :categories
    resources :products
    resources :carts, only: %i[create show index]
    resources :cart_items, only: %i[create destroy]
    resources :txns, only: %i[create index show]
  end
end
