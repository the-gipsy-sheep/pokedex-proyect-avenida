class PokemonsController < ApplicationController
  def index
    @pokemons = []
    @numbers = (1..905).to_a.sample(18)
    @numbers.each do |number|
      pokemon = PokeApi.get(pokemon: number)
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
