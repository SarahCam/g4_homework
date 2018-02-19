require('pry')
require('date')
require_relative('../models/species')
require_relative('../models/breed')
require_relative('../models/animal')


# DELETE ANIMALS, BREEDS & SPECIES
Animal.delete_all()
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

# CREATE ANIMALS
animal_1 = Animal.new({ "name" => "Harry",
                        "species_id" => dog.id,
                        "breed_id" => dog_1.id,
                        "gender" => "M",
                        "age" => 7,
                        "photo" => "harry.jpg",
                        "healthy" => "Y",
                        "safe" => "N",
                        "adopted" => "N",
                        "admission_date" => DateTime.new(2018,1,22).to_s
                      })
animal_1.save()
animal_2 = Animal.new({ "name" => "Mog",
                        "species_id" => cat.id,
                        "breed_id" => cat_1.id,
                        "gender" => "F",
                        "age" => 4,
                        "photo" => "mog.jpg",
                        "healthy" => "N",
                        "safe" => "Y",
                        "adopted" => "N",
                        "admission_date" => DateTime.new(2018,2,3).to_s
                      })
animal_2.save()
animal_3 = Animal.new({ "name" => "Blue",
                        "species_id" => dog.id,
                        # "breed_id" => dog_1.id,
                        "gender" => "M",
                        # "age" => 2,
                        # "photo" => "mog.jpg",
                        # "healthy" => "N",
                        # "safe" => "Y",
                        "adopted" => "N",
                        "admission_date" => DateTime.new(2018,2,11).to_s
                      })
animal_3.save()

binding.pry
nil
