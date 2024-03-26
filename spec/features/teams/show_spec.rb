require "rails_helper"

RSpec.describe "Team Show Page" do
  before(:each) do
    @team1 = Team.create(name: "Rockies", world_series: false, year_founded:1993)
    @team2 = Team.create(name: "Dodgers", world_series: true, year_founded:1883)
    @team3 = Team.create(name: "Braves", world_series: false, year_founded:1871)

    @player1 = @team1.players.create!(name: "Brenton Doyle", jersey_number: 25, golden_glove: true)
    @player2 = @team1.players.create!(name: "Carlos Gonzalez", jersey_number: 5, golden_glove: true)
    @player3 = @team1.players.create!(name: "Charlie Blackmon", jersey_number: 19, golden_glove: false)
    @player4 = @team2.players.create!(name: "Freddie Freeman", jersey_number: 5, golden_glove: true)
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

  describe '#us 10' do
    it 'takes me to the teams players page' do
      visit "/teams/#{@team1.id}"
      
      expect(page).to have_link("Players On Rockies")

      click_link("Players On Rockies")

      expect(current_path).to eq("/teams/#{@team1.id}/players")
      # save_and_open_page
      expect(page).to have_content("Brenton Doyle")
      expect(page).to have_content("Carlos Gonzalez")
      expect(page).to have_content("Charlie Blackmon")
      expect(page).to_not have_content("Freddie Freeman")

    end
  end

  describe '#us 12' do
    it 'updates teams info' do

      # As a visitor
      # When I visit a parent show page
      visit "/teams/#{@team1.id}"
      # Then I see a link to update the parent "Update Parent"
      expect(page).to have_link("Update Team")
      # When I click the link "Update Parent"
      click_on("Update Team")
      # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
      expect(current_path).to eq("/teams/#{@team1.id}/edit")

      # When I fill out the form with updated information
      fill_in :name, with: "Angles"
      choose('world_series_true')
      fill_in :year_founded, with: 1989
      # And I click the button to submit the form
      click_on ("Update Team")
      # Then a `PATCH` request is sent to '/parents/:id',
      expect(current_path).to eq("/teams/#{@team1.id}")
      # the parent's info is updated,
      expect(page).to_not have_content("Colorado Rockies")
      expect(page).to have_content("Angles")

      # and I am redirected to the Parent's Show page where I see the parent's updated info




    end
  end
end