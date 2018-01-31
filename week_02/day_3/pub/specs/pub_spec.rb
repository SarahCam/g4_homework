require("minitest/autorun")
require("minitest/rg")

require_relative("../pub")
require_relative("../drink")

class PubTest < MiniTest::Test
  def setup
    @pub = Pub.new("The Clockwork")
    @drink = Drink.new("Wine", 5)
  end


  def test_get_name
    assert_equal("The Clockwork", @pub.name)
  end

  def test_get_till
    assert_equal(0, @pub.till)
  end

  def test_get_drinks__emptydrinks
    assert_equal(0, @pub.count_drinks)
  end

  def test_sell_drink
    @pub.sell_drink(@drink)
    assert_equal(5, @pub.till)

  end


end
