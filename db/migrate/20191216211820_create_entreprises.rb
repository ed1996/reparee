class CreateEntreprises < ActiveRecord::Migration[5.1]
  def change
    create_table :entreprises do |t|
      t.string :artisan_type
      t.string :company_name
      t.string :code_naf
      t.string :siren
      t.string :siret
      t.string :address
      t.string :phone
      t.string :legal_form
      t.string :linkweb
      t.boolean :is_card
      t.boolean :is_cheque
      t.boolean :is_cash
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
