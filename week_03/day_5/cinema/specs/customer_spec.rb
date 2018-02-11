require ("minitest/autorun")
require ("minitest/rg")

require_relative ("../models/customer.rb")
require_relative ("../models/film.rb")
require_relative ("../models/ticket.rb")

class CustomerTest < MiniTest::Test

  def setup
    @customer1 = Customer.new ({'name' => 'John Smith', 'funds' => 20})
    @film1 = Film.new ({'title' => 'Godzilla', 'price' => 3.50})
    @film2 = Film.new ({'title' => 'The Shining', 'price' => 3.50})
  end

  def test_films__customer_has_2_tickets
    Customer.delete_all()
    Film.delete_all()
    Ticket.delete_all()
    @customer1.save()
    @film1.save()
    @film2.save()
    ticket1 = Ticket.new ({'customer_id' => @customer1.id, 'film_id' => @film1.id})
    ticket2 = Ticket.new ({'customer_id' => @customer1.id, 'film_id' => @film2.id})
    ticket1.save()
    ticket2.save()
    assert_equal(2, @customer1.films().count)
  end

  def test_decrease_funds__4
    @customer1.decrease_funds(4)
    assert_equal(16, @customer1.funds)
  end

  def test_get_customer__John_Smith
    assert_equal(@customer1.name, Customer.get_customer("John Smith").name)
  end

end
