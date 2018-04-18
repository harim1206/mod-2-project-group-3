class Person < ApplicationRecord
  belongs_to :family
  has_many :tags
  has_many :memories, through: :tags
  has_secure_password




end
