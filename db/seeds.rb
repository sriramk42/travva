# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Item.destroy_all if Rails.env.development?
Trip.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?


require 'faker'

outdoor_day_items = ['hiking a mountain', 'snorkeling', 'city tour', 'arts festival', 'street food', 'beach', 'boarding', 'famous monuments', 'shopping plaza', 'onsen']

outdoor_night_items = ['concert', 'fancy dinner', 'outdoor bar', 'onsen', 'observatory']

indoor_day_items = ['museum of modern art', 'history museum', 'shopping mall', 'spa']

indoor_night_items = ['concert', 'fancy dinner', 'famous bar']

type_of_item = ['Sport', 'Food', 'Music', 'Museum', 'Relax and Rejuvenate', 'Shopping', 'Culture', 'Religion', 'History', 'Nightlife', 'Romance']

rating = [1,2,3,4,5]

country = {
  JP: {city: ['Osaka', 'Tokyo', 'Nagano', 'Fukuoka', 'Hiroshima', 'Okinawa'],
          address: ['Sapporo-shi, Teine-ku, Akebono-11-jō, 2-chōme-3-ban-12-gō',
                    'Haneya 4-1-A-kumi, Ōita-shi, Ōita-ken',
                    'Wakuramachi yo 80, Nanao-shi, Ishikawa-ken 926-0192',
                    'Higashi Oyima 34, Tameiko, Taito-ken',
                    'Yamaguchi 34, Akebane, Kita'
          ]
        },
  IT: {city: ['Rome', 'Venice', 'Milan', 'Turin', 'Naples', 'Florence'],
          address: ['Via Sergente Maggiore 43',
                    'Via Miochio 100',
                    'Via Pompeo Litta, 5',
                    'Via Coglio Litta, 78',
                    'Via Pigletto, 111'
          ]

        },
  ES: {city: ['Madrid', 'Barcelona', 'Sevilla', 'Valencia', 'Cordoba', 'Toledo'],
          address: ['Calle Las Rosas, 124',
                    'Avenida De La Fuente 22',
                    'Calle Del Beso 11',
                    'Calle Cantores 44',
                    'Avenida La Fresa 567'
          ]
        },
  DE: {city: ['Berlin', 'Munich', 'Hamburg', 'Stuttgart', 'Dortmund', 'Bremen'],
          address: ['Schulstrasse 4',
                    'Grüner Weg 6',
                    'Holstenwall 11',
                    'Ansgarstr. 4, Wallenhorst, 49134',
                    'Südweg 3, Glandorf, 49219'
          ]
        },
  CU: {city: ['La Habana', 'Varadero', 'Santa Clara', 'Varadero', 'Cienfuegos'],
          address: ['Calle del Mar 23',
                    'Avenida de la Revolucion 1900',
                    'Calle del Cangrejo 1',
                    'Calle del Puro',
                    'Avenida de la Defensa 111'
          ]
        }
}


#OUTDOOR DAY

# p country[:JP][:city].sample

  user = User.new
  user.email = 'test@example.com'
  user.password = 'valid_password'
  user.password_confirmation = 'valid_password'
  user.save!



25.times do
  Item.create! ({
    user: User.last,
    title: outdoor_day_items.sample,
    url: 'www.eventbrite.com',
    country: "JP",
    city: country[:JP][:city].sample,
    address: country[:JP][:address].sample,
    time_of_day: 'Daytime',
    weather: 'Outdoor',
    category: type_of_item.sample,
    rating: rating.sample,
    price: rand(0..20),
    remote_photo_url: "https://cdn.britannica.com/03/75503-050-F65891FA/volcanic-cone-Japan-Mount-Fuji.jpg"
})
end

#INDOOR DAY

25.times do
  Item.create! ({
    user: User.last,
    title: indoor_day_items.sample,
    url: 'www.eventbrite.com',
    country: "IT",
    city: country[:IT][:city].sample,
    address: country[:IT][:address].sample,
    time_of_day: 'Nighttime',
    weather: 'Indoor',
    category: type_of_item.sample,
    rating: rating.sample,
    price: rand(0..20),
    remote_photo_url: "https://d36tnp772eyphs.cloudfront.net/blogs/1/2011/05/italy-1200x815.jpg"
})
end

#OUTDOOR NIGHT

25.times do
  Item.create! ({
    user: User.last,
    title: outdoor_night_items.sample,
    url: 'www.eventbrite.com',
    country: "ES",
    city: country[:ES][:city].sample,
    address: country[:ES][:address].sample,
    time_of_day: 'Nighttime',
    weather: 'Outdoor',
    category: type_of_item.sample,
    rating: rating.sample,
    price: rand(0..20),
    remote_photo_url: "https://upload.wikimedia.org/wikipedia/commons/f/fc/C%C3%B3rdoba_%28Spain%29_at_night.jpg"
})
end

