class RoomuserSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :room_id
  has_one :user
  has_one :room
end
