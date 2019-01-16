class Room < ApplicationRecord
  belongs_to :community
  has_many :roomusers
  has_many :users, through: :roomusers
end
