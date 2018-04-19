class Memory < ApplicationRecord
  belongs_to :family
  has_many :tags
  has_many :people, through: :tags

  validates :title, presence: true

  #create a new tag instance
  def create_tag(person_id)
    Tag.create(person_id: person_id, memory_id: self.id)
  end

  #returns an array of people that are tagged to this memory
  def get_tagged_people
    tagged_people = []
    Tag.where(memory_id: self.id).each do |tag|
      tagged_people << Person.find(tag.person_id)
    end

    tagged_people
  end

end
