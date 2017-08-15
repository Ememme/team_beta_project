require 'ffaker'

  # Create Admin User
  AdminUser.create!(
    email:    "admin@example.com",
    password: "password",
  )

  # Student
  Student.create!(
      nickname: "student",
      password: "password",
      email:    "student@example.com",
      first_name: "Pan",
      last_name:  "Student",
      id_number:  "1293123"
  )

  50.times do |s|
    nickname = "student#{s+1}"
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

  all_students = Student.all
  number = 0
  while all_students.count > 0
    capacity = [1,2,3,4].sample
    room = Room.create!(
      name: "Room's name",
      number: number += 1,
      capacity: capacity
    )

    roommates = all_students.sample(capacity)
    room.students << roommates

    all_students -= roommates
  end
