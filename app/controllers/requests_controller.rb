class RequestsController < ApplicationController
  before_action :logged_in_user, only: %i(create destroy)
  before_action :load_request, only: %i(edit update)
  before_action :load_request_of_user, only: :destroy

  def create
    @request = current_user.requests.build request_params
    if @request.save
      flash[:success] = t "requestcreated"
      redirect_to root_path
    else
      @request_items = []
      render "static_pages/home"
    end
  end

  def destroy
    if @request.destroy
      flash[:success] = t "requestdeleted"
    else
      flash[:warning] = t "requestnotdeleted"
    end
    redirect_to request.referer || root_path
  end

  def edit; end

  def update
    if @request.update_attributes request_params
      flash[:success] = t "updated"
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def request_params
    params.require(:request).permit :request_type, :content, :date, :time,
      :offset_date, :offset_time_start, :offset_time_end
  end

  def load_request_of_user
    @request = current_user.requests.find_by id: params[:id]
    return unless @request.nil?
    flash[:danger] = t "requestnotfound"
    redirect_to root_path
  end

  def load_request
    @request = Request.find_by id: params[:id]
    return unless @request.nil?
    flash[:danger] = t "requestnotfound"
    redirect_to root_path
  end
end
