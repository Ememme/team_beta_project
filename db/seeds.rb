# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'
  Student.create!(
      nickname: "admin",
      password: "password",
      email:    "admin@example.com",
      first_name: "Admin",
      last_name:  "User",
      id_number:  "1293123"
  )

if Student.count < 100
  50.times do |s|
    nickname = "user#{s+1}"
    email = "#{nickname}@mail.com"
    id_number = "ID00#{s+1}"

    Student.create!(
      first_name: FFaker::Name.first_name,
      last_name:  FFaker::Name.last_name,
      nickname:   nickname,
      email:      email,
      id_number:  id_number,
      password:   FFaker::Internet.password,
      bio:        FFaker::Lorem.paragraph
    )
  end
end
