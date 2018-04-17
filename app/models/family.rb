class Family < ApplicationRecord
    has_many :people
    has_many :memories

    def family_name_and_id
      "#{self.id}. #{self.family_name}"
    end
end
