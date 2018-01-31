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

  def test_eat_fish__bear_only_test
    fish = Fish.new("Lunch")
    @yogi.eat_fish(fish)
    assert_equal(1, @yogi.food_count)
  end

  def test_eat_fish__out_of_river__first_fish
    @amazon.add_fish(@trout)
    @amazon.add_fish(@salmon)
    fish = @amazon.first_fish()
    @yogi.eat_fish(fish)
    @amazon.lose_fish(fish)
    assert_equal(1, @yogi.food_count)
    assert_equal(1, @amazon.fish_count)
  end

  def test_eat_fish__out_of_river__any_fish
    @amazon.add_fish(@trout)
    @yogi.eat_fish(@amazon.lose_fish_with_no_name)
    assert_equal(1, @yogi.food_count)
    assert_equal(0, @amazon.fish_count)
  end

end
