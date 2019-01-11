class CommunitySerializer < ActiveModel::Serializer
  attributes :name
  has_many :rooms
  has_many :members

end
