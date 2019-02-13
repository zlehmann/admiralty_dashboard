# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_list = [
    ["Zak", "blight1", 35, "British"],
    ["Bellamy", "canuck04", 33, "French"]
]

user_list.each do |name, password, age, nationality|
    User.create( name: name, password: password, age: age, nationality: nationality)
end

captain_list = [
    ["Jack Audbrey", 32, 1, 1],
    ["Thomas Goodmin", 35, 1, 2],
    ["Jacques Boudin", 31, 2, 3]
]

captain_list.each do |name, age, user, ship|
    Captain.create(name: name, age: age, user_id: user, ship_id: ship)
end

ship_list = [
    ["HMS Surprise", "Frigate", 20, 1],
    ["HMS Hades' Scorn", "Frigate", 24, 2],
    ["Belle Poule", "Brig", 18, 3]
]

ship_list.each do |name, type, guns, capt|
    Ship.create(name: name, class_type: type, guns: guns, captain_id: capt)
end

#Action.create(ship_id: 1, action_type: "Capture")