class TeamPlayersController < ApplicationController 
   
  def index 
    @team = Team.find(params[:id])
    @players = @team.players
    
    if params[:sort] == "true"
      @players = @team.players.sort_name
    end 
    
    if params[:input_value] 
      @players = @players.players_by_threshold(params[:input_value])
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