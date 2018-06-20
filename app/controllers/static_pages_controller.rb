class StaticPagesController < ApplicationController
  def home
    return unless logged_in?
    @request = current_user.requests.build
    @request_items = current_user.requestfeed.descending
      .paginate(page: params[:page], per_page: Settings.request_per_page)
  end

  def help; end

  def about; end
end
