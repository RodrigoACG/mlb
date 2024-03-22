class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :name
      t.references :team, null: false, foreign_key: true
      t.integer :jersey_number
      t.boolean :golden_glove

      t.timestamps
    end
  end
end
