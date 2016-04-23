class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  private

  private
  def user_not_authorized
    flash[:alert] = "Access Denied."

    if request.referrer.blank?
      redirect_to root_path
    else
      redirect_to(request.referrer)# || root_path
    end
  end
end
