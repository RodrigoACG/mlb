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
    # Team.create!(name: params[:name], world_series: params[:world_series], year_founded: params[:year_founded])
    Team.create!(teams_params)
    redirect_to "/teams"
  end

  def edit 
    @team = Team.find(params[:id])
  end

  def update
    team = Team.find(params[:id])

    team.update(teams_params)
    # team.save
    redirect_to "/teams/#{team.id}"
  end

  def destroy
    team = Team.find(params[:id])

    team.destroy
    redirect_to "/teams"
  end

  private 
  def teams_params 
    params.permit(:name, :world_series, :year_founded)
  end
end