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
dog_2.save()
dog_3 = Breed.new({ "species_id" => dog.id, "name" => "labrador"})
dog_3.save()
dog_4 = Breed.new({ "species_id" => dog.id, "name" => "spaniel"})
dog_4.save()

# CREATE & SAVE CAT BREEDS
cat_1 = Breed.new({ "species_id" => cat.id, "name" => "tabby"})
cat_1.save()
cat_2 = Breed.new({ "species_id" => cat.id, "name" => "siamese"})
cat_2.save()
cat_3 = Breed.new({ "species_id" => cat.id, "name" => "black"})
cat_3.save()
cat_4 = Breed.new({ "species_id" => cat.id, "name" => "tortoiseshell"})
cat_4.save()

binding.pry
nil
