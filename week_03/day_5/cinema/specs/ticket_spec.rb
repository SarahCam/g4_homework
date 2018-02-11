require ("minitest/autorun")
require ("minitest/rg")

require_relative ("../models/customer.rb")
require_relative ("../models/film.rb")
require_relative ("../models/ticket.rb")
require_relative ("../models/screening.rb")

class TicketTest < MiniTest::Test

  def setup
    Ticket.delete_all()
    Screening.delete_all()
    Customer.delete_all()
    Film.delete_all()

    @customer1 = Customer.new ({'name' => 'John Smith', 'funds' => 20})
    @film1 = Film.new ({'title' => 'Godzilla', 'price' => 3.50})
    @customer1.save()
    @film1.save()

    @screening1 = Screening.new ({'start_time' => '01-FEB-2018 14:30', 'end_time' => '01-FEB-2018 16:00',
                                  'film_id' => @film1.id, 'max_seats' => 10})
    @screening1.save()

    @ticket1 = Ticket.new ({'customer_id' => @customer1.id, 'film_id' => @film1.id, 'screening_id' => @screening1.id})
    @ticket1.save()
  end

  def test_get_customer
    customer = @ticket1.get_customer()
    assert_equal("John Smith", customer.name)
  end

  def test_get_film
    film = @ticket1.get_film()
    assert_equal("Godzilla", film.title)
  end

end
