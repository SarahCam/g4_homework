require("minitest/autorun")
require("minitest/rg")

require_relative("../pub")
require_relative("../drink")
require_relative("../customer")

class PubTest < MiniTest::Test
  def setup
    @pub = Pub.new("The Clockwork")
    @drink = Drink.new("Wine", 5, 2)
    @customer1 = Customer.new("Jack", 10, 20)
    @customer2 = Customer.new("Victor", 30, 15)
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

  def test_sell_drink__over_18
    @pub.sell_drink(@drink, @customer1)
    assert_equal(5, @pub.till)
  end

  def test_sell_drink__under_18
    @pub.sell_drink(@drink, @customer2)
    assert_equal(0, @pub.till)
  end

  def test_check_age__over_18
    assert_equal(true, @customer1.is_legal)
  end

  def test_check_age__under_18
    assert_equal(false, @customer2.is_legal)
  end

  def test_sell_and_buy_drink__over_18
    @pub.sell_drink(@drink, @customer1)
    @customer1.buy_drink(@drink)
    assert_equal(5, @pub.till)
    assert_equal(5, @customer1.wallet)
  end

  def test_sell_and_buy_drink__under_18
    @pub.sell_drink(@drink, @customer2)
    @customer1.buy_drink(@drink)
    assert_equal(0, @pub.till)
    assert_equal(30, @customer2.wallet)
  end

  def test_refuse_service__after_2_units_alcohol
    @pub.sell_drink(@drink, @customer1)
    @customer1.buy_drink(@drink)
    @pub.sell_drink(@drink, @customer1)
    @customer1.buy_drink(@drink)
    assert_equal(5, @pub.till)
    assert_equal(5, @customer1.wallet)
  end

end
