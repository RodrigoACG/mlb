require "rails_helper"

RSpec.describe 'Player Index' do
  before(:each) do

    @team1 = Team.create(name: "Rockies", world_series: false, year_founded:1991)
    @team2 = Team.create(name: "Dodgers", world_series: true, year_founded:1883)
    @team3 = Team.create(name: "Braves", world_series: false, year_founded:1871)

    @player1 = @team1.players.create!(name: "Brenton Doyle", jersey_number: 25, golden_glove: true)
    @player2 = @team2.players.create!(name: "Ronald Acuña Jr.", jersey_number:13, golden_glove: false)
    @player3 = @team3.players.create!(name: "Freddie Freeman", jersey_number: 5, golden_glove: true)
    
  end

  describe '#us 3' do
    it 'each Child in the system including the Childs attributes' do
      # As a visitor
      # When I visit '/child_table_name'
      visit "/players"
      # Then I see each Child in the system including the Child's attributes
      # (data from each column that is on the child table)
      expect(page).to have_content("Name: Brenton Doyle") 
      expect(page).to have_content("Jersey Number: 25") 
      expect(page).to have_content("Golden Glove Winner: true")  
      # expect(page).to have_content("Name: Ronald Acuña Jr.")
      # expect(page).to have_content("Jersey Number: 13")
      # expect(page).to have_content("Golden Glove Winner: false")
      # US 15 changed this data 
      expect(page).to have_content("Name: Freddie Freeman")
      expect(page).to have_content("Jersey Number: 5")
      expect(page).to have_content("Golden Glove Winner: true")
    end
  end
  describe '#us 8' do
    it 'has a link of players on top of each page' do
      visit "/players/#{@player1.id}"
      expect(page).to have_link("Players")
      click_on("Players")

      expect(current_path).to eq("/players")
    end
  end

  describe '#us 15 ' do
    it 'only shows the players with a golden glove' do
      visit "/players"
      # save_and_open_page
      expect(page).to have_content("Freddie Freeman")
      expect(page).to have_content("Brenton Doyle")
      expect(page).to_not have_content("Ronald Acuña Jr.")
    end
  end
end