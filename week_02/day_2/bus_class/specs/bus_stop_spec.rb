# Create a new class called BusStop. This should have a name attribute.
# Add an attribute to the BusStop called 'queue'.
# This should be an empty array that will get filled
# with instances of the Person class.

# Now imagine that our bus is travelling along the route.
# For now we will imagine that there is only
# one bus that goes on this route, so every passenger waiting at each stop wants
# to get on the bus.
#
# Try writing a method that the bus would call, to collect all of the passengers from a stop.
# This might look like bus.pick_up_from_stop(stop1).
# This should take all of the passengers waiting in line at the stop,
# and put them inside of the bus. So the stop will now have nobody in the queue,
# and the number of people on the bus will increase by however many people the stop had at it.

require ("minitest/autorun")
require ("minitest/rg")

require_relative("../bus_stop")
require_relative("../person")

class BusStopTest < MiniTest::Test

  def setup
    @john = Person.new("John", 30)
    @bus_stop1 = BusStop.new("Oxford Street")
  end

  def test_stop_name
    assert_equal("Oxford Street", @bus_stop1.name)
  end

  # Add a method that adds a person to the queue.
  def test_add_person
    @bus_stop1.add_person(@john)
    assert_equal(1, @bus_stop1.queue_count())
  end
end
