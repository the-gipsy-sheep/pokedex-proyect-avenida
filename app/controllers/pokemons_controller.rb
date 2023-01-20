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
      @pokeinfo = PokeApi.get(pokemon_species: params[:query])
      # @evolution = PokeApi.get(evolution_chain: params[:query])
    else
      @pokemon = PokeApi.get(pokemon: params[:id].to_s)
      @pokeinfo = PokeApi.get(pokemon_species: params[:id])
      # @evolution = PokeApi.get(evolution_chain: params[:id])
    end
  end
end
