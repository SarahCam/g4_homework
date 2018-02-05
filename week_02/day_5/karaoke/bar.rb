require ("pry")

class Bar

  attr_reader :name

  def initialize(name)
    @name = name
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def count_rooms
    return @rooms.count()
  end

end
