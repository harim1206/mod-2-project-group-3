class Memory < ApplicationRecord
  has_attached_file :image, styles: {large: "600x600>", medium: "300x300>", thumb: "150x150#" },
    :default_url => "/app/assets/images/missing_memory.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  belongs_to :family
  has_many :tags, dependent: :delete_all
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


  def get_correct_memory_link

    if self.image.url != "/app/assets/images/missing_memory.jpg"
       return self.image.url(:medium)
    elsif self.image_url && self.image_url.strip != ""
       return self.image_url
    else
       return "/assets/missing_memory.jpg"
    end

  end

end
