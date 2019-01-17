class CommunitySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :communityusers
  has_many :users, through: :communityusers
  has_many :rooms
  has_many :members
  has_many :roomusers, through: :rooms


  # def members
  #   object.members
  # end
  #
  # def include_members?
  #   object.members.present?
  # end

end
