require ("minitest/autorun")
require ("minitest/rg")

require_relative ("../models/customer.rb")
require_relative ("../models/film.rb")
require_relative ("../models/ticket.rb")
require_relative ("../models/screening.rb")

class FilmTest < MiniTest::Test

  def setup
    Ticket.delete_all()
    Screening.delete_all()
    Customer.delete_all()
    Film.delete_all()

    @customer1 = Customer.new ({'name' => 'John Smith', 'funds' => 20})
    @customer2 = Customer.new ({'name' => 'Sam Price', 'funds' => 20})
    @film1 = Film.new ({'title' => 'Godzilla', 'price' => 3.50})
    @film2 = Film.new ({'title' => 'The Shining', 'price' => 3.50})
    @customer1.save()
    @customer2.save()
    @film1.save()
    @film2.save()

    @screening1 = Screening.new ({'start_time' => '01-FEB-2018 14:30', 'end_time' => '01-FEB-2018 16:00', 'film_id' => @film1.id, 'max_seats' => 10})
    @screening2 = Screening.new ({'start_time' => '01-FEB-2018 16:30', 'end_time' => '01-FEB-2018 18:00', 'film_id' => @film1.id, 'max_seats' => 10})
    @screening1.save()
    @screening2.save()

    @ticket1 = Ticket.new ({'customer_id' => @customer1.id, 'film_id' => @film1.id, 'screening_id' => @screening1.id})
    @ticket2 = Ticket.new ({'customer_id' => @customer2.id, 'film_id' => @film1.id, 'screening_id' => @screening2.id})
    @ticket3 = Ticket.new ({'customer_id' => @customer1.id, 'film_id' => @film1.id, 'screening_id' => @screening2.id})
    @ticket1.save()
    @ticket2.save()
    @ticket3.save()
  end

  def test_get_customers___for_given_film
    assert_equal(3, @film1.customers().count)
  end

  def test_get_tickets___for_given_film
    assert_equal(3, @film1.tickets().count)
  end

  def test_get_popular_time___for_given_film
    assert_equal('01-FEB-2018 16:30', @film1.popular_time())
  end

end
