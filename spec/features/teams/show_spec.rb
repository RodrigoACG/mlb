require "rails_helper"

RSpec.describe "Team Show Page" do
  before(:each) do
    @team1 = Team.create(name: "Rockies", world_series: false, year_founded:1993)
    @team2 = Team.create(name: "Dodgers", world_series: true, year_founded:1883)
    @team3 = Team.create(name: "Braves", world_series: false, year_founded:1871)
  end

  describe '#us 2' do
    it 'has a show page' do
      visit "/teams/#{@team1.id}"
      # When I visit '/parents/:id'

      # Then I see the parent with that id including the parent's attributes
      save_and_open_page
      expect(page).to have_content("Team Name: Rockies")

      expect(page).to have_content("Have Won A World Series: false")

      expect(page).to have_content("Year founded: 1993")
      # (data from each column that is on the parent table)
    end
  end
end