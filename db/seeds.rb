# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Data to be added
movies_data = [
  { name: 'Iron Man', release_date: Date.new(2008, 5, 2) },
  { name: 'The Incredible Hulk', release_date: Date.new(2008, 6, 13) },
  { name: 'Iron Man 2', release_date: Date.new(2010, 5, 7) },
  { name: 'Thor', release_date: Date.new(2011, 5, 6) },
  { name: 'Captain America: The First Avenger', release_date: Date.new(2011, 7, 22) },
  { name: 'The Avengers', release_date: Date.new(2012, 5, 4) },
  { name: 'Iron Man 3', release_date: Date.new(2013, 5, 3) },
  { name: 'The Iceman', release_date: Date.new(2013, 5, 3) },
  { name: 'Happiness Runs', release_date: Date.new(2010, 5, 7) }
]

ActiveRecord::Base.transaction do
  movies_data.each do |movie_data|
    Movie.create!(movie_data)
  end
end
puts 'Data inserted successfully'