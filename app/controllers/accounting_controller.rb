class AccountingController < ApplicationController
    def index
  authorize Device
  if current_user.admin?
    @devices = Device.unpaid.wanted
end
end
end
