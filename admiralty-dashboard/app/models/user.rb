class User < ApplicationRecord
    has_secure_password
    has_many :captains
    has_many :ships, through: :captains

    validates :name, :password, presence: true
    validates :name, uniqueness: true
    validates :age, numericality: { only_integer: true }
    validates :nationality, inclusion: { in: %w(British French Spanish), 
        message: "%{value} is not a valid nationality."}

    
end
