require("minitest/autorun")
require("minitest/rg")

require_relative("../river")
require_relative("../fish")


class RiverTest < MiniTest::Test

  def setup
    @amazon = River.new("Amazon")
    @trout = Fish.new("Trout")
    @salmon = Fish.new("Salmon")
  end

  def test_get_name
    assert_equal("Amazon", @amazon.name)
  end

  def test_get_fish_count__empty_river
    assert_equal(0, @amazon.fish_count())
  end

  def test_get_fish_count__one_fish_in_river
    @amazon.add_fish(@trout)
    assert_equal(1, @amazon.fish_count())
  end

  def test_add_fish__specific_fish
    @amazon.add_fish(@trout)
    assert_equal(1, @amazon.fish_count())
  end

  def test_lose_fish__specific_fish
    fish = Fish.new("Pie")
    @amazon.add_fish(fish)
    @amazon.lose_fish(fish)
    assert_equal(0, @amazon.fish_count())
  end

  def test_lose_fish__unidentified_fish
    fish = Fish.new("Pie")
    @amazon.add_fish(fish)
    @amazon.lose_fish_with_no_name()
    assert_equal(0, @amazon.fish_count())
  end

  def test_first_fish
    @amazon.add_fish(@trout)
    @amazon.add_fish(@salmon)
    assert_equal(@trout, @amazon.first_fish())
  end

end
