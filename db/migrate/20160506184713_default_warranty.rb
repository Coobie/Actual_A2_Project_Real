class DefaultWarranty < ActiveRecord::Migration
  def change
    change_column(:devices, :warranty_length, :integer, default: 0 )
  end
end
