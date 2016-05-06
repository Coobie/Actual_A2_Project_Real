class Device < ActiveRecord::Base
    	validates :device_type, presence: {message:" is missing"}
      validates :user_id, presence: {message:" is missing"}
     validates :device_name,length: { in: 2..25 }
    validates :device_manufacturer,length: { in: 1..30 }
    validates :device_model,length: { in: 1..30 }
    validates :start_date,length: { is: 10 }
    validates :expiry_date,length: { is: 10}
    validates :device_cost,length: { in: 1..8 }, numericality: { :greater_than => 0 }


    scope :unpaid, -> {where(payment_received: false,upgrade_request: true)}
    scope :paid, -> {where(payment_received: true)}
    scope :wanted, -> {where('upgrade_cost > ?',0)}
  belongs_to :user

def cost_message
  "#{device_name} at a cost of £#{(upgrade_cost).round(2)}"
end


end
