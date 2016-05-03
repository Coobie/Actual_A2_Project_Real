class Fixforstartdate < ActiveRecord::Migration
  def change
      change_column(:devices, :start_date, :date)
  end
end
