class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.admin?
      @devices = Device.where(:upgrade_request=>true) and Device.where(:payment_received=>false)
    else
      @devices = Device.where(:upgrade_request=>true,user_id: current_user.id)
    
    end
  end
end
