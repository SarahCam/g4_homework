class Customer

  attr_reader :name, :wallet, :age, :drunk_level

  def initialize(name, wallet, age, drunk_level)
    @name = name
    @wallet = wallet
    @age = age
    @drunk_level = drunk_level
  end

  def buy_drink(drink)
   @wallet -= drink.price
  end

  def is_legal
    return @age >= 18
  end

  def drunk_level
    @drunk_level += 1
  end

end
