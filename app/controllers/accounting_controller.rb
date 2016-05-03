class AccountingController < ApplicationController
    def index
  authorize Device
  if current_user.admin?
    @devices = Device.unpaid.wanted
  else
    @devices = Device.where(user_id: current_user.id)
  end
end
end
