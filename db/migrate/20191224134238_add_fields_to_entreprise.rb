class AddFieldsToEntreprise < ActiveRecord::Migration[5.1]
  def change
    add_column :entreprises, :latitude, :float
    add_column :entreprises, :longitude, :float
  end
end
