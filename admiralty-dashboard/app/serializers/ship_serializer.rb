class ShipSerializer < ActiveModel::Serializer
  attributes :id, :name, :class_type, :guns, :captain
  belongs_to :captain
end
