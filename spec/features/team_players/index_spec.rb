require "rails_helper"

RSpec.describe "Team Player Index" do
  before(:each) do
    @team1 = Team.create(name: "Rockies", world_series: false, year_founded:1991)

    @player1 = @team1.players.create!(name: "Brenton Doyle", jersey_number: 25, golden_glove: true)
    @player2 = @team1.players.create!(name: "Carlos Gonzalez", jersey_number: 5, golden_glove: true)
    @player3 = @team1.players.create!(name: "Charlie Blackmon", jersey_number: 19, golden_glove: false)


    
  end

  describe '#us 5' do
    it 'sees each player on a team' do

      # As a visitor
      # When I visit '/parents/:parent_id/child_table_name'
      visit "/teams/#{@team1.id}/players"
      # Then I see each Child that is associated with that Parent with each Child's attributes
      # (data from each column that is on the child table)
      # save_and_open_page

      expect(page).to have_content("Player Name: Brenton Doyle")
      expect(page).to have_content("Jersey Number: 25")
      expect(page).to have_content("Has won a Golden Glove: true")
      expect(page).to have_content("Player Name: Carlos Gonzalez")
      expect(page).to have_content("Jersey Number: 5")
      expect(page).to have_content("Has won a Golden Glove: true")
      expect(page).to have_content("Player Name: Charlie Blackmon")
      expect(page).to have_content("Jersey Number: 19")
      expect(page).to have_content("Has won a Golden Glove: false")
      
    end
  end
end