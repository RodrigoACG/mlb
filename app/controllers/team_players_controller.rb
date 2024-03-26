class TeamPlayersController < ApplicationController 
   
  def index 
    @team = Team.find(params[:id])
  end
  
  def new
    @team = Team.find(params[:id])

  end
end