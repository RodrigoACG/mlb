class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.boolean :world_series
      t.integer :year_founded

      t.timestamps
    end
  end
end
