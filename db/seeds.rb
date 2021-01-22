# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
#
# cities = City.create(
#   [
#     { name: 'Lviv', population: 24_000, country: 'Ukraine' },
#     { name: 'Kiev', population: 25_000, country: 'Ukraine' }
#   ]
# )
# users = User.create(
#   [
#     { first_name: 'Yevkakiy', last_name: 'Kakiy', city_id: 1, age: 24, adress: 'dsfdsfdgf' },
#     { first_name: 'Nazar', last_name: 'Bazar', city_id: 2, age: 24, adress: 'dsfdsfdgf' },
#     { first_name: 'Inokentiy', last_name: 'TheBest', city_id: 1, age: 24, adress: 'dsfdsfdgf' },
#     { first_name: 'Roman', last_name: 'Boram', city_id: 2, age: 24, adress: 'dsfdsfdgf' }
#   ]
# )
#
#
# filters = Filter.create(
#   [
#     { name: 'Size', description: 'Size of boots' },
#     { name: 'Color', description: 'Color of somesing' },
#     { name: 'Brend', description: 'Brend of something' }
#   ]
# )
# categories = Category.create(
#   [
#     { name: 'Boots', filters: Filter.find(1, 2, 3) },
#     { name: 'Electronic', filters: Filter.find(2, 3) },
#     { name: 'Mahine', filters: Filter.find(2, 3) },
#     { name: 'Material', filters: Filter.find(1, 2, 3) }
#   ]
# )
#
# options = Option.create(
#   [
#     { value: 41, filter_id: 1 }, { value: 'black', filter_id: 2 },
#     { value: 'blue', filter_id: 2 }, { value: 'brown', filter_id: 2 },
#     { value: 'Samasung', filter_id: 3 }, { value: 'Intel', filter_id: 3 },
#     { value: 'Adidos', filter_id: 3 }, { value: 'Bud materials', filter_id: 3 },
#     { value: '25 kg', filter_id: 1 }, { value: 'LTZ', filter_id: 3 },
#     { value: 'Nike', filter_id: 3 }
#   ]
# )
#
# items = Item.create(
#   [
#     { name: 'Compucter', owner_id: 1, price: 22, category_id: 2, options: Option.find(6, 2) },
#     { name: 'Traktor', owner_id: 2, price: 22, category_id: 3, options: Option.find(3, 10) },
#     { name: 'Phone', owner_id: 3, price: 21, category_id: 2, options: Option.find(5, 2) },
#     { name: 'Beton', owner_id: 4, price: 7, category_id: 4, options: Option.find(8, 9, 2) },
#     { name: 'Gavnodavi', owner_id: 4, price: 2, category_id: 1, options: Option.find(1, 2, 11) },
#     { name: 'Pedali', owner_id: 4, price: 2, category_id: 1, options: Option.find(1, 2, 7) },
#     { name: 'Tank', owner_id: 4, price: 23, category_id: 3, options: Option.find(4, 10) },
#     { name: 'Gvozd', owner_id: 4, price: 57, category_id: 4, options: Option.find(2, 8) }
#   ]
# )
#
# bookings = Booking.create(
#   [
#     { item_id: 1, borrower_id: 2, start_rent: Time.now, end_rent: Time.now.tomorrow },
#     { item_id: 1, borrower_id: 3, start_rent: Time.now, end_rent: Time.now.tomorrow  },
#     { item_id: 2, borrower_id: 1, start_rent: Time.now, end_rent: Time.now.tomorrow  },
#     { item_id: 2, borrower_id: 3, start_rent: Time.now, end_rent: Time.now.tomorrow  },
#     { item_id: 3, borrower_id: 4, start_rent: Time.now, end_rent: Time.now.tomorrow  },
#     { item_id: 4, borrower_id: 1, start_rent: Time.now, end_rent: Time.now.tomorrow  },
#     { item_id: 4, borrower_id: 2, start_rent: Time.now, end_rent: Time.now.tomorrow  }
#   ]
# )
#
# reviews = Review.create(
#   [
#     { reviewer_id: 1, reviewable: Item.find(2), text: 'hjdkjdvfsjdsj' },
#     { reviewer_id: 2, reviewable: Item.find(3), text: 'dsfdsfdssx' },
#     { reviewer_id: 3, reviewable: Item.find(4), text: '3425rerwedse2' },
#     { reviewer_id: 2, reviewable: Item.find(5), text: '3425rerwedse2' },
#     { reviewer_id: 3, reviewable: Item.find(6), text: '3425rerwedse2' },
#     { reviewer_id: 3, reviewable: Item.find(2), text: '3425rerwedse2' }
#   ]
# )

module Seedy
  extend FactoryBot::Syntax::Methods


  nike = create(:option, value: 'Nike', id: 1)
  adi  = create(:option, value: 'Adi', id: 2)

  black = create(:option, value: 'Black', id: 3)
  white = create(:option, value: 'White', id: 4)


  force = create(:item, name: 'Air Force')

  force.options << nike
  force.options << white

  star = create(:item, name: 'Super Star')

  star.options << adi
  star.options << black
end
