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
    if current_user.admin?
      if @devices.update(payment_params)
      
      end
      if @devices.save
         flash[:notice]="#{@devices.name} has been selected as paid"
     end
   end
 end
  def payment_params
    params.require(:device).permit(:payment_received)
  end
end
