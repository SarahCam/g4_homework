require ("minitest/autorun")
require ("minitest/rg")
require ("pry")

require_relative ("../bar.rb")
require_relative ("../room.rb")

class BarTest < MiniTest::Test

  def setup
    @bar1 = Bar.new("HotShots")
    @room1 = Room.new("70's Disco", 20)
    @room2 = Room.new("80's Electric", 20)
    @room3 = Room.new("90's Indie", 20)
  end

  def test_get_bar_name
    assert_equal("HotShots", @bar1.name)
  end

  def test_add_room__1_room
    @bar1.add_room(@room1)
    assert_equal(1, @bar1.count_rooms())
  end

  def test_add_room__3_rooms
    @bar1.add_room(@room1)
    @bar1.add_room(@room2)
    @bar1.add_room(@room3)
    assert_equal(3, @bar1.count_rooms())
  end

end
