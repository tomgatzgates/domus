class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, unique: true, index: true, null: false
      t.string :token, unique: true, index: true

      t.timestamps
    end
  end
end
