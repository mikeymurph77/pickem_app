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

  def tie_results
    game_id = params[:game_matchup_id]
    result = Result.find_by(game_id: game_id)

    if result.present?
      result.destroy
    end

    render json: { game: game_id }
  end

  def update_record(game_id)
    result = Result.find_by(game_id: game_id)
    game_picks = Pick.where(game_id: result.game_id)

    game_picks.each do |pick|
      record = Record.find_by(user_id: pick.user_id)

      if pick.picked_team_id == result.winner
        if record.nil?
          Record.create(user_id: pick.user_id, wins: 1, losses: 0)
        else
          new_win_count = record.wins + 1
          record.update_attribute(:wins, new_win_count)
        end
      else
        if record.nil?
          Record.create(user_id: pick.user_id, wins: 0, losses: 1)
        else
          record
          new_loss_count = record.losses.to_i + 1
          record.update_attribute(:losses, new_loss_count)
        end
      end
    end
  end

  def clear_result
      game = params[:game_matchup_id]

      result = Result.find_by(game_id: game)
      result.destroy

      render json: { game: game }
  end
end