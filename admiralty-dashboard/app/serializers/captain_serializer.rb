class CaptainSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :user, :ships
  has_many :ships
end
