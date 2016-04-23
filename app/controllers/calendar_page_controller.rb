class CalendarPageController < ApplicationController
	before_action :authenticate_user!
	def index
		if current_user.admin?
			@devices = Device.all
		else
			@devices = Device.where(user_id: current_user.id)
		end
			@devices_by_date = @devices.group_by(&:expiry_date)
			@date = params[:date] ? Date.parse(params[:date]) : Date.today
	end
end
