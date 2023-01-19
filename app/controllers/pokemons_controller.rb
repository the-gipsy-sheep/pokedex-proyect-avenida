class PokemonsController < ApplicationController
  def index
    @pokemons = []
    10.times do
      pokemon = PokeApi.get(pokemon: (1..905).to_a.sample.to_s)
      @pokemons << pokemon
    end
  end

  def show
    if params[:query]
      @pokemon = PokeApi.get(pokemon: params[:query])
    else
      if @pokemon
        @pokemon = PokeApi.get(pokemon: params[:id].to_s)
      else
        render :show, status: :unprocessable_entity
      end
    end
  end
end
