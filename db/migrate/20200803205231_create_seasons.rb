class CreateSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons do |t|
      t.string :year
      t.integer :stage
      t.references :league, null: false, foreign_key: true

      t.timestamps
    end
  end
end
