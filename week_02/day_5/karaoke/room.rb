require ("pry")

class Room

  attr_reader :name, :guests, :capacity, :waiting_list

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @guests = []
    @waiting_list = []
    @songs = []
  end

  def add_guest(guest)
    if !is_full()
      @guests << guest
    else
      @waiting_list << guest
    end
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

  def count_waiting_list()
    return @waiting_list.count()
  end

  def count_songs()
    return @songs.count()
  end

  def is_full()
    return count_guests >= @capacity
  end

end
