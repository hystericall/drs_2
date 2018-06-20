class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(new show create)
  before_action :load_user, except: %i(new index create)
  before_action :correct_user, only: %i(edit update)
  before_action :is_admin_logged_in?, only: %i(new update destroy)
  before_action :load_div_pos, except: %i(destroy index show)

  def show
    @requests = @user.requests.paginate page: params[:page]
  end

  def index
    @users = if search_params.present?
               User.public_send(search_params[:filter], search_params[:keyword])
                 .lastest.paginate(page: params[:page], per_page: Settings.index_per_page)
             else
               User.lastest.paginate(page: params[:page], per_page: Settings.index_per_page)
             end
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
    if @user.update_attributes user_params_update
      flash[:success] = t "success"
      redirect_to @user
    else
      render :edit
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
    @users = @user.following.paginate(page: params[:page], per_page: Settings.index_per_page)
    render :show_follow
  end

  def followers
    @title = t "title_followers"
    @users = @user.followers.paginate(page: params[:page], per_page: Settings.index_per_page)
    render :show_follow
  end

  private

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

  def correct_user
    redirect_to root_url unless current_user? @user
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "user_not_found"
    redirect_to root_url
  end

  def load_div_pos
    @position = Position.all.descending
    @division = Division.all.descending
  end
end
