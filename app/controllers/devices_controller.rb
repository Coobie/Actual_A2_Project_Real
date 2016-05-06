class DevicesController < ApplicationController
before_action :authenticate_user!
  def index
    if current_user.admin?
      @devices = Device.all
    else
      @devices = Device.where(user_id: current_user.id)
    end
  end
  def show
  	if current_user.admin?
      @devices = Device.find(params[:id])
    else
      @devices = Device.where(user_id: current_user.id).find(params[:id])
    end
  end

  def edit
    authorize Device
  	@devices = Device.find(params[:id])
  end
  def new
    authorize Device
  end

  def update
  	@devices = Device.find(params[:id])
    if current_user.admin?
      if @devices.update(device_params)
      end
      if @devices.save
         flash[:notice]="Successfully Edited Device"
     else
         flash[:title]=@devices.errors.full_messages.to_sentence
       end
    elsif current_user.user?
      if @devices.update(device_params_user)
      end
      if @devices.upgrade_request == true
      flash[:notice]="You have successfully ordered an upgrade for  #{@devices.cost_message}, a member of IT services will contact you via your email: #{@devices.user.email}"
    else
      flash[:alert]="Status Not Changed"
      end

  end
  redirect_to :action => 'index'
end

  def destroy
    authorize Device
  	Device.find(params[:id]).destroy
  	redirect_to :action =>'index'
    flash[:notice]="Device was Deleted"
  end

  def create
    authorize Device
  @devices = Device.new(device_params)
 if @devices.save
    flash[:notice]="Successfully Created New Device"
  redirect_to :action =>'index'
else
    flash[:title]=@devices.errors.full_messages.to_sentence
    render(:action=>'new')
end
end

private
def device_params
  params.require(:device).permit(:device_name,:upgrade_cost,:device_manufacturer,:payment_received,:device_type,:warranty_length,:device_model,:user_id,:start_date,:expiry_date,:device_cost)
end
def device_params_user
  params.require(:device).permit(:upgrade_request,:upgrade_cost)
end
end
