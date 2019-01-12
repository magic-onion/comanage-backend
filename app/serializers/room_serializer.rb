class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :occupancy
  has_many :roommembers
  has_many :members, through: :roommembers
end
