require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:show, :new, :create, :edit, :update]

  constraints Monban::Constraints::SignedIn.new do
    get "/", to: "dashboards#index", as: :dashboard
    resources :teams
    resources :games do
      collection do
        get "show_games_week"
      end  
    end 
    resources :weeks
    resources :results
    post "picks/set_game_pick"
    post "picks/clear_pick"

    post "results/set_game_results"
    post "results/clear_result"
  end

  root "sessions#new"
end
