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
    @position = Position.all.descending
    @division = Division.all.descending
  end

  def correct_user
    return if current_user?(@user) || current_user.admin? || current_user.manager?
    redirect_to root_path
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "user_not_found"
    redirect_to root_url
  end

  def user_params
    params.require(:user).permit :name, :email, :user_code, :skill, :position_id,
      :division_id, :password, :password_confirmation
  end

  def user_params_update
    params.require(:user).permit :name, :email, :user_code, :skill,
      :password, :password_confirmation
  end

  def search_params
    return if params[:search].blank?
    params.require(:search).permit :filter, :keyword
  end

  def division_params
    params.require(:user).permit :division_id
  end
end
