require ("minitest/autorun")
require ("minitest/rg")

require_relative ("../models/screening.rb")
require_relative ("../models/film.rb")

class CustomerTest < MiniTest::Test

  def setup
    @film1 = Film.new ({'title' => 'Godzilla', 'price' => 3.50})
    @film2 = Film.new ({'title' => 'The Shining', 'price' => 3.50})
  end

  def test_get_start_time
    @film1.save()
    @screening1 = Screening.new({'start_time' => '01-FEB-2018 12:30',
                                 'end_time' => '01-FEB-2018 14:00',
                                 'film_id' => @film1.id})
    assert_equal('01-FEB-2018 12:30', @screening1.start_time)
  end

  def test_get_end_time
    @film1.save()
    @screening1 = Screening.new({'start_time' => '01-FEB-2018 12:30',
                                 'end_time' => '01-FEB-2018 14:00',
                                 'film_id' => @film1.id})
    assert_equal('01-FEB-2018 14:00', @screening1.end_time)
  end

  def test_get_film
    @film1.save()
    @screening1 = Screening.new({'start_time' => '01-FEB-2018 12:30',
                                 'end_time' => '01-FEB-2018 14:00',
                                 'film_id' => @film1.id})
    assert_equal('Godzilla', @screening1.film().title)
  end

end
