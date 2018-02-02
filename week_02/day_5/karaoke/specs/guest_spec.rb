require ("minitest/autorun")
require ("minitest/rg")
require ("pry")

require_relative ("../guest.rb")

class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Mark Smith")
  end

  def test_get_name
    assert_equal("Mark Smith", @guest1.name)
  end

end
