class CaptainSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :user
  has_many :ships
end
