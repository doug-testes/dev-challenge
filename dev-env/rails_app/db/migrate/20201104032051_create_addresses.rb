class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street, default: "", null: false
      t.string :number, default: "", null: false
      t.string :postal_code, default: "", null: false
      t.string :complement, default: "", null: false
      t.string :neighbourdhood, default: "", null: false
      t.string :city, default: "", null: false
      t.string :state, default: "", null: false
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
