class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :status, :bio, :image
  has_many :communities
  has_many :rooms, through: :communities
  has_many :todos
  # has_many :members, through: :communities
end
