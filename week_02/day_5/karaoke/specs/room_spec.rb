require ("minitest/autorun")
require ("minitest/rg")
require ("pry")

require_relative ("../room.rb")
require_relative ("../guest.rb")

class RoomTest < MiniTest::Test

  def setup
    @room1 = Room.new("90's Revival")
    @guest1 = Guest.new("Suzy Jones")
    @guest2 = Guest.new("Bill Smith")
  end

  def test_get_name
    assert_equal("90's Revival", @room1.name)
  end

  def test_add_guest__1_guest
    @room1.add_guest(@guest1)
    assert_equal(1, @room1.count_guests)
  end

  def test_add_guest__2_guests
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    assert_equal(2, @room1.count_guests)
  end

  def test_remove_guest__guest1
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.remove_guest(@guest1)
    assert_equal(1, @room1.count_guests)
  end

  def test_add_song__1_song
    @room1.add_song(@song1)
    assert_equal(1, @room1.count_songs)
  end

  def test_add_song__2_songs
    @room1.add_song(@song1)
    @room1.add_song(@song2)
    assert_equal(2, @room1.count_songs)
  end

end
