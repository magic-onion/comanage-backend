class CommunitySerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date
  has_many :rooms
  has_many :members

end
