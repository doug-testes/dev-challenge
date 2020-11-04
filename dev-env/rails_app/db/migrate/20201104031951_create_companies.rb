class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :cnpj, default: "", null: false, index: { unique: true }
      t.string :phone, default: "", null: false
      t.string :name, default: "", null: false

      t.timestamps
    end
  end
end
