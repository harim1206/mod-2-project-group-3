class Person < ApplicationRecord
  belongs_to :family
  has_many :tags
  has_many :memories, through: :tags
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true #if is account? true
  validates :first_name, presence: true
  validates :last_name, presence: true


  def full_name
    "#{first_name} #{last_name}"
  end
  
end
