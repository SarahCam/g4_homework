require('pry')
require_relative('../models/species')

# DELETE SPECIES
Species.delete_all()

# CREATE & SAVE SPECIES
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

binding.pry
nil
