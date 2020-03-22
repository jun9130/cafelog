# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tag.create([
  { name: 'wi-fiあり' },
  { name: '電源あり' },
  { name: '駅から徒歩5分'},
  { name: '50席以上'},
  { name: '禁煙'},
  { name: '分煙'},
  { name: '喫煙可'},
  { name: 'チェーン店'},
  { name: '純喫茶'}
  ])