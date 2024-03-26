require "rails_helper"

RSpec.describe "Team Player Index" do
  before(:each) do
    @team1 = Team.create(name: "Rockies", world_series: false, year_founded:1991)

    @player1 = @team1.players.create!(name: "Brenton Doyle", jersey_number: 25, golden_glove: true)
    @player2 = @team1.players.create!(name: "Carlos Gonzalez", jersey_number: 5, golden_glove: true)
    @player3 = @team1.players.create!(name: "Charlie Blackmon", jersey_number: 19, golden_glove: false)
    @player4 = @team1.players.create!(name: "A", jersey_number: 1, golden_glove: false)
    


    
  end

  describe '#us 5' do
    it 'sees each player on a team' do
      require 'pry'; binding.pry
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


  describe '#us 13 ' do
    it 'creates a child in the parent' do

      # As a visitor
      # When I visit a Parent Children Index page
      visit "/teams/#{@team1.id}/players"
      # Then I see a link to add a new adoptable child for that parent "Create Child"
      expect(page).to have_link("Create Team Player")
      # When I click the link
      click_on("Create Team Player")
      # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
      expect(current_path).to eq("/teams/#{@team1.id}/players/new")
      # When I fill in the form with the child's attributes:
      fill_in :name, with: "Tulo"
      fill_in :jersey_number, with: 2
      choose("golden_glove_true")

      # And I click the button "Create Child"
      click_on("Add Player")
      expect(current_path).to eq("/teams/#{@team1.id}/players")
      # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',

      # a new child object/row is created for that parent,
      expect(page).to have_content("Tulo")
      # and I am redirected to the Parent Childs Index page where I can see the new child listed
    end
  end

  describe '#us 16' do
    it 'sort players alphabetically' do
      # As a visitor
      # When I visit the Parent's children Index Page
      visit "/teams/#{@team1.id}/players"
      # Then I see a link to sort children in alphabetical order
      expect(page).to have_link("Sort Players Alphabetically")
      # When I click on the link
      click_on("Sort Players Alphabetically")
      save_and_open_page
      expect(current_path).to eq("/teams/#{@team1.id}/players")
      expect("A").to appear_before("Brenton Doyle")
      expect("Brenton Doyle").to appear_before("Carlos Gonzalez")
      expect('Carlos Gonzalez').to appear_before("Charlie Blackmon")
      # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
      expect(current_path).to eq("/teams/#{@team1.id}/players")
    end
  end
end