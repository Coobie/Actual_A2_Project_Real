class ChangeUserId < ActiveRecord::Migration
  def change
    change_column(:searches, :user_id, :string)
  end
end
