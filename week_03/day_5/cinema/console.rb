require('pry')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

# DELETE  --  DATA FROM TABLES

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

# CREATE  --  DATA IN TABLES

customer1 = Customer.new ({'name' => 'Veronica Page', 'funds' => 3.50})
customer2 = Customer.new ({'name' => 'Albert Dodds', 'funds' => 6})
customer3 = Customer.new ({'name' => 'Sally Smith', 'funds' => 7})
customer4 = Customer.new ({'name' => 'Peter Croft', 'funds' => 12.70})
customer5 = Customer.new ({'name' => 'Amy Haversham', 'funds' => 20})
customer6 = Customer.new ({'name' => 'John MacDonald', 'funds' => 100})

film1 = Film.new ({'title' => 'Godzilla', 'price' => 3.50})
film2 = Film.new ({'title' => 'The Shining', 'price' => 3.50})
film3 = Film.new ({'title' => 'Electric Dreams', 'price' => 3.50})
film4 = Film.new ({'title' => 'Paddington', 'price' => 7})
film5 = Film.new ({'title' => 'Insideous', 'price' => 7})
film6 = Film.new ({'title' => 'The Girl on the Train', 'price' => 7})

customer1.save()
customer2.save()
customer3.save()
customer4.save()
customer5.save()
customer6.save()

film1.save()
film2.save()
film3.save()
film4.save()
film5.save()
film6.save()

ticket1 = Ticket.new ({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket2 = Ticket.new ({'customer_id' => customer2.id, 'film_id' => film1.id})
ticket3 = Ticket.new ({'customer_id' => customer3.id, 'film_id' => film4.id})
ticket4 = Ticket.new ({'customer_id' => customer4.id, 'film_id' => film4.id})
ticket5 = Ticket.new ({'customer_id' => customer4.id, 'film_id' => film1.id})

ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()

# READ    --  DATA FROM TABLES

all_customers = Customer.all()
all_films = Film.all()
all_tickets = Ticket.all()

# UPDATE  --  DATA IN TABLES

customer1.name = 'Mary Williams'
customer1.update()

film5.title = 'Insidious'
film5.update()

binding.pry
nil
