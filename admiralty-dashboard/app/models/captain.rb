class Captain < ApplicationRecord
    belongs_to :user
    has_many :ships
    has_many :actions, through: :ships

    validates :name, presence: true
    
    def current_ship
        ship = Ship.find(self.ship_id)
    rescue ActiveRecord::RecordNotFound
        ship = nil
    end
end
