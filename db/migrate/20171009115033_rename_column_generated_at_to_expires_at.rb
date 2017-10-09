class RenameColumnGeneratedAtToExpiresAt < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :token_generated_at, :token_expires_at
  end
end
