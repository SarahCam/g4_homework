require ("minitest/autorun")
require ("minitest/rg")
require ("pry")

require_relative ("../bar.rb")
require_relative ("../room.rb")
require_relative ("../guest.rb")


class BarTest < MiniTest::Test

  def setup
    @bar1 = Bar.new("HotShots", 10)
    @room1 = Room.new("70's Disco", 20)
    @room2 = Room.new("80's Electric", 20)
    @room3 = Room.new("90's Indie", 20)
    @guest1 = Guest.new("Frank Spencer", 5)
    @guest2 = Guest.new("Donald Trump", 1000)
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

  def test_get_entry_fee
    assert_equal(10, @bar1.entry_fee)
  end

  # def test_has_money__YES
  #   assert(true, @bar1.has_money(@guest2))
  # end

  # def test_guest_can_pay__NO
  #   assert(false, @bar1.has_money(@guest1))
  # end

end
