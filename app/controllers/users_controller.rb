class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "user_not_found"
    redirect_to root_path
  end

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

  private

  def user_params
    params.require(:user).permit :name, :email, :user_code, :skill, :position_id,
      :division_id, :password, :password_confirmation
  end
end
