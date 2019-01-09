class Community < ApplicationRecord
  belongs_to :user
  has_many :rooms
  has_many :members
end
