# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: 'test@test.com',
    password: 'testtest'
 )

Genre.create!(
    [
        {
            name: "ケーキ"
        },
        {
            name: "焼き菓子"
        }
    ]
)

Item.create!(
  [
    {
      name: "ショートケーキ",
      description: "大特価",
      price_excluding_tax: "400",
      genre_id: 1
    },
    {
      name: "クッキー",
      description: "サクサクのクッキー",
      price_excluding_tax: "200",
      genre_id: 2
    },
    {
      name: "パンケーキ",
      description: "特産品",
      price_excluding_tax: "300",
      genre_id: 1
    }
  ]
 )