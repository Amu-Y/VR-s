# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   name: 'AMU',
   email: 'admin@test.com',
   password: 'password'
)

Genre.create!(
  [
   {name: 'コンテンツ'},
   {name: 'ゲーム'},
   {name: '技術'},
   {name: '企業'}
  ]
)

User.create!(
  [
   {name: 'ジョナサン', email: 'jojo@test.com', password: 'password1'},
   {name: 'ジョセフ', email: 'of@test.com', password: 'password2'},
   {name: '承太郎', email: 'strange@test.com', password: 'password3'},
   {name: '仗助', email: 'adventure@test.com', password: 'password4'}
  ]
)

Room.create!(
  [
   {name: 'ALTDEUS: Beyond Chronos', genre_id: 2},
   {name: 'Oculus', genre_id: 3},
   {name: 'Pistol Whip', genre_id: 2},
   {name: 'SUPERHOT VR', genre_id: 2},
   {name: 'Beat Saber', genre_id: 2},
   {name: 'Creed: Rise to Glory™', genre_id: 2}
  ]
 )