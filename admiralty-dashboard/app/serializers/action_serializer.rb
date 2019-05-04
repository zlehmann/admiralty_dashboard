class ActionSerializer < ActiveModel::Serializer
  attributes :id, :action_type, :captains, :ships
  has_many :captains
  has_many :ships
end
