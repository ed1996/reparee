class CreateFactures < ActiveRecord::Migration[5.1]
  def change
    create_table :factures do |t|
      t.string :name
      t.string :montant
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
