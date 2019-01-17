class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :occupancy
  has_many :roomusers
  has_many :users, through: :roomusers
end
