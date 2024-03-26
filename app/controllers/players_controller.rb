class PlayersController < ApplicationController
  def index 
    @players = Player.winners
  end

  def show 
    @player = Player.find(params[:id])
  end
  
  def edit 
    @player = Player.find(params[:id])
  end
  
  def update
    player = Player.find(params[:id])

    player.update(players_params)
    # player.save
    redirect_to "/players/#{player.id}"
  end

  private 
  def players_params
    params.permit(:name, :jersey_number, :golden_glove)
  end
end