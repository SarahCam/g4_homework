require('pry')
require_relative('../models/species')

# DELETE  --  DATA FROM TABLES
Species.delete_all()


# CREATE  --  DATA IN TABLES
dog = Species.new ({ 'name' => 'dog' })
cat = Species.new ({ 'name' => 'cat' })
rabbit = Species.new ({ 'name' => 'rabbit' })


# SAVE  --  DATA IN TABLES
dog.save()
cat.save()
rabbit.save()

binding.pry
nil
