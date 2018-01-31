class Customer

  attr_accessor :name, :wallet, :age, :drunk_level

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunk_level = 0
    @max_level = 10
    @legal_age = 18
  end

  def is_legal()
    return @age >= @legal_age
  end

  def is_drunk()
    return @drunk_level >= @max_level
  end

end
