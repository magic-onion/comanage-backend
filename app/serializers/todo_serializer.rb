class TodoSerializer < ActiveModel::Serializer
  attributes :id, :likes, :boos, :body, :date
  belongs_to :user
  belongs_to :community
end
