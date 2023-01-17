Rails.application.routes.draw do
  root to: "pokemons#index"
  resources :pokemons, only: :show
end
