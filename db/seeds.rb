# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

4.times do
  Family.create(family_name: Faker::Hipster.word)
end



Person.create(first_name: "Bob", family_id:1)
Person.create(first_name: "Harim", family_id:1)
Person.create(first_name: "Celeste", family_id:1)
Person.create(first_name: "Kate", family_id:1)
Person.create(first_name: "Eric", family_id:1)



Person.create(first_name: Faker::Hipster.word, bio: Faker::Hipster.paragraph, family_id:2)
Person.create(first_name: Faker::Hipster.word, bio: Faker::Hipster.paragraph, family_id:3)
Person.create(first_name: Faker::Hipster.word, bio: Faker::Hipster.paragraph, family_id:4)



Memory.create(description: Faker::Hipster.word, family_id: 1)
Memory.create(description: Faker::Hipster.word, family_id: 1)
Memory.create(description: Faker::Hipster.word, family_id: 1)
Memory.create(description: Faker::Hipster.word, family_id: 1)
Memory.create(description: Faker::Hipster.word, family_id: 1)

Memory.create(description: Faker::Hipster.word, family_id: 2)
Memory.create(description: Faker::Hipster.word, family_id: 3)
Memory.create(description: Faker::Hipster.word, family_id: 4)

Tag.create(person_id:1, memory_id:1)
Tag.create(person_id:2, memory_id:2)
Tag.create(person_id:3, memory_id:3)
Tag.create(person_id:4, memory_id:4)
Tag.create(person_id:5, memory_id:5)
