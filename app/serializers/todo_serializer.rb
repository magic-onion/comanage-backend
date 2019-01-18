class TodoSerializer < ActiveModel::Serializer
  attributes :id, :likes, :boos, :body
  bleongs_to :user
  belongs_to :community
end
