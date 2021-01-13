# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cities = City.create([{ name: 'Lviv', population: 24000, country: 'Ukraine'},
  { name: 'Kiev', population: 24000, country: 'Ukraine'}])
users = User.create([{first_name: 'Yevkakiy', last_name: 'Kakiy', city_id:1, age:24, adress: 'dsfdsfdgf'},
  {first_name: 'Nazar', last_name: 'Bazar', city_id:2, age:24, adress: 'dsfdsfdgf'},
  {first_name: 'Inokentiy', last_name: 'TheBest', city_id:1, age:24, adress: 'dsfdsfdgf'},
  {first_name: 'Roman', last_name: 'Boram', city_id:2, age:24, adress: 'dsfdsfdgf'}])
items = Item.create([{ name:'PC', user_id: 1, price: 22 },
  { name:'Traktor', user_id: 2, price: 22 },
  { name:'Samasung', user_id: 3, price: 21 },
  { name:'Beton', user_id: 4, price: 7 },
  { name:'Betman', user_id: 4, price: 2 },
  { name:'Tank', user_id: 4, price: 23 },
  { name:'Ball', user_id: 4, price: 57 }])
reviews = Review.create([{user_id: 1, reviewiable: Item.find(3), text:'hjdkjdvfsjdsj'},
  {user_id: 2, reviewiable: Item.find(3), text:'dsfdsfdssx'},
  {user_id: 3, reviewiable: Item.find(4), text:'3425rerwedse2'},
  {user_id: 2, reviewiable: Item.find(5), text:'3425rerwedse2'},
  {user_id: 3, reviewiable: Item.find(6), text:'3425rerwedse2'},
  {user_id: 3, reviewiable: Item.find(2), text:'3425rerwedse2'}])
bookings = Booking.create([{item_id: 1, user_id: 2 },
  {item_id: 1, user_id: 3 },
  {item_id: 2, user_id: 1 },
  {item_id: 2, user_id: 3 },
  {item_id: 3, user_id: 4 },
  {item_id: 4, user_id: 1 },
  {item_id: 4, user_id: 2 }])
