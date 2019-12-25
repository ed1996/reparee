class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :entreprise, foreign_key: true
      t.datetime :start_date
      t.string :hour
      t.string :minute
      t.text :description
      t.string :address
      t.string :phone
      t.string :postal_code

      t.timestamps
    end
  end
end
