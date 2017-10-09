class AddColumnsToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :bedrooms, :integer, null: false
    add_column :properties, :bathrooms, :integer, null: false
    add_column :properties, :furnished, :boolean, null: false, default: false
  end
end
