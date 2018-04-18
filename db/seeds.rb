# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

4.times do
  Family.create(family_name: Faker::Hipster.word, password: "1")
end

Person.create(first_name: "Bob", last_name: "Bob", username: "Bob", password: "1", family_id:2)
Person.create(first_name: "Harim", last_name: "Choi", username: "Harim", password: "1", family_id:1)
Person.create(first_name: "Celeste", last_name: "Gerard", username: "Celeste", password: "1", family_id:1)
Person.create(first_name: "Kate", last_name: "Schlunz", username: "Kate", password: "1", family_id:1)
Person.create(first_name: "Eric", last_name: "Kim", username: "Eric", password: "1", family_id:1)

Memory.create(description: Faker::Hipster.word, family_id: 1, image_url: "https://awkwardfamilyphotos.com/wp-content/uploads/cache/2014/01/1014719_10152120548434004_355322882_o/4033099205.jpg")
Memory.create(description: Faker::Hipster.word, family_id: 1, image_url: "https://accelerator-origin.kkomando.com/wp-content/uploads/2014/03/Awkward-Family-Photo.jpg")
Memory.create(description: Faker::Hipster.word, family_id: 1, image_url: "https://leslieannetarabella.com/wp-content/uploads/2018/03/awkward-family-portrait-1.jpg")
Memory.create(description: Faker::Hipster.word, family_id: 1, image_url: "https://sadanduseless.b-cdn.net/wp-content/uploads/2014/04/weird1.jpg")
Memory.create(description: Faker::Hipster.word, family_id: 1, image_url: "https://i.pinimg.com/originals/25/02/c2/2502c2f82aa451ca0669965f3cd83906.jpg")

Memory.create(description: Faker::Hipster.word, family_id: 2)
Memory.create(description: Faker::Hipster.word, family_id: 3)
Memory.create(description: Faker::Hipster.word, family_id: 4)

Tag.create(person_id:1, memory_id:1)
Tag.create(person_id:2, memory_id:2)
Tag.create(person_id:3, memory_id:3)
Tag.create(person_id:4, memory_id:4)
Tag.create(person_id:5, memory_id:5)
