class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string   "device_name"
      t.string   "device_manufacturer"
      t.decimal  "min_price"
   t.decimal  "max_price"
   t.string   "device_type"
   t.string   "device_model"
   t.date     "start_date"
   t.date     "expiry_date"
   t.date     "expiry_date_min"
   t.date     "start_date_min"
      t.timestamps null: false
    end
  end
end
