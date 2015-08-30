class TeamsController < ApplicationController
  before_action :find_team, only: [:show, :edit, :update]

  def index
    @teams = Team.all
  end 

  def show
  end

  def new
    @team = Team.new
  end

  def create
    team = Team.create(team_params)
    redirect_to teams_path
  end

  def edit
  end

  def update
    
    if @team.update(team_params)
      redirect_to teams_path
    else
      @team
    end  
  end

  private

  def find_team
    @team = Team.find(params[:id])
  end  

  def team_params
    params.require(:team).permit(
        :name,
        :city,
        :team_logo
      )
  end 
end