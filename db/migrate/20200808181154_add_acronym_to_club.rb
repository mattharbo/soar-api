class AddAcronymToClub < ActiveRecord::Migration[6.0]
  def change
    add_column :clubs, :acronym, :string
  end
end
