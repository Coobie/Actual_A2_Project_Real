class AddWarranty < ActiveRecord::Migration
  def change
    add_column :devices, :warranty_length, :integer,
  end
end
