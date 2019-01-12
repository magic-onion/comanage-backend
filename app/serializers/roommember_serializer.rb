class RoommemberSerializer < ActiveModel::Serializer
  attributes :id, :active, :start_date, :end_date
  belongs_to :room
  belongs_to :member
end
