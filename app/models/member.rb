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

    def set_image
      icons = [
        "/Users/atru/fis-labs/comanage/comanage-backend/app/assets/Icon-pngs/member-icon-0.png",
        "/Users/atru/fis-labs/comanage/comanage-backend/app/assets/Icon-pngs/member-icon-1.png",
        "/Users/atru/fis-labs/comanage/comanage-backend/app/assets/Icon-pngs/member-icon-2.png",
        "/Users/atru/fis-labs/comanage/comanage-backend/app/assets/Icon-pngs/member-icon-3.png",
        "/Users/atru/fis-labs/comanage/comanage-backend/app/assets/Icon-pngs/member-icon-4.png",
        "/Users/atru/fis-labs/comanage/comanage-backend/app/assets/Icon-pngs/member-icon-5.png",
        "/Users/atru/fis-labs/comanage/comanage-backend/app/assets/Icon-pngs/member-icon-6.png",
        "/Users/atru/fis-labs/comanage/comanage-backend/app/assets/Icon-pngs/member-icon-7.png",
        "/Users/atru/fis-labs/comanage/comanage-backend/app/assets/Icon-pngs/member-icon-8.png",
        "/Users/atru/fis-labs/comanage/comanage-backend/app/assets/Icon-pngs/member-icon-9.png",
        "/Users/atru/fis-labs/comanage/comanage-backend/app/assets/Icon-pngs/member-icon-10.png",
        "/Users/atru/fis-labs/comanage/comanage-backend/app/assets/Icon-pngs/member-icon-11.png",
        "/Users/atru/fis-labs/comanage/comanage-backend/app/assets/Icon-pngs/member-icon-21.png",
        "/Users/atru/fis-labs/comanage/comanage-backend/app/assets/Icon-pngs/member-icon-13.png",
        "/Users/atru/fis-labs/comanage/comanage-backend/app/assets/Icon-pngs/member-icon-14.png",
        "/Users/atru/fis-labs/comanage/comanage-backend/app/assets/Icon-pngs/member-icon-15.png",
        "/Users/atru/fis-labs/comanage/comanage-backend/app/assets/Icon-pngs/member-icon-16.png",
        "/Users/atru/fis-labs/comanage/comanage-backend/app/assets/Icon-pngs/member-icon-17.png",
        "/Users/atru/fis-labs/comanage/comanage-backend/app/assets/Icon-pngs/member-icon-18.png",
        "/Users/atru/fis-labs/comanage/comanage-backend/app/assets/Icon-pngs/member-icon-19.png",
        "/Users/atru/fis-labs/comanage/comanage-backend/app/assets/Icon-pngs/member-icon-20.png"
      ]
      rando = Random.new
      value = rando.rand(0..20)
      self.image = icons[value]
    end

end
