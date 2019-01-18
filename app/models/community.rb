class Community < ApplicationRecord
  belongs_to :user
  has_many :communityusers
  has_many :users, through: :communityusers
  has_many :rooms
  has_many :roomusers, through: :rooms
  has_many :todos


  def members
    id_array = self.communityusers.map {|join_table| join_table.user_id}
    members = id_array.map {|id| User.find(id)}
    return members
  end

  def manager
    manager = User.find_by(id: self.user_id)
    return manager
  end


end
