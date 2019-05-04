class ShipSerializer < ActiveModel::Serializer
  attributes :id, :name, :class_type, :guns, :captain
end
