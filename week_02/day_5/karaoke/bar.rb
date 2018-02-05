require ("pry")

require_relative("./guest.rb")

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

  def check_in(guest)
    return guest.can_pay(@entry_fee) ? true : false
  end

end
