class RoommemberSerializer < ActiveModel::Serializer
  attributes :id, :room_id, :member_id
  belongs_to :room
  belongs_to :member
end
