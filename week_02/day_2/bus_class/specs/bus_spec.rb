# PART A
# Create a Bus class.
# The Bus should have a route number (e.g. 22) and a destination
# (e.g. "Ocean Terminal").
# The Bus should have a drive method that returns a string
# (e.g. "Brum brum").

# PART B
# Give the Bus class a new property, 'passengers'. This should be an array,
# which starts off empty.



require ("minitest/autorun")
require ("minitest/rg")


require_relative("../bus")
require_relative("../person")
require_relative("../bus_stop")


class BusTest < MiniTest::Test

  def setup
    @person = Person.new("Joe", 22)
    @bus1 = Bus.new(13, "Paddington")
    @bus2 = Bus.new(11, "Trafalgar Square")
    @stop = BusStop.new("Cowcaddens")
  end

  def test_get_route_number
    assert_equal(13, @bus1.route_number)
  end

  def test_get_destination
    assert_equal("Paddington", @bus1.destination)
  end

  def test_drive
    assert_equal("Brum brum", @bus1.drive)
  end

  def test_gets_passengers
    assert_equal([], @bus1.passengers)
  end

  # Add a method to the Bus class which returns how many passengers are on the bus.
  def test_get_number_passengers
    assert_equal(0, @bus1.number_passengers())
  end

  # Add a method to the Bus class which takes in a Person and adds it to the array
  # of passengers.
  # The method could look something like bus.pick_up(passenger1)
  def test_pick_up
    @bus1.pick_up(@person)
    assert_equal(1, @bus1.number_passengers())
  end

  # Add a method that drops off a passenger and removes them from the array.
  # This could look like bus.drop_off(passenger2)
  def test_drop_off
    @bus1.pick_up(@person)
    assert_equal(1, @bus1.number_passengers())
    @bus1.drop_off(@person)
    assert_equal(0, @bus1.number_passengers())
  end

  # Add an 'empty' method to remove all of the passengers -
  # this might be used when the bus reaches its destination, or if the bus breaks down.
  # It should remove all of the passengers from the array.
  def test_empty
    @bus1.pick_up(@person)
    assert_equal(1, @bus1.number_passengers())
    @bus1.empty
    assert_equal(0, @bus1.number_passengers())
  end

  def test_can_get_from_stop
    @stop.add_person(@person)
    @stop.add_person(@person)
    @bus1.pick_up_from_stop(@stop)
    assert_equal(2, @bus1.number_passengers())
    assert_equal(0, @stop.queue_count())
  end

end
