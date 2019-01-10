class Member < ApplicationRecord
  belongs_to :community
  has_many :roommembers
  has_many :rooms, through: :roommembers


  # def initialize(community, name=nil, birthday=Date.parse('31/12/1999'), status=nil, assigned=false, assignment_start=nil, assignment_end=nil, bio=nil)
  #   @community = community
  #   @name = name
  #   @birthday = Date.parse('31/12/1999')
  #   @status = status
  #   @assigned = assigned
  #   @assignment_start = assignment_start
  #   @assignment_end = assignment_end
  #   @bio = Faker::Overwatch.quote
  # end


end
