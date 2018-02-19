require('pry')
require('date')

require_relative('../models/animal')
require_relative('../models/owner')


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

# DELETE OWNERS
Owner.delete_all()

# CREATE OWNERS
owner_1 = Owner.new({  "first_name" => "Bill",
                        "last_name" => "Wardlaw",
                        "telephone" => "01786 832914",
                        "email" => "bill.wardlaw@gmail.com",
                        "address" => "11 PistolMakers Row",
                        "postcode" => "FK16 7RB",
                        "species" => "Dog",
                        "breed" => "No preference",
                        "seeks_pet" => true,
                        "registration_date" => DateTime.new(2018,2,18).to_s
                      })
owner_1.save()
owner_2 = Owner.new({  "first_name" => "Jemima",
                        "last_name" => "Price",
                        "telephone" => "01786 855294",
                        "email" => "jemima.price@btinternet.com",
                        "address" => "20 Main Street",
                        "postcode" => "FK16 8FD",
                        "species" => "Cat",
                        "breed" => "Tabby",
                        "seeks_pet" => true,
                        "registration_date" => DateTime.new(2017,12,30).to_s
                      })
owner_2.save()
owner_3 = Owner.new({  "first_name" => "Gavin",
                        "last_name" => "Templeton",
                        "telephone" => "01786 841050",
                        # "email" => "gavin@ideas.com",
                        # "address" => "???",
                        # "postcode" => "???",
                        "species" => "Snake",
                        # "breed" => "No preference",
                        "seeks_pet" => true,
                        "registration_date" => DateTime.new(2018,1,3).to_s
                      })
owner_3.save()

binding.pry
nil
