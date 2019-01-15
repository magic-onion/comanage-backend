class MemberSerializer < ActiveModel::Serializer
  attributes :id, :name, :birthday, :status, :assigned, :bio
  has_many :roommembers
  has_many :rooms, through: :roommembers
end
