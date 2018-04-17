class Family < ApplicationRecord
    has_many :people
    has_many :memories
    has_secure_password

    validates :family_name, presence: true

    def family_name_and_id
      "#{self.id}. #{self.family_name}"
    end
end
