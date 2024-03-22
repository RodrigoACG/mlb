require "rails_helper"

RSpec.describe "Team Show Page" do
  before(:each) do
    @team1 = Team.create(name: "Rockies", world_series: false, year_founded:1993)
    @team2 = Team.create(name: "Dodgers", world_series: true, year_founded:1883)
    @team3 = Team.create(name: "Braves", world_series: false, year_founded:1871)

    @player1 = @team1.players.create!(name: "Brenton Doyle", jersey_number: 25, golden_glove: true)
    @player2 = @team1.players.create!(name: "Carlos Gonzalez", jersey_number: 5, golden_glove: true)
    @player3 = @team1.players.create!(name: "Charlie Blackmon", jersey_number: 19, golden_glove: false)
  end

  describe '#us 2' do
    it 'has a show page' do
      visit "/teams/#{@team1.id}"
      # When I visit '/parents/:id'

      # Then I see the parent with that id including the parent's attributes
      expect(page).to have_content("Team Name: Rockies")

      expect(page).to have_content("Have Won A World Series: false")

      expect(page).to have_content("Year founded: 1993")
      # (data from each column that is on the parent table)
    end
  end

  describe '#us 7 ' do
    it 'shows count of players on team' do
      #   As a visitor
      visit "/teams/#{@team1.id}"
      #   When I visit a parent's show page
      #   I see a count of the number of children associated with this parent
    
      expect(page).to have_content("Player Count: 3")
    end
  end
end