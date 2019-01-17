class CommunityuserSerializer < ActiveModel::Serializer
  attributes :id, :community_id, :user_id
  has_one :community
  has_one :user
end
