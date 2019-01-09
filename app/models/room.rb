class Room < ApplicationRecord
  belongs_to :community
  has_many :roommembers
  has_many :members, through: :roommembers 
end
