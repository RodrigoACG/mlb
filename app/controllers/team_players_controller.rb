class TeamPlayersController < ApplicationController 
   
  def index 
    @team = Team.find(params[:id])
    
    if params[:sort] == "true"
      @players = @team.players.sort_name
    elsif params[:input_value] 
      @players = @team.players_by_threshold(params[:input_value])
    else 
      @players = @team.players
    end
  end
  
  def create
    @team = Team.find(params[:id])
    @player= @team.players.create!(team_players_params)

    redirect_to("/teams/#{@team.id}/players")
  end
  
  def new
    @team = Team.find(params[:id])
  end

  private 
  def team_players_params 
    params.permit(:name, :jersey_number, :golden_glove)
  end
  
end