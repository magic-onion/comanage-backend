class User < ApplicationRecord
  has_secure_password

  has_many :communityusers
  has_many :communities
  # has_many :members, through: :communities
  has_many :roomusers
  has_many :rooms, through: :roomusers
  has_many :todos

  def member_community
    id_array = self.communityusers.map {|join| join.community_id}
    communities = id_array.map{|id| Community.find_by(id: id)}
    return communities
  end

  def set_image
    image_array = [
      'member-icon-0',
      'member-icon-1',
      'member-icon-2',
      'member-icon-3',
      'member-icon-4',
      'member-icon-5',
      'member-icon-6',
      'member-icon-7',
      'member-icon-8',
      'member-icon-9',
      'member-icon-10',
      'member-icon-11',
      'member-icon-12',
      'member-icon-13',
      'member-icon-14',
      'member-icon-15',
      'member-icon-16',
      'member-icon-17',
      'member-icon-18',
      'member-icon-19',
      'member-icon-20',
    ]
    self.image = image_array[rand(0..20)]


  end



end
