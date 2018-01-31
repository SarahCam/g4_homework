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

 def sell_drink(drink, customer)
   if customer.is_legal
     @till += drink.price
   end
 end
end
