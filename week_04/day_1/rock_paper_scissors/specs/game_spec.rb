require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/game'

class TestGame < Minitest::Test

  def setup
    @game1 = Game.new("rock", "scissors")
    @game2 = Game.new("paper", "rock")
    @game3 = Game.new("scissors", "paper")

    @game4 = Game.new("scissors", "rock")
    @game5 = Game.new("rock", "paper")
    @game6 = Game.new("paper", "scissors")

    @game7 = Game.new("scissors", "scissors")
    @game8 = Game.new("rock", "rock")
    @game9 = Game.new("paper", "paper")
  end

  def test_result___rock_scissors
    assert_equal("rock", @game1.result())
  end

  def test_result___paper_rock
    assert_equal("paper", @game2.result())
  end

  def test_result___scissors_paper
    assert_equal("scissors", @game3.result())
  end

  def test_result___scissors_rock
    assert_equal("rock", @game4.result())
  end

  def test_result___rock_paper
    assert_equal("paper", @game5.result())
  end

  def test_result___paper_scissors
    assert_equal("scissors", @game6.result())
  end

  def test_result___scissors_scissors
    assert_equal("tie", @game7.result())
  end

  def test_result___rock_rock
    assert_equal("tie", @game8.result())
  end

  def test_result___paper_paper
    assert_equal("tie", @game9.result())
  end

end
