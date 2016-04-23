class RegistrationsController < Devise::RegistrationsController
	def new
		redirect_to(new_user_session_path)
	end
	private

  def sign_up_params
    params.require(:user).permit(:first_name,:office_location ,:last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :office_location,:email, :password, :password_confirmation,:role, :current_password)
  end
end
