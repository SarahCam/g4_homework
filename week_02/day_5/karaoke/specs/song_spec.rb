require ("minitest/autorun")
require ("minitest/rg")
require ("pry")

require_relative ("../song.rb")

class SongTest < MiniTest::Test

  def setup
    @song1 = Song.new("Mamma Mia", "ABBA")
    @song2 = Song.new("Take On Me", "A-HA")
  end

  def test_get_title
    assert_equal("Mamma Mia", @song1.title)
  end


end
