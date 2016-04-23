class Addsomething < ActiveRecord::Migration
  def change
    add_column :devices, :user_id, :integer 
  end
end
