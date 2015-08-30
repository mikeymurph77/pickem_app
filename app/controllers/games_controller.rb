class GamesController < ApplicationController
  def index
    @weeks = Week.all
    #will make a current_week method... this is temp.
    @first_week = Week.find_by_week_number(1).id
    @games = Game.where(week_game_id: @first_week).order(:gametime_start)
  end 

  def new
    @game = Game.new
    @teams = Team.all
    @weeks = Week.all
  end

  def create
    game = Game.new(game_params)
    if game.save
      redirect_to games_path
    else
      render :new
    end
  end

  def show_games_week
    week_number = params[:week_number]
    week = Week.find_by_week_number(week_number).id
    @games = Game.where(week_game_id: week)

    respond_to do |format|
      format.js
    end
  end

  private

  def game_params
    params.require(:game).permit(
        :away_team_id,
        :home_team_id,
        :week_game_id,
        :gametime_start
      )
  end  
end