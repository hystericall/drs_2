class PositionsController < ApplicationController
  before_action :is_admin_logged_in?, only: %i(new create)
  before_action :load_position, except: %i(index create new)

  def show; end

  def index
    @positions = Position.paginate(page: params[:page], per_page: Settings.index_per_page)
      .descending
  end

  def create
    @position = Position.new position_params
    if @position.save
      flash[:success] = t "success"
      redirect_to @position
    else
      flash[:danger] = t "failed"
      redirect_to root_path
    end
  end

  def edit; end

  def update
    if @position.update_attributes position_params
      flash[:success] = t "success"
    else
      flash[:danger] = t "failed"
    end
    redirect_to positions_path
  end

  def new
    @position = Position.new
  end

  private

  def position_params
    params.require(:position).permit :name
  end

  def load_position
    @position = Position.find_by id: params[:id]
    return if @position
    flash[:danger] = t "position_not_found"
    redirect_to root_path
  end
end
