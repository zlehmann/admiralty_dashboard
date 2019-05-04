class UserSerializer < ActiveModel::Serializer
  attributes :id, :captains, :ships
  has_many :captains 
  has_many :ships
end
