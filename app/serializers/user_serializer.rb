class UserSerializer < ActiveModel::Serializer
  attributes :username, :status
  has_many :communities
  has_many :rooms, through: :communities
  has_many :members, through: :communities
end