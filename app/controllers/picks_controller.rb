class PicksController < ApplicationController
  def set_game_pick

    if params[:time_now] < params[:game_start_time]
      #Game Not Started
      selected_team = params[:selected_team]
      game_id = params[:game_matchup_id]

      pick = Pick.find_by(user_id: current_user.id, game_id: game_id)

      if pick.nil?
        Pick.create(user_id: current_user.id, game_id: game_id, picked_team_id: selected_team)
      else
        pick.update_attribute("picked_team_id", selected_team)
      end

      render json: { game: game_id, team: selected_team }
    else
      #Game Already started
      #Ajax Error function will be triggered
    end
  end

  def clear_pick
    if params[:time_now] < params[:game_start_time]
      #Game Not Started
      game = params[:game_matchup_id]

      pick = Pick.find_by(game_id: game, user_id: current_user.id)
      pick.destroy

      render json: { game: game }
    else
      #Game Already started
      #Ajax Error function will be triggered
    end
  end
end