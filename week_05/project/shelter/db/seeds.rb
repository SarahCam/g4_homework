require('pry')
require('date')

require_relative('../models/animal')
require_relative('../models/owner')
require_relative('../models/adoption')

# DELETE ADOPTIONS
Adoption.delete_all()
# DELETE ANIMALS
Animal.delete_all()
# DELETE OWNERS
Owner.delete_all()


# CREATE ANIMALS
animal_1 = Animal.new({ "name" => "Harry",
                        "species" => "Dog",
                        "breed" => "Mongrel",
                        "gender" => "Male",
                        "age" => 7,
                        "photo" => "/images/dog.jpg",
                        "healthy" => "Yes",
                        "safe" => "Yes",
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
                        "healthy" => "Yes",
                        "safe" => "Yes",
                        "adopted" => false,
                        "admission_date" => DateTime.new(2018,2,3).to_s
                      })
animal_2.save()
animal_3 = Animal.new({ "name" => "Blue",
                        "species" => "Dog",
                        "breed" => "Alsation",
                        "gender" => "Male",
                        "age" => 2,
                        "photo" => "/images/dog.jpg",
                        "healthy" => "No",
                        "safe" => "Check",
                        "adopted" => false,
                        "admission_date" => DateTime.new(2018,2,11).to_s
                      })
animal_3.save()
animal_4 = Animal.new({ "name" => "Brutus",
                        "species" => "Dog",
                        "gender" => "Male",
                        "age" => 12,
                        "photo" => "/images/dog.jpg",
                        "healthy" => "Check",
                        "safe" => "Check",
                        "adopted" => false,
                        "admission_date" => DateTime.new(2018,2,1).to_s
                      })
animal_4.save()
animal_5 = Animal.new({ "name" => "Tabatha",
                        "species" => "Rabbit",
                        "gender" => "Female",
                        "age" => 1,
                        "photo" => "/images/rabbit.jpg",
                        "healthy" => "Check",
                        "safe" => "Check",
                        "adopted" => false,
                        "admission_date" => DateTime.new(2018,1,13).to_s
                      })
animal_5.save()
animal_6 = Animal.new({ "name" => "Calvin",
                        "species" => "Cat",
                        "gender" => "Male",
                        "age" => 9,
                        "photo" => "/images/cat.jpg",
                        "healthy" => "Check",
                        "safe" => "Check",
                        "adopted" => false,
                        "admission_date" => DateTime.new(2018,2,11).to_s
                      })
animal_6.save()
animal_7 = Animal.new({ "name" => "Twinkle",
                        "species" => "Horse",
                        "gender" => "Female",
                        "age" => 11,
                        "photo" => "/images/horse.jpg",
                        "healthy" => "Yes",
                        "safe" => "Check",
                        "adopted" => false,
                        "admission_date" => DateTime.new(2018,1,31).to_s
                      })
animal_7.save()
animal_8 = Animal.new({ "name" => "Bongo",
                        "species" => "Dog",
                        "gender" => "Male",
                        "age" => 13,
                        "photo" => "/images/dog.jpg",
                        "healthy" => "Check",
                        "safe" => "Yes",
                        "adopted" => false,
                        "admission_date" => DateTime.new(2018,2,10).to_s
                      })
animal_8.save()
animal_9 = Animal.new({ "name" => "Alphonso",
                        "species" => "Cat",
                        "gender" => "Male",
                        "age" => 2,
                        "healthy" => "Yes",
                        "photo" => "/images/cat.jpg",
                        "safe" => "Yes",
                        "adopted" => false,
                        "admission_date" => DateTime.new(2018,1,25).to_s
                      })
animal_9.save()
animal_10 = Animal.new({ "name" => "Sapphire",
                        "species" => "Cat",
                        "gender" => "Female",
                        "age" => 16,
                        "photo" => "/images/cat.jpg",
                        "healthy" => "Yes",
                        "safe" => "Yes",
                        "adopted" => false,
                        "admission_date" => DateTime.new(2018,2,2).to_s
                      })
animal_10.save()


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
owner_4 = Owner.new({  "first_name" => "Mary",
                        "last_name" => "Brown",
                        "telephone" => "01786 842475",
                        # "email" => "gavin@ideas.com",
                        # "address" => "???",
                        # "postcode" => "???",
                        "species" => "Cat",
                        # "breed" => "No preference",
                        "seeks_pet" => true,
                        "registration_date" => DateTime.new(2018,1,3).to_s
                      })
owner_4.save()
owner_5 = Owner.new({  "first_name" => "Ben",
                        "last_name" => "Doe",
                        "telephone" => "01786 841222",
                        # "email" => "gavin@ideas.com",
                        # "address" => "???",
                        # "postcode" => "???",
                        "species" => "Cat",
                        # "breed" => "No preference",
                        "seeks_pet" => true,
                        "registration_date" => DateTime.new(2018,1,11).to_s
                      })
owner_5.save()
owner_6 = Owner.new({  "first_name" => "Mavis",
                        "last_name" => "Smith",
                        "telephone" => "01786 841033",
                        # "email" => "gavin@ideas.com",
                        # "address" => "???",
                        # "postcode" => "???",
                        "species" => "Horse",
                        # "breed" => "No preference",
                        "seeks_pet" => true,
                        "registration_date" => DateTime.new(2018,1,14).to_s
                      })
owner_6.save()

# CREATE ADOPTIONS
animal_1.adopted_by(owner_1)
animal_2.adopted_by(owner_2)

binding.pry
nil
