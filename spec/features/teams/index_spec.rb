require "rails_helper"

RSpec.describe "Teams Index" do
  before(:each) do
    team1 = Team.create(name: "Rockies", world_series: false, year_founded:1991)
    team2 = Team.create(name: "Dodgers", world_series: true, year_founded:1883)
    team3 = Team.create(name: "Braves", world_series: false, year_founded:1871)
  end

  describe '#us 1' do
  
    it 'has each team record in the system' do
    
      # For each parent table
      # As a visitor
      # When I visit '/parents'
      # Then I see the name of each parent record in the system
      
      visit "/teams"
      expect(page).to have_content("Rockies")
      expect(page).to have_content("Dodgers")
      expect(page).to have_content("Braves")
    end
  end

end