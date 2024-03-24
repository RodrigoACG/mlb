class Team < ApplicationRecord
  has_many :players

  def self.newest_team
    order(created_at: :desc)
  end
end