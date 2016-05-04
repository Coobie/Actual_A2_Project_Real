class Device < ActiveRecord::Base
  	validates :expiry_date, presence: {message:"is missing"}
  	validates :start_date, presence: {message:" is missing"}
  	validates :device_name, presence: {message:" is missing"}
  	validates :device_type, presence: {message:" is missing"}
  	validates :device_model, presence: {message:" is missing"}
    validates :device_cost, presence: {message:" is missing"}
    validates :device_manufacturer, presence: {message:" is missing"}
    validates :user_id, presence: {message:" is missing"}
    validates_length_of :device_name, :maximum => 25, :minimum =>2
    validates_length_of :device_manufacturer, :maximum => 30, :minimum =>1
    validates_length_of :device_model, :maximum => 30, :minimum =>1
    validates_length_of :start_date, :maximum => 10, :minimum =>10
    validates_length_of :expiry_date, :maximum => 10, :minimum =>10
    validates_length_of :device_cost, :maximum => 8, :minimum =>1


    scope :unpaid, -> {where(payment_received: false,upgrade_request: true)}
    scope :wanted, -> {where('upgrade_cost > ?',0)}
  belongs_to :user

def cost_message
  "#{device_name} at a cost of £#{(upgrade_cost).round(2)}"
end


end
