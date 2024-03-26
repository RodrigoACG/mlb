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

  describe '#us 9 ' do
    it 'displays teams on top of each page' do

      visit "/teams"
      expect(page).to have_link("Teams")
      click_on("Teams")
      expect(current_path).to eq("/teams")
    end
  end

  describe '#us 11' do
    it 'creates a new parent ' do
      #  As a visitor
      # When I visit the Parent Index page
      visit "/teams"
      # Then I see a link to create a new Parent record, "New Parent"
      expect(page).to have_link("Create Team")
      # When I click this link
      click_on("Create Team")
      expect(current_path).to eq("/teams/new")
      # Then I am taken to '/parents/new' where I  see a form for a new parent record
      fill_in :name, with: "Padres"
      fill_in :year_founded, with: 1969
      choose('world_series_false')
      # When I fill out the form with a new parent's attributes:
      click_on "Create Team"
      # And I click the button "Create Parent" to submit the form
      
      # Then a `POST` request is sent to the '/parents' route,
      # a new parent record is created,
      expect(current_path).to eq("/teams")
      expect(page).to have_content("Padres")
      # and I am redirected to the Parent Index page where I see the new Parent displayed.
    end
  end

  describe " #17" do 
    it "edits Team info" do 
      # As a visitor
      # When I visit the parent index page
      visit "/teams"
      # Next to every parent, I see a link to edit that parent's info
      expect(page).to have_link("Edit #{@team1.name} Info")
      # When I click the link
      click_on("Edit #{@team1.name} Info")
      expect(current_path).to eq("/teams/#{@team1.id}/edit")
      save_and_open_page
      # I should be taken to that parent's edit page where I can update its information just like in User Story 12
      fill_in "Name", with: "Jays"
      click_on("Update Team")
      expect(page).to have_content("Jays")
      expect(current_path).to eq("/teams/#{@team1.id}")

    end
  end
end