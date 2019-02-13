class Action < ApplicationRecord
    has_many :ships
    has_many :captains, through: :ships
end
