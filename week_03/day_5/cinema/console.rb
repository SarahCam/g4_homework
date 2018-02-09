require('pry')
require_relative('models/customer')

# DELETE  --  DATA FROM TABLES

# CREATE  --  DATA IN TABLES

customer1 = Customer.new ({'name' => 'Veronica Page', 'funds' => 40})
customer2 = Customer.new ({'name' => 'Albert Dodds', 'funds' => 20})
customer3 = Customer.new ({'name' => 'Sally Smith', 'funds' => 30.50})
customer4 = Customer.new ({'name' => 'Peter Croft', 'funds' => 10})
customer5 = Customer.new ({'name' => 'Amy Haversham', 'funds' => 100})
customer6 = Customer.new ({'name' => 'John MacDonald', 'funds' => 70.30})

# READ    --  DATA FROM TABLES
# UPDATE  --  DATA IN TABLES

binding.pry
nil
