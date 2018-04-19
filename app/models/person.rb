class Person < ApplicationRecord
  has_attached_file :image, styles: {large: "600x600>", medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  belongs_to :family
  has_many :tags, dependent: :delete_all
  has_many :memories, through: :tags, dependent: :delete_all
  has_secure_password

  validates :username, presence: true, uniqueness: true, :if => :username
  validates :password, presence: true, :if => :password
  validates :dob, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
