require('pry')
require_relative('../models/species')
require_relative('../models/breed')


# DELETE BREEDS & SPECIES
Breed.delete_all()
Species.delete_all()

# CREATE & SAVE ANIMAL SPECIES
dog = Species.new ({ 'name' => 'dog' })
dog.save()
cat = Species.new ({ 'name' => 'cat' })
cat.save()
rabbit = Species.new ({ 'name' => 'rabbit' })
rabbit.save()
snake = Species.new ({ 'name' => 'snake' })
snake.save()
bird = Species.new ({ 'name' => 'bird' })
bird.save()

# CREATE & SAVE DOG BREEDS
dog_1 = Breed.new({ "species_id" => dog.id, "name" => "mongrel"})
dog_1.save()
dog_2 = Breed.new({ "species_id" => dog.id, "name" => "collie"})
dog_3 = Breed.new({ "species_id" => dog.id, "name" => "labrador"})
dog_4 = Breed.new({ "species_id" => dog.id, "name" => "spaniel"})

binding.pry
nil
