class Room < ApplicationRecord
  belongs_to :community
  has_many :roomusers
  has_many :users, through: :roomusers

  def members
    id_array = self.roomusers.map {|join| join.user_id }
    members = id_array.map {|id| User.find(id)}
    return members
  end



end
