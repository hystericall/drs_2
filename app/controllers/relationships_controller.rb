class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find_by id: params[:followed_id]
    unless @user
      flash[:danger] = t "user_not_found"
      redirect_to users_path
    else
      current_user.follow @user
      respond_format
    end
  end

  def destroy
    @user = Relationship.find_by(id: params[:id]).followed
    if @user.nil?
      flash[:danger] = t "user_not_found"
      redirect_to users_path
    else
      current_user.unfollow @user
      respond_format
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
