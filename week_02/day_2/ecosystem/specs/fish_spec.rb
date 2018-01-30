require("minitest/autorun")
require("minitest/rg")

require_relative("../fish")

class FishTest < MiniTest::Test

  def setup
    @salmon = Fish.new("Salmon")
  end

  def test_get_name
    assert_equal("Salmon", @salmon.name)
  end

end
