class AddUserSearch < ActiveRecord::Migration
  def change
      add_column :searches, :user_first_name, :string
      add_column :searches, :user_last_name, :string
      add_column :searches, :office_location, :string
      add_column :searches, :role, :integer
  end
end
