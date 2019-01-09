class User < ApplicationRecord
  has_many :communities
  has_many :rooms, through: :communities
  has_many :members, through: :communities
end
