# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_list = [
    ["Bellamy", "canuck04", nil, "bgrind@gmail.com"],
    ["Boat Fan", "something", nil, "something@test.com"]
]

user_list.each do |name, password, uid, email|
    User.create( name: name, password: password, uid: uid, email: email)
end

captain_list = [
    ["Jack Audbrey", 32, 1, 1],
    ["Thomas Goodmin", 35, 1, 2],
    ["Jacques Boudin", 31, 2, 2],
    ["Joe 'ain't got no ship' Smith", 25, 1, nil]
]

captain_list.each do |name, age, user, ship|
    Captain.create(name: name, age: age, user_id: user, ship_id: ship)
end

action_list = [
    [1, "Capture"],
    [2, "Combat"],
    [3, "Combat"],
    [1, "Newly Commissioned"]
]

action_list.each do |ship, action_type|
    Action.create(ship_id: ship, action_type: action_type)
end

ship_list = [
    ["HMS Surprise", "Frigate", 20, 1, 4],
    ["HMS Hades' Scorn", "Frigate", 24, 2, 1],
    ["Belle Poule", "Brig", 18, 3, 2],
    ["Boaty McBoatFace", "Sloop", 8, 2, 2]
]

ship_list.each do |name, class_type, guns, capt, act|
    Ship.create(name: name, class_type: class_type, guns: guns, captain_id: capt, action_id: act)
end
