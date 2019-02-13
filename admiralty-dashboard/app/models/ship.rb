class Ship < ApplicationRecord
    has_many :captains
    has_many :actions
end
