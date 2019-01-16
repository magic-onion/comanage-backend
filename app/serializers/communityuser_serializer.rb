class CommunityuserSerializer < ActiveModel::Serializer
  attributes :id
  has_one :community
  has_one :user
end
