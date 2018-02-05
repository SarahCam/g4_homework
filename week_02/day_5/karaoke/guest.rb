require ("pry")

class Guest

  attr_reader :name, :money

  def initialize(name, money)
    @name = name
    @money = money
  end

  def can_pay(entry_fee)
    return @money >= entry_fee
  end

end
