class Member < ApplicationRecord
  belongs_to :community
  has_many :roommembers
  has_many :rooms, through: :roommembers
end
