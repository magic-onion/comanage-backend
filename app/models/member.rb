class Member < ApplicationRecord
  belongs_to :community
  has_many :roommembers
  has_many :rooms, through: :roommembers


    def check_assigned_status
      active_assignments = self.roommembers.select{|assignment| assignment.active}
      if active_assignments.length > 0
        self.assigned = true
      elsif active_assignments.length < 0
        self.assigned = false
      end
    end

end
