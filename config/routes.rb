require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:show, :new, :create, :edit, :update]

  constraints Monban::Constraints::SignedIn.new do
    get "/", to: "dashboards#index", as: :dashboard
  end

  root "sessions#new"
end
