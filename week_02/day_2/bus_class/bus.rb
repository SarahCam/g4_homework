class Bus
  attr_reader :route_number, :destination, :passengers

  def initialize (route_number, destination)
    @route_number = route_number
    @destination = destination
    @passengers = []
  end

  def drive
    return "Brum brum"
  end

  def number_passengers
    return @passengers.count()
  end

  def pick_up (passenger)
    @passengers << passenger
  end

  def drop_off (passenger)
    @passengers.delete(passenger)
  end

  def empty
    @passengers.clear()
  end

  def pick_up_from_stop(stop)
    for person in stop.get_queue_copy()
      @passengers << person
    end
    stop.clear_queue()
  end

end
