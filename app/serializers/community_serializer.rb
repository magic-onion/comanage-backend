class CommunitySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :communityusers
  has_many :users, through: :communityusers
  has_many :rooms
  has_many :members

end
