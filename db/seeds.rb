# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

@team1 = Team.create(name: "Rockies", world_series: false, year_founded:1993)
@team2 = Team.create(name: "Dodgers", world_series: true, year_founded:1883)
@team3 = Team.create(name: "Braves", world_series: false, year_founded:1871)

@player1 = @team1.players.create!(name: "Brenton Doyle", jersey_number: 25, golden_glove: true)
@player2 = @team1.players.create!(name: "Carlos Gonzalez", jersey_number: 5, golden_glove: true)
@player3 = @team1.players.create!(name: "Charlie Blackmon", jersey_number: 19, golden_glove: false)
@player4 = @team2.players.create!(name: "Freddie Freeman", jersey_number: 5, golden_glove: true)
