class MemberSerializer < ActiveModel::Serializer
  attributes :id, :name, :birthday, :status, :assigned, :bio, :image
  has_many :roommembers
  has_many :rooms, through: :roommembers
  belongs_to :community
end
