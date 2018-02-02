require ("pry")

class Room

  attr_reader :name, :guests, :capacity

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @guests = []
    @songs = []
  end

  def add_guest(guest)
    @guests << guest
  end

  def remove_guest(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @songs << song
  end

  def count_guests()
    return @guests.count()
  end

  def count_songs()
    return @songs.count()
  end

  def is_full()
    return count_guests >= @capacity
  end

end
