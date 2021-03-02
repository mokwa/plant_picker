class CreateTransitions < ActiveRecord::Migration[6.0]
  def change
    create_table :transitions do |t|
      t.references :plant, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
