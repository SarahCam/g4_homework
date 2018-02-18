require('minitest/autorun')
require('minitest/rg')
require('pry')

require_relative('../models/breed')
require_relative('../models/species')


class BreedTest < MiniTest::Test

  def setup
    @dog = Species.new({ "name" => "dog" })
    @cat = Species.new({ "name" => "cat" })
    @snake = Species.new({ "name" => "snake" })

    @dog_1 = Breed.new({ "species_id" => @dog.id, "name" => "mongrel"})
    @dog_2 = Breed.new({ "species_id" => @dog.id, "name" => "collie"})
    @dog_3 = Breed.new({ "species_id" => @dog.id, "name" => "labrador"})
    @dog_4 = Breed.new({ "species_id" => @dog.id, "name" => "spaniel"})
  end

  def test_get_breed_name
    assert_equal("mongrel", @dog_1.name)
  end

end
