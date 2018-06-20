3.times do |n|
  name  = Faker::Name.name
  Division.create!(name: name)
end

Position.create!(name: "boss")
Position.create!(name: "manager1")
Position.create!(name: "manager2")
Position.create!(name: "noob")
Position.create!(name: "newbie")
Position.create!(name: "intern")
Position.create!(name: "trainee")

# Users
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             division_id: 1,
             position_id: 1,
             skill: "abc",
             user_code: "the_one_above_all",
             role: 2,
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)

2.times do |n|
  name  = Faker::Name.name
  email = "examplemanager11-#{n+1}@railstutorial.org"
  password = "password"
  code  = Faker::Name.name
  User.create!(name:  name,
               email: email,
               division_id: 1,
               position_id: 2,
               skill: "abc",
               user_code: code,
               role: 1,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

2.times do |n|
  name  = Faker::Name.name
  email = "examplemanager12-#{n+1}@railstutorial.org"
  password = "password"
  code  = Faker::Name.name
  User.create!(name:  name,
               email: email,
               division_id: 1,
               position_id: 3,
               skill: "abc",
               user_code: code,
               role: 1,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

10.times do |n|
  name  = Faker::Name.name
  email = "exampleuser11-#{n+1}@railstutorial.org"
  password = "password"
  code  = Faker::Name.name
  User.create!(name:  name,
               email: email,
               division_id: 1,
               position_id: 4,
               skill: "abc",
               user_code: code,
               role: 0,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

10.times do |n|
  name  = Faker::Name.name
  email = "exampleuser12-#{n+1}@railstutorial.org"
  password = "password"
  code  = Faker::Name.name
  User.create!(name:  name,
               email: email,
               division_id: 1,
               position_id: 5,
               skill: "abc",
               user_code: code,
               role: 0,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

10.times do |n|
  name  = Faker::Name.name
  email = "exampleuser13-#{n+1}@railstutorial.org"
  password = "password"
  code  = Faker::Name.name
  User.create!(name:  name,
               email: email,
               division_id: 1,
               position_id: 6,
               skill: "abc",
               user_code: code,
               role: 0,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

10.times do |n|
  name  = Faker::Name.name
  email = "exampleuser14-#{n+1}@railstutorial.org"
  password = "password"
  code  = Faker::Name.name
  User.create!(name:  name,
               email: email,
               division_id: 1,
               position_id: 7,
               skill: "abc",
               user_code: code,
               role: 0,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

2.times do |n|
  name  = Faker::Name.name
  email = "examplemanager21-#{n+1}@railstutorial.org"
  password = "password"
  code  = Faker::Name.name
  User.create!(name:  name,
               email: email,
               division_id: 2,
               position_id: 2,
               skill: "abc",
               user_code: code,
               role: 1,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

2.times do |n|
  name  = Faker::Name.name
  email = "examplemanager22-#{n+1}@railstutorial.org"
  password = "password"
  code  = Faker::Name.name
  User.create!(name:  name,
               email: email,
               division_id: 2,
               position_id: 3,
               skill: "abc",
               user_code: code,
               role: 1,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

10.times do |n|
  name  = Faker::Name.name
  email = "exampleuser21-#{n+1}@railstutorial.org"
  password = "password"
  code  = Faker::Name.name
  User.create!(name:  name,
               email: email,
               division_id: 2,
               position_id: 4,
               skill: "abc",
               user_code: code,
               role: 0,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

10.times do |n|
  name  = Faker::Name.name
  email = "exampleuser22-#{n+1}@railstutorial.org"
  password = "password"
  code  = Faker::Name.name
  User.create!(name:  name,
               email: email,
               division_id: 2,
               position_id: 5,
               skill: "abc",
               user_code: code,
               role: 0,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

10.times do |n|
  name  = Faker::Name.name
  email = "exampleuser23-#{n+1}@railstutorial.org"
  password = "password"
  code  = Faker::Name.name
  User.create!(name:  name,
               email: email,
               division_id: 2,
               position_id: 6,
               skill: "abc",
               user_code: code,
               role: 0,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

10.times do |n|
  name  = Faker::Name.name
  email = "exampleuser24-#{n+1}@railstutorial.org"
  password = "password"
  code  = Faker::Name.name
  User.create!(name:  name,
               email: email,
               division_id: 2,
               position_id: 7,
               skill: "abc",
               user_code: code,
               role: 0,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

2.times do |n|
  name  = Faker::Name.name
  email = "examplemanager31-#{n+1}@railstutorial.org"
  password = "password"
  code  = Faker::Name.name
  User.create!(name:  name,
               email: email,
               division_id: 3,
               position_id: 2,
               skill: "abc",
               user_code: code,
               role: 1,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

2.times do |n|
  name  = Faker::Name.name
  email = "examplemanager32-#{n+1}@railstutorial.org"
  password = "password"
  code  = Faker::Name.name
  User.create!(name:  name,
               email: email,
               division_id: 3,
               position_id: 3,
               skill: "abc",
               user_code: code,
               role: 1,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

10.times do |n|
  name  = Faker::Name.name
  email = "exampleuser31-#{n+1}@railstutorial.org"
  password = "password"
  code  = Faker::Name.name
  User.create!(name:  name,
               email: email,
               division_id: 3,
               position_id: 4,
               skill: "abc",
               user_code: code,
               role: 0,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

10.times do |n|
  name  = Faker::Name.name
  email = "exampleuser32-#{n+1}@railstutorial.org"
  password = "password"
  code  = Faker::Name.name
  User.create!(name:  name,
               email: email,
               division_id: 3,
               position_id: 5,
               skill: "abc",
               user_code: code,
               role: 0,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

10.times do |n|
  name  = Faker::Name.name
  email = "exampleuser33-#{n+1}@railstutorial.org"
  password = "password"
  code  = Faker::Name.name
  User.create!(name:  name,
               email: email,
               division_id: 3,
               position_id: 6,
               skill: "abc",
               user_code: code,
               role: 0,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

10.times do |n|
  name  = Faker::Name.name
  email = "exampleuser34-#{n+1}@railstutorial.org"
  password = "password"
  code  = Faker::Name.name
  User.create!(name:  name,
               email: email,
               division_id: 3,
               position_id: 7,
               skill: "abc",
               user_code: code,
               role: 0,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# requests
users = User.where(["role = 0"]).order(:created_at).take(6)
content = Faker::Lorem.sentence(5)
users.each { |user| user.requests.create!(request_type: "dateoff", content: content,
  date: "1/1/2018", status: 0) }

content = Faker::Lorem.sentence(5)
users.each { |user| user.requests.create!(request_type: "dateoff", content: content,
  date: "2/1/2018", status: 1) }

content = Faker::Lorem.sentence(5)
users.each { |user| user.requests.create!(request_type: "dateoff", content: content,
  date: "3/1/2018", status: 2) }

content = Faker::Lorem.sentence(5)
users.each { |user| user.requests.create!(request_type: "il", content: content,
  date: "10/2/2018", time: "2:3", offset_date: "20/12/2018", offset_time_start: "6:7",
  offset_time_end: "6:17", status: 0) }

content = Faker::Lorem.sentence(5)
users.each { |user| user.requests.create!(request_type: "il", content: content,
  date: "11/2/2018", time: "2:3", offset_date: "21/12/2018", offset_time_start: "6:7",
  offset_time_end: "6:17", status: 1) }

content = Faker::Lorem.sentence(5)
users.each { |user| user.requests.create!(request_type: "il", content: content,
  date: "12/2/2018", time: "2:3", offset_date: "22/12/2018", offset_time_start: "6:7",
  offset_time_end: "6:17", status: 2) }

content = Faker::Lorem.sentence(5)
users.each { |user| user.requests.create!(request_type: "le", content: content,
  date: "11/6/2018", time: "4:5", offset_date: "13/6/2018", offset_time_start: "3:6",
  offset_time_end: "3:16", status: 0) }

content = Faker::Lorem.sentence(5)
users.each { |user| user.requests.create!(request_type: "le", content: content,
  date: "12/6/2018", time: "4:5", offset_date: "14/6/2018", offset_time_start: "3:6",
  offset_time_end: "3:16", status: 1) }

content = Faker::Lorem.sentence(5)
users.each { |user| user.requests.create!(request_type: "le", content: content,
  date: "13/6/2018", time: "4:5", offset_date: "15/6/2018", offset_time_start: "3:6",
  offset_time_end: "3:16", status: 2) }

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
