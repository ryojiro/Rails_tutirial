# ユーザー
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# マイクロポスト
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# forums
99.times do |n|
  Forum.create!(title: Faker::Lorem.sentence(5),
                user_id: n+1)
end

# forum_comments
forums = Forum.order(:created_at).take(6)
50.times do |n|
  body = Faker::Lorem.sentence(5)
  forums.each { |forum| forum.forum_comments.create!(body: body,
                                                user_id: n+1,
                                                forum_id: n+1) }
end

# リレーションシップ
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
