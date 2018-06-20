class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(new show create info)
  before_action :load_user, except: %i(new index create)
  before_action :correct_user, only: %i(edit update)
  before_action :is_admin_logged_in?, only: %i(new destroy)
  before_action :load_div_pos, except: %i(destroy index show info)

  def show
    @requests = @user.requests.paginate page: params[:page]
  end

  def info
    @position = Position.find_by id: @user.position_id
    @division = Division.find_by id: @user.division_id
    render :info
  end

  def index
    @users = search_users_from
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "success"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if current_user.admin?
      admin_update_div
    elsif current_user.user?
      user_update
    else
      flash[:danger] = t "failed"
      redirect_to users_path
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "success"
    else
      flash[:danger] = t "failed"
    end
    redirect_to users_path
  end

  def following
    @title = t "title_following"
    @users = @user.following.paginate(page: params[:page], per_page: Settings.request_per_page)
    render :show_follow
  end

  def followers
    @title = t "title_followers"
    @users = @user.followers.paginate(page: params[:page], per_page: Settings.request_per_page)
    render :show_follow
  end

  def promote
    if @user.manager!
      flash[:success] = t "success"
    else
      flash[:danger] = t "failed"
    end
    redirect_to users_path
  end

  def demote
    if @user.user!
      flash[:success] = t "success"
    else
      flash[:danger] = t "failed"
    end
    redirect_to users_path
  end

  def add_to_your_division
    if @user.update_attributes division_id: current_user.division_id
      flash[:success] = t "success"
    else
      flash[:danger] = t "cant_switch_div"
    end
    redirect_to users_path
  end

  def edit_division; end

  def status
    @title = t "title_status"
    @request_pendings = current_user.request_pending.increasing
      .paginate(page: params[:page], per_page: Settings.request_per_page)
    render :status
  end

  private

  def admin_update_div
    return unless @user.update_attributes division_params
    flash[:success] = t "success"
    redirect_to users_path
  end

  def user_update
    return unless @user.update_attributes user_params_update
    flash[:success] = t "success"
    redirect_to @user
  end

  def user_params
    params.require(:user).permit :name, :email, :user_code, :skill, :position_id,
      :division_id, :password, :password_confirmation
  end

  def user_params_update
    params.require(:user).permit :name, :email, :user_code, :skill,
      :password, :password_confirmation
  end

  def division_params
    params.require(:user).permit :division_id
  end
end
