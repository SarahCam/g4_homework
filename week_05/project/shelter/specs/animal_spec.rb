require('minitest/autorun')
require('minitest/rg')
require('pry')
require('date')

require_relative('../models/breed')
require_relative('../models/species')
require_relative('../models/animal')


class AnimalTest < MiniTest::Test

  def setup

    # DELETE ANIMALS, BREEDS & SPECIES
    Animal.delete_all()
    Breed.delete_all()
    Species.delete_all()

    # CREATE & SAVE ANIMAL SPECIES
    @dog = Species.new ({ 'name' => 'dog' })
    @dog.save()
    @cat = Species.new ({ 'name' => 'cat' })
    @cat.save()
    @rabbit = Species.new ({ 'name' => 'rabbit' })
    @rabbit.save()
    @snake = Species.new ({ 'name' => 'snake' })
    @snake.save()
    @bird = Species.new ({ 'name' => 'bird' })
    @bird.save()

    # CREATE & SAVE DOG BREEDS
    @dog_1 = Breed.new({ "species_id" => @dog.id, "name" => "mongrel"})
    @dog_1.save()
    @dog_2 = Breed.new({ "species_id" => @dog.id, "name" => "collie"})
    @dog_2.save()
    @dog_3 = Breed.new({ "species_id" => @dog.id, "name" => "labrador"})
    @dog_3.save()
    @dog_4 = Breed.new({ "species_id" => @dog.id, "name" => "spaniel"})
    @dog_4.save()

    # CREATE & SAVE CAT BREEDS
    @cat_1 = Breed.new({ "species_id" => @cat.id, "name" => "tabby"})
    @cat_1.save()
    @cat_2 = Breed.new({ "species_id" => @cat.id, "name" => "siamese"})
    @cat_2.save()
    @cat_3 = Breed.new({ "species_id" => @cat.id, "name" => "black"})
    @cat_3.save()
    @cat_4 = Breed.new({ "species_id" => @cat.id, "name" => "tortoiseshell"})
    @cat_4.save()

    # CREATE ANIMALS
    @animal_1 = Animal.new({ "name" => "Harry",
                            "species_id" => @dog.id,
                            "breed_id" => @dog_1.id,
                            "gender" => "Male",
                            "age" => 7,
                            "photo" => "harry.jpg",
                            "healthy" => "Yes",
                            "safe" => "No",
                            "adopted" => false,
                            "admission_date" => DateTime.new(2018,1,22).to_s
                          })
    @animal_1.save()
    @animal_2 = Animal.new({ "name" => "Mog",
                            "species_id" => @cat.id,
                            "breed_id" => @cat_1.id,
                            "gender" => "Female",
                            "age" => 4,
                            "photo" => "mog.jpg",
                            "healthy" => "No",
                            "safe" => "Yes",
                            "adopted" => false,
                            "admission_date" => DateTime.new(2018,2,3).to_s
                          })
    @animal_2.save()
    @animal_3 = Animal.new({ "name" => "Blue",
                            "species_id" => @dog.id,
                            # "breed_id" => @dog_1.id,
                            # "gender" => "Male",
                            # "age" => 2,
                            # "photo" => "mog.jpg",
                            "healthy" => "No",
                            "safe" => "Check",
                            "adopted" => false,
                            "admission_date" => DateTime.new(2018,2,11).to_s
                          })
    @animal_3.save()
  end

  def test_get_dog_name___Harry
    assert_equal("Harry", @animal_1.name)
  end

  def test_find_all___3
    assert_equal(3, Animal.find_all().count())
  end

  def test_find_by_id___Mog
    assert_equal("Mog", Animal.find_by_id(@animal_2.id).name)
  end

  def test_find_by_name___Mog
    assert_equal("Mog", Animal.find_by_name(@animal_2.name).name)
  end

  def test_delete___2
    @animal_3.delete()
    assert_equal(2, Animal.find_all().count())
  end

  def test_update__name___Moggy
    @animal_2.name = "Moggy"
    @animal_2.update()
    assert_equal("Moggy", Animal.find_by_id(@animal_2.id).name)
  end

  def test_update__age___Moggy
    @animal_2.age = 10
    @animal_2.update()
    assert_equal(10, Animal.find_by_id(@animal_2.id).age)
  end

  def test_update__gender___Moggy
    @animal_2.gender = "Male"
    @animal_2.update()
    assert_equal("Male", Animal.find_by_id(@animal_2.id).gender)
  end

  # def test_update__admission_date___Moggy
  #   new_date = DateTime.new(2018,1,10).to_s
  #   @animal_2.admission_date = new_date
  #   @animal_2.update()
  #   assert_equal(new_date, Animal.find_by_id(@animal_2.id).admission_date)
  # end

end
