class ShipSerializer < ActiveModel::Serializer
  attributes :id, :name, :class_type, :guns
  belongs_to :captain
end
