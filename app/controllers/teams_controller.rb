class TeamsController < ApplicationController
  def index
    
    @teams = Team.newest_team
    #should this be in the model? 
    #@teams = Team.all.order(created_at: :desc)
  end

  def show 
    @team = Team.find(params[:id])
  end

  def new; end

  def create
    Team.create!(name: params[:name], world_series: params[:world_series], year_founded: params[:year_founded])
    redirect_to "/teams"
  end
end