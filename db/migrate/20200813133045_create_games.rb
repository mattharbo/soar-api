class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.references :type, null: false, foreign_key: true
      t.references :gstate, null: false, foreign_key: true
      t.string :round
      t.date :date
      t.time :time
      t.references :hometeam
      t.references :awayteam

      t.timestamps
    end
  end
end
