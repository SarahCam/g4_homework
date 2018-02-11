require ("minitest/autorun")
require ("minitest/rg")

require_relative ("../models/screening.rb")
require_relative ("../models/film.rb")
require_relative ("../models/ticket.rb")
require_relative ("../models/customer.rb")

class ScreeningTest < MiniTest::Test

  def setup
    Customer.delete_all()
    Film.delete_all()
    Ticket.delete_all()
    Screening.delete_all()

    @godzilla = Film.new ({'title' => 'Godzilla', 'price' => 3.50})
    @godzilla.save()

    @mary = Customer.new ({'name' => 'Mary Page', 'funds' => 200})
    @john = Customer.new ({'name' => 'John Dodds', 'funds' => 60})
    @anna = Customer.new ({'name' => 'Anna Smith', 'funds' => 7})
    @mary.save()
    @john.save()
    @anna.save()

    @screening1 = Screening.new({'start_time' => '01-FEB-2018 12:30','end_time' => '01-FEB-2018 14:00',
                                 'film_id' => @godzilla.id, 'seats' => 10})

    @screening2 = Screening.new({'start_time' => '01-FEB-2018 17:30','end_time' => '01-FEB-2018 19:00',
                                 'film_id' => @godzilla.id, 'seats' => 10})
    @screening1.save()
    @screening2.save()

    @ticket1 = Ticket.new ({'customer_id' => @mary.id, 'film_id' => @godzilla.id,'screening_id' => @screening1.id})
    @ticket2 = Ticket.new ({'customer_id' => @john.id, 'film_id' => @godzilla.id,'screening_id' => @screening1.id})
    @ticket3 = Ticket.new ({'customer_id' => @anna.id, 'film_id' => @godzilla.id,'screening_id' => @screening2.id})
    @ticket1.save()
    @ticket1.charge_customer()
    @ticket2.save()
    @ticket2.charge_customer()
    @ticket3.save()
    @ticket3.charge_customer()
  end

  def test_get_start_time
    assert_equal('01-FEB-2018 12:30', @screening1.start_time)
  end

  def test_get_end_time
    assert_equal('01-FEB-2018 14:00', @screening1.end_time)
  end

  def test_get_film
    assert_equal('Godzilla', @screening1.film().title)
  end

  def test_get_seats
    assert_equal(10, @screening1.seats)
  end

  def test_reserve_seat
    @screening1.reserve_seat()
    assert_equal(9, @screening1.seats)
  end

end
