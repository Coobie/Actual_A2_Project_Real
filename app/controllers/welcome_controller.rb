class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.admin?
      @devices = Device.where(:upgrade_request=>true, :payment_received=>false)
      @devices_all = Device.where(:payment_received=>false, :upgrade_request=>false)
    else
      @devices = Device.where(:upgrade_request=>true,user_id: current_user.id)

    end
  end
  def update
   @devices = Device.find(params[:id])
   if @devices.update(accounts_params)
     redirect_to :action=> 'index'
   end
 end
  def accounts_params
    params.require(:device).permit(:payment_received)
  end
end
