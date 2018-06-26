class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find_by id: params[:followed_id]
    if @user
      current_user.follow @user
      respond_format
    else
      flash[:danger] = t "user_not_found"
      redirect_to users_path
    end
  end

  def destroy
    @user = Relationship.find_by(id: params[:id]).followed
    if @user
      current_user.unfollow @user
      respond_format
    else
      flash[:danger] = t "user_not_found"
      redirect_to users_path
    end
  end

  private

  def respond_format
    respond_to do |format|
      format.html{redirect_to @user}
      format.js
    end
  end
end
