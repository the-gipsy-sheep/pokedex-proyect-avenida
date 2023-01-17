class PokemonsController < ApplicationController
  def index
    @pokemons = []
    10.times do
      pokemon = PokeApi.get(pokemon: (1..1008).to_a.sample.to_s)
      @pokemons << pokemon
    end
  end

  def show
    @pokemon = PokeApi.get(pokemon: params[:id].to_s)
  end
end
