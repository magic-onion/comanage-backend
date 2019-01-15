class Roommember < ApplicationRecord

  belongs_to :member
  belongs_to :room

  # def active?
  #   self.end_date > Time.now ?  self.active = true : self.active = false
  # end

end
