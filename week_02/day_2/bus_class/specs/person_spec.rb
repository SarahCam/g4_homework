# Create a Person class.
# The Person class should have attributes of a name and age.

require ("minitest/autorun")
require ("minitest/rg")

require_relative ("../person")

class PersonTest < MiniTest::Test

  def setup
    @john = Person.new("John", 30)
    @mary = Person.new("Mary", 24)
  end

  def test_get_name
    assert_equal("John", @john.name)
  end

  def test_get_age
    assert_equal(30, @john.age)
  end

end
