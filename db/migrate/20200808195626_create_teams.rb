class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.references :club, null: false, foreign_key: true
      t.string :level

      t.timestamps
    end
  end
end
