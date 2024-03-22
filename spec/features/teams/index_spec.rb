require "rails_helper"

RSpec.describe "Teams Index" do
  before(:each) do
    @team1 = Team.create(name: "Rockies", world_series: false, year_founded:1991,  created_at: "Thu, 03 Jan 2020 00:04:52.241179000 UTC +00:00")
    @team2 = Team.create(name: "Dodgers(oldest)", world_series: true, year_founded:1883, created_at: "Tus, 24 Jan 2000 00:04:52.241179000 UTC +00:00")
    @team3 = Team.create(name: "Braves(newest)", world_series: false, year_founded:1871, created_at: "Mon, 04 Mar 2024 00:04:52.274504000 UTC +00:00")
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

  describe '#us 6' do
    it 'displays most recent created records' do

      
      visit "/teams"
      # When I visit the parent index,
      # I see that records are ordered by most recently created first
      # And next to each of the records I see when it was created
      expect("Braves").to appear_before("Rockies")
      expect("Rockies").to appear_before("Dodgers")

    end
  end

end