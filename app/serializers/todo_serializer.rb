class TodoSerializer < ActiveModel::Serializer
  attributes :id, :likes, :boos, :body, :created_at
  belongs_to :user
  belongs_to :community
end
