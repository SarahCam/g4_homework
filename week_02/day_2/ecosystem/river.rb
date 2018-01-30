class River

  attr_accessor :name

  def initialize(name)
    @name = name
    @fish = []
  end

  def fish_count()
    return @fish.count()
  end

  def add_fish(fish)
    @fish << fish
  end

  def first_fish()
    return @fish[0]
  end

  def lose_fish(fish)
    @fish.delete(fish)
  end

end
