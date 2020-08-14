class AddColumnToClub < ActiveRecord::Migration[6.0]
  def change
    add_column :clubs, :shortname, :string
  end
end
