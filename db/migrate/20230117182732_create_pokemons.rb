class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :type
      t.float :weight
      t.string :ability
      t.string :description
      t.string :evolution
      t.integer :pokedex_number

      t.timestamps
    end
  end
end
