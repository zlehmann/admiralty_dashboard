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

