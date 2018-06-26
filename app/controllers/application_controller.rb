class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "pleaselogin"
    redirect_to login_url
  end

  def is_admin_logged_in?
    return if current_user.present? && current_user.admin?
    redirect_to root_path
  end
end
