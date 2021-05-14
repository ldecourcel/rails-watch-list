# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

url = 'http://tmdb.lewagon.com/movie/top_rated'
movies_serialized = URI.open(url).read
count = 0

20.times do
  title = JSON.parse(movies_serialized)["results"][count]["original_title"]
  overview = JSON.parse(movies_serialized)["results"][count]["overview"]
  rating = JSON.parse(movies_serialized)["results"][count]["vote_average"]
  poster_url = "https://image.tmdb.org/t/p/w500/#{JSON.parse(movies_serialized)["results"][count]["poster_path"]}"
  Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
  count += 1
  puts 'hello'
end
