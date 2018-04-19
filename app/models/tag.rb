class Tag < ApplicationRecord
  belongs_to :person
  belongs_to :memory
end
