class SearchesController < ApplicationController
before_action :authenticate_user!
	def new
		authorize User
		@search = Search.new
		@device_type = Device.uniq.pluck(:device_type)
    @device_manufacturer = Device.uniq.pluck(:device_manufacturer)
		@user_id = User.uniq.pluck(:id)
	end

	def new_user
		@search = Search.new
	end

	def create
		authorize User
		@search = Search.create(search_params)
		redirect_to @search
	end

	def show
		authorize User
		@search = Search.find(params[:id])
	end

	def show_users
		authorize User
		@search = Search.find(params[:id])
	end

	private
	def search_params
		params.require(:search).permit(:device_name,:user_id, :device_type, :device_model, :start_date, :expiry_date, :expiry_date_min, :start_date_min, :min_price, :max_price, :device_manufacturer,:user_first_name, :user_last_name, :role, :office_location)
	end
end
