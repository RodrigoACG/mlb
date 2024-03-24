class TeamsController < ApplicationController
  def index
    
    @teams = Team.newest_team
    #should this be in the model? 
    #@teams = Team.all.order(created_at: :desc)
  end

  def show 
    @team = Team.find(params[:id])
  end
end