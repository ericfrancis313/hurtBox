# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
4.times do
  Vocabulary.create!(
    word:Faker::Games::Zelda.game,
    definition:Faker::JapaneseMedia::DragonBall.character
  )
end

admin = User.create!(
  email: "fakeadmin@happypath.com",
  password: "password",
  admin: true
)
