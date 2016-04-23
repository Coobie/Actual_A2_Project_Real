class Device < ActiveRecord::Base
  	validates :expiry_date, presence: {message:"is missing"}
  	validates :start_date, presence: {message:" is missing"}
  	validates :device_name, presence: {message:" is missing"}
  	validates :device_type, presence: {message:" is missing"}
  	validates :device_model, presence: {message:" is missing"}
    validates :device_cost, presence: {message:" is missing"}
    validates :device_manufacturer, presence: {message:" is missing"}
    validates :user_id, presence: {message:" is missing"}

  belongs_to :user

  def reaching_end

  end
end
