class Captain < ApplicationRecord
    belongs_to :user
    has_many :ships
    has_many :actions, through: :ships
end
