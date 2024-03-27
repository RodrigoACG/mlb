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
      visit "/players/#{@player1.id}"
      # Then I see the child with that id including the child's attributes
      # (data from each column that is on the child table)

      expect(page).to have_content("Player Name: Brenton Doyle") 
      expect(page).to_not have_content("Player Name: Freddie Freeman") 
      expect(page).to have_content("Jersey Number: 25") 
      expect(page).to have_content("Golden Glove Winner: true")

    end
  end

  describe '#us 14' do
    it 'update child attributes ' do

      # As a visitor
      # When I visit a Child Show page
      visit "/players/#{@player1.id}"
      # Then I see a link to update that Child "Update Child"
      expect(page).to have_link("Update Player")
      expect(page).to have_content("Player Name: Brenton Doyle") 
      expect(page).to have_content("Jersey Number: 25") 
      expect(page).to have_content("Golden Glove Winner: true")
      # When I click the link
      click_on("Update Player")
      # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
      expect(current_path).to eq("/players/#{@player1.id}/edit")
      fill_in :name, with: "Todd Helton"
      fill_in :jersey_number, with: 17
      choose('golden_glove_false')
      # When I click the button to submit the form "Update Child"
      click_on("Update Player")
      # Then a `PATCH` request is sent to '/child_table_name/:id',
      expect(current_path).to eq("/players/#{@player1.id}")
      # the child's data is updated,
      expect(page).to have_content("Player Name: Todd Helton") 
      expect(page).to have_content("Jersey Number: 17") 
      expect(page).to have_content("Golden Glove Winner: false")

      # and I am redirected to the Child Show page where I see the Child's updated information
    
      
    end
  
  end


  describe '#us 20 ' do
    it 'Deletes a child ' do
      visit "/players/#{@player1.id}"

      expect(page).to have_link("Delete Player")
      click_link("Delete Player")
      # save_and_open_page
      expect(current_path).to eq("/players")
      expect(page).to_not have_content("Brenton Doyle")
    end
  end
end