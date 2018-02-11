require ("minitest/autorun")
require ("minitest/rg")

require_relative ("../models/customer.rb")
require_relative ("../models/film.rb")
require_relative ("../models/ticket.rb")

class CustomerTest < MiniTest::Test

  def setup
    @customer1 = Customer.new ({'name' => 'John Smith', 'funds' => 20})
    @film1 = Film.new ({'title' => 'Godzilla', 'price' => 3.50})
  end

  def test_get_customer
    Customer.delete_all()
    Film.delete_all()
    Ticket.delete_all()
    @customer1.save()
    @film1.save()
    ticket1 = Ticket.new ({'customer_id' => @customer1.id, 'film_id' => @film1.id})
    ticket1.save()
    customer = ticket1.get_customer()
    assert_equal("John Smith", customer.name)
  end

  def test_get_film
    Customer.delete_all()
    Film.delete_all()
    Ticket.delete_all()
    @customer1.save()
    @film1.save()
    ticket1 = Ticket.new ({'customer_id' => @customer1.id, 'film_id' => @film1.id})
    ticket1.save()
    film = ticket1.get_film()
    assert_equal("Godzilla", film.title)
  end

end
