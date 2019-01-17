class User < ApplicationRecord
  has_secure_password

  has_many :communityusers
  has_many :communities
  # has_many :members, through: :communities
  has_many :roomusers
  has_many :rooms, through: :roomusers

  def member_communities
    id_array = self.communityusers.map {|join| join.community_id}
    communities = id_array.map{|id| Community.find_by(id: id)}
    return communities
  end



end
