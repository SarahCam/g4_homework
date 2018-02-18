require('minitest/autorun')
require('minitest/rg')
require('pry')
require('date')

require_relative('../models/breed')
require_relative('../models/species')
require_relative('../models/animal')


class AnimalTest < MiniTest::Test

  def setup
    @dog_species = Species.new({ "name" => "dog" })

    @dog_breed_1 = Breed.new({ "species_id" => @dog_species.id, "name" => "mongrel"})
    @dog_breed_2 = Breed.new({ "species_id" => @dog_species.id, "name" => "collie"})
    @dog_breed_3 = Breed.new({ "species_id" => @dog_species.id, "name" => "labrador"})
    @dog_breed_4 = Breed.new({ "species_id" => @dog_species.id, "name" => "spaniel"})

    @dog_1 = Animal.new ({  "name" => "Harry",
                            "species_id" => @dog_species.id,
                            "breed_id" => @dog_breed_1.id,
                            "gender" => "M",
                            "age" => 7,
                            "photo" => "harry.jpg",
                            "healthy" => "Y",
                            "safe" => "N",
                            "adopted" => "N",
                            "admission_date" => DateTime.new(2018,1,22,9,30)
                        })
  end

  def test_get_dog_name
    assert_equal("Harry", @dog_1.name)
  end

end
