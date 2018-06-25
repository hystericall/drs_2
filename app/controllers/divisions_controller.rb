class DivisionsController < ApplicationController
  before_action :is_admin_logged_in?, only: %i(new create)
  before_action :load_division, except: %i(index create new)

  def show; end

  def index
    @divisions = Division.paginate(page: params[:page], per_page: Settings.index_per_page)
      .descending
  end

  def create
    @division = Division.new division_params
    if @division.save
      flash[:success] = t "success"
      redirect_to @division
    else
      flash[:danger] = t "failed"
      redirect_to root_path
    end
  end

  def edit; end

  def update
    if @division.update_attributes division_params
      flash[:success] = t "success"
    else
      flash[:danger] = t "failed"
    end
    redirect_to divisions_path
  end

  def new
    @division = Division.new
  end

  private

  def division_params
    params.require(:division).permit :name
  end

  def load_division
    @division = Division.find_by id: params[:id]
    return if @division
    flash[:danger] = t "division_not_found"
    redirect_to root_path
  end
end
