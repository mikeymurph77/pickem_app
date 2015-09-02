class GamesController < ApplicationController
  def index
    @weeks = Week.all
    #will make a current_week method... this is temp.
    today = Date.today
    current_week = today.beginning_of_week(start_day = :tuesday)
    @week = Week.where(week_start: current_week).first.week_number
    @games = Game.where(week_game_id: @week).order(:gametime_start)
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
      flash[:error] = "Username and Password do not match...you suck"
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