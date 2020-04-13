class AddSummaryToEntreprise < ActiveRecord::Migration[5.1]
  def change
    add_column :entreprises, :summary, :text
  end
end
