class Customer

  attr_reader :name, :wallet, :age, :drunk_level

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunk_level = 0
  end

  def buy_drink(drink)
   @wallet -= drink.price
   @drunk_level += drink.alcohol_units
  end

  def is_legal
    return @age >= 18
  end

end
