class User < ApplicationRecord
  has_secure_password

  has_many :communityusers
  has_many :communities
  # has_many :members, through: :communities
  has_many :roomusers
  has_many :rooms, through: :roomusers



end
