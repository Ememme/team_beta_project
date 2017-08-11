# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'

if Student.count < 100
  50.times do
    Student.create(
      first_name: FFaker::Name.first_name,
      last_name: FFaker::Name.last_name,
      email: FFaker::Internet.email,
      id_number: FFaker::Identification.drivers_license,
      encrypted_password: FFaker::Internet.password
    )
  end
end
