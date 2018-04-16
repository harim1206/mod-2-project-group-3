class Memory < ApplicationRecord
  belongs_to :family
  has_many :tags
  has_many :people, through: :tags
end
