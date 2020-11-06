class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :cnpj, default: "", null: false
      t.string :phone, default: "", null: false
      t.string :name, default: "", null: false
      t.references :borrower_request, null: false, foreign_key: true

      t.timestamps
    end
  end
end
