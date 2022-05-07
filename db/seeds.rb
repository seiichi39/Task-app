# coding: utf-8

User.create!( name: "管理者",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              priv_type: "管理者")
              
100.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  priv_type = "一般"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               priv_type: "一般")
end

users = User.order(:created_at).take(3)
50.times do
  name = Faker::Lorem.sentence(3)
  description = Faker::Lorem.sentence(6)
  users.each { |user| user.tasks.create!(name: name, description: description) }
end