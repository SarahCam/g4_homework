class River

  attr_accessor :name

  def initialize(name)
    @name = name
    @fishes = []
  end

  def fish_count()
    return @fishes.count()
  end

  def add_fish(fish)
    @fishes << fish
  end

  def first_fish()
    return @fishes[0]
  end

  def lose_fish(fish)
    @fishes.delete(fish)
  end

end
