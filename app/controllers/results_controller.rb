class ResultsController < ApplicationController
  def index
    @weeks = Week.all
    today = Date.today
    current_week = today.beginning_of_week(start_day = :tuesday)
    @week = Week.where(week_start: current_week).first
    @games = Game.where(week_game_id: @week).order(:gametime_start)
  end

  def set_game_results
      winning_team = params[:selected_team]
      losing_team = params[:losing_team]

      game_id = params[:game_matchup_id]

      result = Result.find_by(game_id: game_id)

      if result.nil?
        result = Result.create(game_id: game_id, winner: winning_team, loser: losing_team)
      else
        result = result.update_attributes(winner: winning_team, loser: losing_team)
      end

      update_record(game_id)

      render json: { game: game_id, team: winning_team }
  end

  def update_record(game_id)
    result = Result.find_by(game_id: game_id)
    game_picks = Pick.where(game_id: result.game_id)
  end

  def clear_result
      game = params[:game_matchup_id]

      result = Result.find_by(game_id: game)
      result.destroy

      render json: { game: game }
  end
end