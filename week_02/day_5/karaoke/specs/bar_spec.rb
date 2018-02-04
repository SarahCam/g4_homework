require ("minitest/autorun")
require ("minitest/rg")
require ("pry")

require_relative ("../bar.rb")

class BarTest < MiniTest::Test

  def setup
    @bar = Bar.new("HotShots")
  end

  def test_get_bar_name
    assert_equal("HotShots", @bar.name)
  end

end
