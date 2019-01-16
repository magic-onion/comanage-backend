class CommunitySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :rooms
  has_many :members
  has_many :roommembers, through: :rooms

end
