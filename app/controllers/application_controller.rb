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

  def load_div_pos
    @position = Position.descending
    @division = Division.descending
  end

  def correct_user
    return if current_user?(@user) || current_user.admin?
    redirect_to root_path
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "user_not_found"
    redirect_to root_path
  end

  def search_params
    return if params[:search].blank?
    params.require(:search).permit :filter, :keyword
  end

  def search_users_from users = nil
    users ||= User
    if search_params
      users.public_send search_params[:filter], search_params[:keyword]
    else
      users
    end.lastest.paginate page: params[:page], per_page: Settings.index_per_page
  end
end
