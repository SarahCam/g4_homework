require ("minitest/autorun")
require ("minitest/rg")

require_relative ("../customer")
require_relative ("../drink")
require_relative ("../pub")

class CustomerTest < MiniTest::Test

  def setup
    @customer = Customer.new("Joe", 20, 30)
    @drink = Drink.new("Wine", 5, 2)
    @pub = Pub.new("Red Lion")
  end

  def test_get_name
    assert_equal("Joe", @customer.name)
  end

  def test_get_wallet
    assert_equal(20, @customer.wallet)
  end

  def test_get_age
    assert_equal(30, @customer.age)
  end

  def test_get_drunk_level
    @pub.sell_drink(@drink, @customer)
    assert_equal(2, @customer.drunk_level)
  end

end
