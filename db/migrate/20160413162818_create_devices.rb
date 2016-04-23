class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
    t.string   "device_name"
    t.string   "device_type"
    t.string   "device_model"
    t.datetime "start_date"
    t.date     "expiry_date"
    t.decimal  "device_cost",         precision: 10, scale: 2
    t.string   "device_manufacturer"
      t.timestamps null: false
    end
  end
end
