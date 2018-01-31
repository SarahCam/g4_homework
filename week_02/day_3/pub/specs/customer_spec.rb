require ("minitest/autorun")
require ("minitest/rg")

require_relative ("../customer")
require_relative ("../drink")

class CustomerTest < MiniTest::Test

  def setup
    @customer = Customer.new("Joe", 20)
    @drink = Drink.new("Wine", 5)

  end

  def test_get_name
    assert_equal("Joe", @customer.name)

  end

  def test_get_wallet
    assert_equal(20, @customer.wallet)

  end

  def test_buy_drink
    @customer.buy_drink(@drink)
    assert_equal(15, @customer.wallet)

  end

end
