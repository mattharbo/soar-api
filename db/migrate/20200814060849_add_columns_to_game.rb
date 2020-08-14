class AddColumnsToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :scorehome, :integer
    add_column :games, :scoreaway, :integer
    add_reference :games, :season, foreign_key: true, index: true
  end
end
