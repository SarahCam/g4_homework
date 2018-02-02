require ("minitest/autorun")
require ("minitest/rg")
require ("pry")

require_relative ("../room.rb")
require_relative ("../guest.rb")

class RoomTest < MiniTest::Test

  def setup
    @room1 = Room.new("90's Revival")
  end

  def test_get_name
    assert_equal("90's Revival", @room1.name)
  end

end
