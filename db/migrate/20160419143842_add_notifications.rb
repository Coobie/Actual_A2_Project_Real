class AddNotifications < ActiveRecord::Migration
  def change
    add_column :devices, :upgrade_request, :boolean, default: false
    add_column :devices, :payment_received, :boolean, default: false
  end
end
