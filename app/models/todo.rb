class Todo < ApplicationRecord
  belongs_to :user
  belongs_to :community

  serialize :likes, Array
  serialize :boos, Array
end
