class User < ApplicationRecord
    has_secure_password
    has_many :captains
    has_many :ships, through: :captains

    validates :email, :password, presence: true
    validates :email, uniqueness: true

    def self.create_with_omniauth(auth)
        create! do |user|
            user.provider = auth["provider"]
            user.uid = auth["uid"]
            user.name = auth["info"]["name"]
        end
    end
    
end
