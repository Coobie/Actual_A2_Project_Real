class Search < ActiveRecord::Base
	def search_devices
		devices = Device.all

		devices = devices.where(["device_name LIKE ?","%#{device_name}%"]) if device_name.present?
		devices = devices.where(["user_id LIKE ?","%#{user_id}%"]) if user_id.present?
		devices = devices.where(["device_model LIKE ?","%#{device_model}"])if device_model.present?
    devices = devices.where(["device_manufacturer LIKE ?",device_manufacturer]) if device_manufacturer.present?
		devices = devices.where(["device_type LIKE ?",device_type]) if device_type.present?

		devices = devices.where(["expiry_date <= ?",expiry_date_min]) if expiry_date_min.present?
		devices = devices.where(["expiry_date >= ?",expiry_date]) if expiry_date.present?

		devices = devices.where(["start_date >= ?",start_date]) if start_date.present?
		devices = devices.where(["start_date <= ?",start_date_min]) if start_date_min.present?

    devices = devices.where(["device_cost <= ?",max_price]) if max_price.present?
      devices = devices.where(["device_cost >= ?",min_price]) if min_price.present?
		return devices
	end

	def search_users
			users = User.all

			users = users.where(["first_name LIKE ?",user_first_name]) if user_first_name.present?
			users = users.where(["last_name LIKE ?",user_last_name]) if user_last_name.present?
			users = users.where(["office_location LIKE ?",office_location]) if office_location.present?
			users = users.where(["role LIKE ?",role]) if role.present?
		return users
	end
end
