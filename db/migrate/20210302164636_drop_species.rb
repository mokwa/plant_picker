class DropSpecies < ActiveRecord::Migration[6.0]
  def change
    drop_table :species
  end
end
