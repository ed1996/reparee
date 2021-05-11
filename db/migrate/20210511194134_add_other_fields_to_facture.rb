class AddOtherFieldsToFacture < ActiveRecord::Migration[5.1]
  def change
    add_column :factures, :mail, :string
  end
end
