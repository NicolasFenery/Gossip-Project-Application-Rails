# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
City.destroy_all
Tag.destroy_all
Gossip.destroy_all
PrivateMessage.destroy_all
Comment.destroy_all
Like.destroy_all

10.times do
  city = City.create!(name: Faker::Address.city, postal_code: Faker::Address.zip)
end

10.times do
  user = User.create!(first_name: Faker::HarryPotter.character, last_name: Faker::HarryPotter.character, description: Faker::MichaelScott.quote, email: Faker::Internet.email, age: Faker::Number.number(2), city_id: City.all.sample.id, password: Faker::Number.number(7))
end

20.times do
  gossip = Gossip.create!(title: Faker::Cat.name, content: Faker::HarryPotter.quote, date: Faker::Date.backward(10), user_id: User.all.sample.id)
end
10.times do
  tag = Tag.create!(title: Faker::HarryPotter.spell, gossip_id: Gossip.all.sample.id)
end

10.times do
  private_message = PrivateMessage.create(content: Faker::HarryPotter.quote, recipient_id: User.all.sample.id, sender_id: User.all.sample.id)
end

10.times do
  comment = Comment.create!(content: Faker::HarryPotter.quote, gossip_id: Gossip.all.sample.id, user_id: User.all.sample.id)
end

10.times do
  like = Like.create!(user_id: User.all.sample.id, gossip_id: Gossip.all.sample.id)
end