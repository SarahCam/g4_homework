class Bear

  attr_accessor :name

  def initialize(name)
    @name = name
    @stomach = []
  end

  def food_count()
    return @stomach.count()
  end

  def eat_fish(fish)
    @stomach << fish
  end

end
