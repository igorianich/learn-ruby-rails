# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cities = City.create(
  [
    { name: 'Lviv', population: 24_000, country: 'Ukraine' },
    { name: 'Kiev', population: 25_000, country: 'Ukraine' }
  ]
)
users = User.create(
  [
    { first_name: 'Yevkakiy', last_name: 'Kakiy', city_id: 1, age: 24, adress: 'dsfdsfdgf' },
    { first_name: 'Nazar', last_name: 'Bazar', city_id: 2, age: 24, adress: 'dsfdsfdgf' },
    { first_name: 'Inokentiy', last_name: 'TheBest', city_id: 1, age: 24, adress: 'dsfdsfdgf' },
    { first_name: 'Roman', last_name: 'Boram', city_id: 2, age: 24, adress: 'dsfdsfdgf' }
  ]
)
items = Item.create(
  [
    { name: 'PC', owner_id: 1, price: 22 },
    { name: 'Traktor', owner_id: 2, price: 22 },
    { name: 'Samasung', owner_id: 3, price: 21 },
    { name: 'Beton', owner_id: 4, price: 7 },
    { name: 'Betman', owner_id: 4, price: 2 },
    { name: 'Tank', owner_id: 4, price: 23 },
    { name: 'Ball', owner_id: 4, price: 57 }
  ]
)
bookings = Booking.create(
  [
    { item_id: 1, borrower_id: 2 },
    { item_id: 1, borrower_id: 3 },
    { item_id: 2, borrower_id: 1 },
    { item_id: 2, borrower_id: 3 },
    { item_id: 3, borrower_id: 4 },
    { item_id: 4, borrower_id: 1 },
    { item_id: 4, borrower_id: 2 }
  ]
)

reviews = Review.create(
  [
    { reviewer_id: 1, reviewable: Item.find(3), text: 'hjdkjdvfsjdsj' },
    { reviewer_id: 2, reviewable: Item.find(3), text: 'dsfdsfdssx' },
    { reviewer_id: 3, reviewable: Item.find(4), text: '3425rerwedse2' },
    { reviewer_id: 2, reviewable: Item.find(5), text: '3425rerwedse2' },
    { reviewer_id: 3, reviewable: Item.find(6), text: '3425rerwedse2' },
    { reviewer_id: 3, reviewable: Item.find(2), text: '3425rerwedse2' }
  ]
)
