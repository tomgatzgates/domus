class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.integer :addressable_id, null: false, index: true
      t.string :addressable_type, null: false, index: true
      t.string :line_1, null: false
      t.string :line_2, null: false
      t.string :city, null: false
      t.string :province, null: false
      t.string :zip, null: false

      t.timestamps
    end
  end
end
