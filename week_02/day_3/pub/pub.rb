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
   if customer.is_legal() && !customer.is_drunk()
     customer.wallet -= drink.price
     @till += drink.price
     customer.drunk_level += drink.alcohol_units
   end
 end

end
