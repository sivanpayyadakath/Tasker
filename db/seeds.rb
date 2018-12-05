# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
 User.create!(
      name: 'the picture guy',
      email: 'pictureguy@gmail.com'
 )

#
# 3.times do
#   Todo.create!(
#       title: Faker::Commerce.product_name,
#       content: Faker::Lorem.sentence(5),
#       deadline_at: Faker::Date.forward,
#       priority: 3,
#       status: "not started",
#       user_id: 2
#   )
# end
#
# Todo.create!(
#     title: Faker::Commerce.product_name,
#     content: Faker::Lorem.sentence(5),
#     deadline_at: Time.now + 2.minutes,
#     priority: 2,
#     status: "not started",
#     user_id: 2
# )