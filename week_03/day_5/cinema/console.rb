require('pry')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')
require_relative('models/screening')

# DELETE  --  DATA FROM TABLES
Ticket.delete_all()
Screening.delete_all()
Customer.delete_all()
Film.delete_all()

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

# UPDATE  --  DATA IN TABLES
customer1.name = 'Mary Williams'
customer1.update()

film5.title = 'Insidious'
film5.update()

# ADD SOME screenings
screening1 = Screening.new ({'start_time' => '01-FEB-2018 14:30', 'end_time' => '01-FEB-2018 16:00', 'film_id' => film1.id})
screening1.save()

# PURCHASE SOME TICKETS
ticket1 = Ticket.new ({'customer_id' => customer1.id, 'film_id' => film1.id, 'screening_id' => screening1.id})
ticket2 = Ticket.new ({'customer_id' => customer2.id, 'film_id' => film1.id, 'screening_id' => screening1.id})
ticket3 = Ticket.new ({'customer_id' => customer3.id, 'film_id' => film4.id, 'screening_id' => screening1.id})
ticket4 = Ticket.new ({'customer_id' => customer4.id, 'film_id' => film4.id, 'screening_id' => screening1.id})
ticket5 = Ticket.new ({'customer_id' => customer4.id, 'film_id' => film1.id, 'screening_id' => screening1.id})

ticket1.save()
ticket1.charge_customer()

ticket2.save()
ticket2.charge_customer()

ticket3.save()
ticket3.charge_customer()

ticket4.save()
ticket4.charge_customer()

ticket5.save()
ticket5.charge_customer()

# READ    --  DATA FROM TABLES
all_customers = Customer.all()
all_films = Film.all()
all_tickets = Ticket.all()

# GET CUSTOMER - NUMBER OF TICKETS BOUGHT TO-DATE
mary = Customer.get_customer("Mary Williams")
mary_tickets = mary.count_tickets()
peter = Customer.get_customer("Peter Croft")
peter_tickets = peter.count_tickets()

# GET FILM - NUMBER OF CUSTOMERS WHO'VE BOUGHT TICKETS TO THAT FILM TO-DATE
godzilla = Film.get_film("Godzilla")
godzilla_customers = godzilla.count_customers()

# FETCH ALL FILMS FOR GIVEN CUSTOMER
cust4_films = customer4.films()

# FETCH ALL CUSTOMERS FOR GIVEN FILM
film1_custs = film1.customers()

binding.pry
nil
