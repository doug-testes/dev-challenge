class CreateBorrowerRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :borrower_requests do |t|
      t.integer :status, default: 0, null: false
      t.integer :loan_amount_in_cents, default: 0, null: false
      t.decimal :rate, default: 0.015, null: false
      t.integer :installments, default: 12, null: false
      t.integer :installments_amount_in_cents, default: 0, null: false
      t.integer :total_amount_payable_in_cents, default: 0, null: false
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
