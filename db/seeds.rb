# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

outdoor_day_items = ['hiking a mountain', 'snorkeling', 'city tour', 'arts festival', 'street food', 'beach', 'boarding', 'famous monuments', 'shopping plaza', 'onsen']

outdoor_night_items = ['concert', 'fancy dinner', 'outdoor bar', 'onsen', 'observatory']

indoor_day_items = ['museum of modern art', 'history museum', 'shopping mall', 'spa']

indoor_night_items = ['concert', 'fancy dinner', 'famous bar']

type_of_item = ['sport', 'food', 'music', 'museum', 'relax and rejuvinate', 'shopping', 'culture', 'religion', 'history', 'nightlife', 'romance']

rating = [1,2,3,4,5]

#OUTDOOR DAY

25.times do
  Item.create! ({
    title: outdoor_day_items.sample,
    url: 'www.eventbrite.com',
    address: "Country: #{item.country}, City: #{item.city}, Street: Sesame, ZIP: 10012",
    time_of_day: 'Daytime',
    weather: 'Outdoor',
    category: type_of_item.sample,
    country: Faker::Address.country,
    rating: rating.sample,
    rating: rand(0..20)
})
end

#INDOOR DAY

25.times do
  Item.create! ({
    title: indoor_day_items.sample,
    url: 'www.eventbrite.com',
    address: "Country: #{item.country}, City: #{item.city}, Street: Sesame, ZIP: 10012#",
    time_of_day: 'Nighttime',
    weather: 'Indoor',
    category: type_of_item.sample,
    country: Faker::Address.country,
    rating: rand(0..20)
})
end

#OUTDOOR NIGHT

25.times do
  Item.create! ({
    title: outdoor_night_items.sample,
    url: 'www.eventbrite.com',
    address: "Country: #{item.country}, City: #{item.city}, Street: Sesame, ZIP: 10012#",
    time_of_day: 'Nighttime',
    weather: 'Outdoor',
    category: type_of_item.sample,
    country: Faker::Address.country,
    rating: rand(0..20)
})
end

#INDOOR DAY

25.times do
  Item.create! ({
    title: indoor_night_items.sample,
    url: 'www.eventbrite.com',
    address: "Country: #{item.country}, City: #{item.city}, Street: Sesame, ZIP: 10012#",
    time_of_day: 'Daytime',
    weather: 'Indoor',
    category: type_of_item.sample,
    city: 'unknown',
    country: Faker::Address.country,
    rating: rand(0..20)
})
end


trip_name = ['Honeymoon', '5 Year Anniversary', 'Valentines Day', 'Family Trip', 'Adventure Time', 'Our first big trip together!']

15.times do
  Trip.create! ({
    name: trip_name.sample,
    start_date: Faker::Date.forward,
    end_date: trip.start_date + rand(7..15).days
  })
end




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
