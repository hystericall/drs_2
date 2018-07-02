class SessionsController < ApplicationController
  before_action :find_user, only: :create

  def new; end

  def create
    if @user && @user.authenticate(params[:session][:password])
      login_and_redirect
    else
      flash.now[:danger] = t "invalidemail"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def find_user
    @user = User.find_by email: params[:session][:email].downcase
    return if @user
    flash.now[:danger] = t "invalidemail"
  end

  def login_and_redirect
    log_in @user
    params[:session][:remember_me] == Settings.checked ? remember(@user) : forget(@user)
    redirect_back_or @user
  end

  def show_not_activated
    flash[:warning] = t "not_activated"
    redirect_to root_path
  end
end
