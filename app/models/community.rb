class Community < ApplicationRecord
  belongs_to :user
  has_many :communityusers
  has_many :users, through: :communityusers
  has_many :rooms
  has_many :members
  has_many :roommembers, through: :rooms
end
