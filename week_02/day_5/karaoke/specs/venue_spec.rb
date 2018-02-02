require ("minitest/autorun")
require ("minitest/rg")
require ("pry")

require_relative ("../venue.rb")

class VenueTest < MiniTest::Test

  def setup
    @venue = Venue.new("HotShots")
  end

  def test_get_venue_name
    assert_equal("HotShots", @venue.name)
  end

end
