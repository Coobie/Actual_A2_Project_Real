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
  def update

  	@devices = Device.find(params[:id])
  	if @devices.update(device_params)
  		redirect_to :action => 'index'
      flash[:notice]="Successfully Changed"
  	end
  end
  def destroy
    authorize Device
  	Device.find(params[:id]).destroy
  	redirect_to :action =>'index'
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

  params.require(:device).permit(:device_name,:device_manufacturer,:device_type,:device_model,:user_id,:start_date,:expiry_date,:device_cost, :upgrade_request)
end
end
