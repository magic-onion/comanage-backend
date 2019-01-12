class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :occupancy
  has_many :members
end
