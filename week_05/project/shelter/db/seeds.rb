require('pry')
require('date')

require_relative('../models/animal')


# DELETE ANIMALS
Animal.delete_all()

# CREATE ANIMALS
animal_1 = Animal.new({ "name" => "Harry",
                        "species" => "Dog",
                        "breed" => "Mongrel",
                        "gender" => "Male",
                        "age" => 7,
                        "photo" => "harry.jpg",
                        "healthy" => "Yes",
                        "safe" => "No",
                        "adopted" => false,
                        "admission_date" => DateTime.new(2018,1,22).to_s
                      })
animal_1.save()
animal_2 = Animal.new({ "name" => "Mog",
                        "species" => "Cat",
                        "breed" => "Tabby",
                        "gender" => "Female",
                        "age" => 4,
                        "photo" => "mog.jpg",
                        "healthy" => "No",
                        "safe" => "Yes",
                        "adopted" => false,
                        "admission_date" => DateTime.new(2018,2,3).to_s
                      })
animal_2.save()
animal_3 = Animal.new({ "name" => "Blue",
                        "species" => "Dog",
                        # "breed" => "Alsation",
                        "gender" => "Male",
                        # "age" => 2,
                        # "photo" => "mog.jpg",
                        "healthy" => "No",
                        "safe" => "Check",
                        "adopted" => false,
                        "admission_date" => DateTime.new(2018,2,11).to_s
                      })
animal_3.save()

binding.pry
nil
