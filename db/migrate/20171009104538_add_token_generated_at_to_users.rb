class AddTokenGeneratedAtToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :token_generated_at, :datetime
  end
end
