class Player < ApplicationRecord
  belongs_to :team

  def self.winners
    where("golden_glove = true")
  end

  def self.sort_name
    order(name: :asc)
  end

  def self.players_by_threshold(value)
    
    Player.where("jersey_number >= ?",value)
  end
end 