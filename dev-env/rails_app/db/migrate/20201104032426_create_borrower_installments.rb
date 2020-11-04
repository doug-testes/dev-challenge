class CreateBorrowerInstallments < ActiveRecord::Migration[6.0]
  def change
    create_table :borrower_installments do |t|
      t.integer :status, default: 0, null: false
      t.references :borrower_request, null: false, foreign_key: true
      t.integer :value, default: 0, null: false
      t.date :due_date, null: false
      t.integer :installment_number, default: 0, null: false

      t.timestamps
    end
  end
end
