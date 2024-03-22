require "rails_helper"

RSpec.describe "Player Show" do
  before(:each) do
    team1 = Team.create(name: "Rockies", world_series: false, year_founded:1991)
    team2 = Team.create(name: "Dodgers", world_series: true, year_founded:1883)
    team3 = Team.create(name: "Braves", world_series: false, year_founded:1871)

    @player1 = team1.players.create!(name: "Brenton Doyle", jersey_number: 25, golden_glove: true)
    @player2 = team2.players.create!(name: "Ronald Acuña Jr.", jersey_number:13, golden_glove: false)
    @player3 = team3.players.create!(name: "Freddie Freeman", jersey_number: 5, golden_glove: true)
  end

  describe '#us 4' do
    it 'exists' do
      # As a visitor
      # When I visit '/child_table_name/:id'
      visit "players/#{@player1.id}"
      # Then I see the child with that id including the child's attributes
      # (data from each column that is on the child table)

      expect(page).to have_content("Player Name: Brenton Doyle") 
      expect(page).to_not have_content("Player Name: Freddie Freeman") 
      expect(page).to have_content("Jersey Number: 25") 
      expect(page).to have_content("Golden Glove Winner: true")

    end

  end
end