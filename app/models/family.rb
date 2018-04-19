class Family < ApplicationRecord
    has_attached_file :image, styles: {large: "600x600>", medium: "300x300>", thumb: "150x150#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    has_many :people
    has_many :memories
    has_secure_password

    validates :family_name, presence: true

    def family_name_and_id
      "#{self.id}. #{self.family_name}"
    end
end
