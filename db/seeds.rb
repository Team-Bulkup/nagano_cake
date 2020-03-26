# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin.create!(email: "admin@admin.com",
#              password:  "adminadmin",
#              password_confirmation: "adminadmin")

# Order.create!(customer_id: 1,
#               status: 0,
#               payment_method: true,
#               postage: 800,
#               charge: 2000,
#               postcode: "1234567",
#               address: "大阪",
#               name: "仲井",
#               phone_number: "08012345678")

OrderProduct.create!(order_id: 2,
                    name: "ケーキ",
                    quantity: 1,
                    price: 1000,
                    status: 0,)

OrderProduct.create!(order_id: 2,
                    name: "クッキー",
                    quantity: 1,
                    price: 1000,
                    status: 0,)