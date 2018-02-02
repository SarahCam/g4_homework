require ("pry")

class Room

  attr_reader :name, :guests

  def initialize(name)
    @name = name
    @guests = []
    @songs = []
  end

  def add_guest(guest)
    @guests << guest
  end

  def remove_guest(guest)
    @guests.delete(guest)
  end

  def count_guests()
    return @guests.count()
  end

end
