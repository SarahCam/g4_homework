require("minitest/autorun")
require("minitest/rg")

require_relative("../bear")
require_relative("../river")
require_relative("../fish")

class BearTest < MiniTest::Test

  def setup
    @yogi = Bear.new("Yogi")
    @amazon = River.new("Amazon")
    @trout = Fish.new("Trout")
    @salmon = Fish.new("Salmon")
  end

  def test_get_name
    assert_equal("Yogi", @yogi.name)
  end

  def test_get_food_count__empty_stomach
    assert_equal(0, @yogi.food_count)
  end

  def test_get_food_count__eaten_one_fish
    @yogi.eat_fish(@trout)
    assert_equal(1, @yogi.food_count)
  end

  def test_eat_fish
    @amazon.add_fish(@trout)
    @amazon.add_fish(@salmon)
    fish = @amazon.first_fish()
    @yogi.eat_fish(fish)
    @amazon.lose_fish(fish)
    assert_equal(1, @yogi.food_count)
    assert_equal(1, @amazon.fish_count)
  end

end
