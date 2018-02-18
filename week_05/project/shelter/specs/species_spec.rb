require('minitest/autorun')
require('minitest/rg')
require('pry')

require_relative('../models/species')


class SpeciesTest < MiniTest::Test

  def setup
    @dog = Species.new({ "name" => "dog" })
    @cat = Species.new({ "name" => "cat" })
    @snake = Species.new({ "name" => "snake" })
  end

  def test_get_species_name
    assert_equal("cat", @cat.name)
  end

  def test_save
    @dog.save()
    @cat.save()
    @snake.save()
  end

end
