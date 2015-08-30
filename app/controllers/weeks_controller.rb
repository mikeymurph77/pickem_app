class WeeksController < ApplicationController
  before_action :find_week, only: [:show, :edit, :update]

  def index
    @weeks = Week.all
  end

  def show
  end
  
  def new
    @week = Week.new
  end

  def create
    week = Week.create(week_params)
    redirect_to weeks_path
  end

  def edit
  end

  def update
  end  

  private

  def find_week
    @week = Week.find(params[:id])
  end  

  def week_params
    params.require(:week).permit(
        :week_number,
        :week_start,
        :week_end
      )
  end  
end