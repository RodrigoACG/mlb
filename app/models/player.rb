class Player < ApplicationRecord
  belongs_to :team

  def self.winners
    where("golden_glove = true")
  end

  def self.sort_name
    order(name: :asc)
  end
end 