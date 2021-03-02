class RemoveSpeciesFromPlants < ActiveRecord::Migration[6.0]
  def change
    remove_column :plants, :species_id
  end
end
