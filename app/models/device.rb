class Device < ActiveRecord::Base
  	validates :expiry_date, presence: {message:"is missing"}
  	validates :start_date, presence: {message:" is missing"}
  	validates :device_name, presence: {message:" is missing"}
  	validates :device_type, presence: {message:" is missing"}
  	validates :device_model, presence: {message:" is missing"}
    validates :device_cost, presence: {message:" is missing"}
    validates :device_manufacturer, presence: {message:" is missing"}
    validates :user_id, presence: {message:" is missing"}


    scope :unpaid, -> {where(payment_received: false,upgrade_request: true)}
    scope :wanted, -> {where('upgrade_cost > ?',0)}
  belongs_to :user

def cost_message
  "#{device_name} at a cost of £#{(upgrade_cost).round(2)}"
end


end
