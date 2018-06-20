class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(new show create)
  before_action :load_user, except: %i(new index create)
  before_action :correct_user, only: %i(edit update)

  def show; end

  def index; end

  def new
    @user = User.new
    @position = Position.all
    @division = Division.all
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:info] = t "success"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def update; end

  private

  def user_params
    params.require(:user).permit :name, :email, :user_code, :skill, :position_id,
      :division_id, :password, :password_confirmation
  end

  def correct_user
    redirect_to root_url unless current_user? @user
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "user_not_found"
    redirect_to root_url
  end
end
