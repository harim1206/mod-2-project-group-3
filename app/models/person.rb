class Person < ApplicationRecord
  belongs_to :family
  has_many :tags
  has_many :memories, through: :tags
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
