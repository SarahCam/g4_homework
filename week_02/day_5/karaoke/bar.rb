require ("pry")

class Bar

  attr_reader :name, :entry_fee

  def initialize(name, entry_fee)
    @name = name
    @rooms = []
    @entry_fee = entry_fee
  end

  def add_room(room)
    @rooms << room
  end

  def count_rooms
    return @rooms.count()
  end

end
