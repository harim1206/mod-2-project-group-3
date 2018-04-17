class Person < ApplicationRecord
  belongs_to :family
  has_many :tags
  has_many :memories, through: :tags
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

end
