class AddDeviceUpgradeCost < ActiveRecord::Migration
  def change
    add_column :devices, :upgrade_cost, :decimal, precision: 10, scale: 2, default: 0
    add_column :devices, :paid_for, :boolean, default: false
  end
end
