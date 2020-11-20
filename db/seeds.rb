# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list';
json_string = JSON.parse(open(url).read);

json_string['drinks'].each do |ingredient|
  Ingredient.create!(
    name: ingredient['strIngredient1']
  )
end

file = URI.open('https://res.cloudinary.com/ian-industries/image/upload/v1605842255/wbo7at9yezijixprciyy.png')
cocktail = Cocktail.new(name: 'Asian Hooker')
cocktail.photo.attach(io: file, filename: 'wbo7at9yezijixprciyy.png', content_type: 'image/png')
