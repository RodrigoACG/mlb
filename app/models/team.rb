class Team < ApplicationRecord
  has_many :players, dependent: :destroy

  def count_of_players 
    players.count
  end
  
  def self.newest_team
    order(created_at: :desc)
  end
  
end