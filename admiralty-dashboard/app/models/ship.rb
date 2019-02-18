class Ship < ApplicationRecord
    has_many :captains
    has_many :actions

    validates :name, :class_type, :guns, presence: true
    validates :class_type, inclusion: { in: %w(Frigate Brig Sloop Line), 
        message: "%{value} is not a valid ship class." }

    scope :not_owned, -> { where(captain_id: nil)}
end
