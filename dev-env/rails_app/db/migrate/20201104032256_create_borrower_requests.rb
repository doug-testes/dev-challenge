class CreateBorrowerRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :borrower_requests do |t|
      t.integer :status, default: 0, null: false
      t.integer :loan_value, default: 0, null: false
      t.decimal :rate, default: 0.015, null: false
      t.integer :installments, default: 0, null: false
      t.date :start_date
      t.date :end_date
      t.references :company, null: true, foreign_key: true

      t.timestamps
    end
  end
end
