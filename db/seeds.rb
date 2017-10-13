# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
list_serialized = open(url).read
list = JSON.parse(list_serialized)
list_array = []

list["drinks"].each do |e|
  list_array << e["strIngredient1"]
end

list_array.sort!

puts 'Cleaning database...'
Cocktail.destroy_all
Ingredient.destroy_all

puts 'Creating seeds...'
# Cocktail.create(name: "Mojito")
# Cocktail.create(name: "Bloody Mary")
# Cocktail.create(name: "Sangria")

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
# Ingredient.create(name: "rum")
# Ingredient.create(name: "red wine")
# Ingredient.create(name: "vodka")
# Ingredient.create(name: "bacardi")
# Ingredient.create(name: "cranberries")
# Ingredient.create(name: "lime juice")
# Ingredient.create(name: "water")

list_array.each do |e|
  Ingredient.create(name: "#{e}")
end


# url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
# product = Product.new(name: 'NES')
# product.remote_photo_url = url
# product.save

puts 'Finished!'