#INDOOR DAY

25.times do
  Item.create! ({
    user: User.last,
    title: indoor_night_items.sample,
    url: 'www.eventbrite.com',
    country: "DE",
    city: country[:DE][:city].sample,
    address: country[:DE][:address].sample,
    time_of_day: 'Daytime',
    weather: 'Indoor',
    category: type_of_item.sample,
    rating: rating.sample,
    price: rand(0..20),
    remote_photo_url: "https://mk0travelawayrru2xew.kinstacdn.com/wp-content/uploads/2013/04/berlin-cathedral.jpg"
})
end


trip_name = ['Honeymoon', '5 Year Anniversary', 'Valentines Day', 'Family Trip', 'Adventure Time', 'Our first big trip together!']


15.times do
  start_date_value = Faker::Date.forward
  trip = Trip.new ({
    user: User.last,
    name: trip_name.sample,
    destination: "JP",
    start_date: start_date_value,
    end_date: start_date_value + rand(7..15).days
  })
  trip.save!
end


  Item.create! ({
    user: User.last,
    title: "Item 1 for testing",
    url: 'www.eventbrite.com',
    country: "ES",
    city: country[:ES][:city].sample,
    address: country[:ES][:address].sample,
    time_of_day: 'Daytime',
    weather: 'Outdoor',
    category: type_of_item.sample,
    rating: 5,
    price: 5,
    remote_photo_url: "https://cdn.britannica.com/03/75503-050-F65891FA/volcanic-cone-Japan-Mount-Fuji.jpg"
})

  Item.create! ({
    user: User.last,
    title: "Item 2 for testing",
    url: 'www.eventbrite.com',
    country: "ES",
    city: country[:ES][:city].sample,
    address: country[:ES][:address].sample,
    time_of_day: 'Daytime',
    weather: 'Outdoor',
    category: type_of_item.sample,
    rating: 5,
    price: 4,
    remote_photo_url: "https://cdn.britannica.com/03/75503-050-F65891FA/volcanic-cone-Japan-Mount-Fuji.jpg"
})

  Item.create! ({
    user: User.last,
    title: "Item 3 for testing",
    url: 'www.eventbrite.com',
    country: "ES",
    city: country[:ES][:city].sample,
    address: country[:ES][:address].sample,
    time_of_day: 'Daytime',
    weather: 'Outdoor',
    category: type_of_item.sample,
    rating: 5,
    price: 3,
    remote_photo_url: "https://cdn.britannica.com/03/75503-050-F65891FA/volcanic-cone-Japan-Mount-Fuji.jpg"
})

#   Trip.create!({

#   user: User.last,
#   name: "ES",
#   start_date:Date.today,
#   end_date:Date.today  + rand(7..15).days

# })

#   TripItem.create! ({
#     trip_id: Trip.last.id,
#     item_id: Item.last.id
# })

#   TripItem.create! ({
#     trip_id: Trip.last.id,
#     item_id: Item.last.id - 1
# })

#   TripItem.create! ({
#     trip_id: Trip.last.id,
#     item_id: Item.last.id - 2
# })



 puts "Seed successfully created!!!"



# create_table "items", force: :cascade do |t|
#     t.string "title"
#     t.string "url"
#     t.string "address"
#     t.string "time_of_day"
#     t.string "weather"
#     t.string "category"
#     t.float "price"
#     t.string "country"
#     t.string "city"
#     t.integer "rating"
#     t.bigint "user_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["user_id"], name: "index_items_on_user_id"
#   end

#   create_table "trip_items", force: :cascade do |t|
#     t.bigint "trip_id"
#     t.bigint "item_id"
#     t.datetime "date"
#     t.integer "order"
#     t.text "notes"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["item_id"], name: "index_trip_items_on_item_id"
#     t.index ["trip_id"], name: "index_trip_items_on_trip_id"
#   end

#   create_table "trips", force: :cascade do |t|
#     t.string "name"
#     t.date "start_date"
#     t.date "end_date"
#     t.bigint "user_id"
#     t.string "destination"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["user_id"], name: "index_trips_on_user_id"
#   end

#   create_table "users", force: :cascade do |t|
#     t.string "email", default: "", null: false
#     t.string "encrypted_password", default: "", null: false
#     t.string "reset_password_token"
#     t.datetime "reset_password_sent_at"
#     t.datetime "remember_created_at"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["email"], name: "index_users_on_email", unique: true
#     t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
#   end

#   add_foreign_key "items", "users"
#   add_foreign_key "trip_items", "items"
#   add_foreign_key "trip_items", "trips"
#   add_foreign_key "trips", "users"
# end
