class Pub

 attr_reader :name, :till

 def initialize(name)
   @name = name
   @till = 0
   @drinks = []
 end

 def count_drinks()
   return @drinks.count()
 end

 def sell_drink(drink)
   @till += drink.price
 end
end
