require 'minitest/autorun'
require 'minitest/rg'
require_relative '../classes_lab'

# TESTS FOR STUDENT CLASS

class TestStudent < Minitest::Test

  def setup
    @this_student = Student.new('Sarah', 4)
  end

  def test_get_name()
    assert_equal("Sarah", @this_student.name())
  end

  def test_get_cohort()
    assert_equal(4, @this_student.cohort())
  end

  def test_set_name()
    @this_student.name = "Steve"
    assert_equal("Steve", @this_student.name())
  end

  def test_set_cohort()
    @this_student.cohort = 3
    assert_equal(3, @this_student.cohort())
  end

  def test_talk()
    assert_equal("I can talk!", @this_student.talk())
  end

  def test_say_favourite_language()
    assert_equal("I love Ruby", @this_student.say_favourite_language("Ruby"))
  end

end

# TESTS FOR TEAM CLASS

class TestTeam < Minitest::Test

  def setup
    @this_team = Team.new("Pixies", ["Bob", "Fred", "Alice"], "Mildred", 0)
  end

  def test_get_name()
    assert_equal("Pixies", @this_team.name())
  end

  def test_get_players()
    assert_equal(["Bob", "Fred", "Alice"], @this_team.players())
  end

  def test_get_coach()
    assert_equal("Mildred", @this_team.coach())
  end

  def test_set_coach()
    @this_team.coach = "Peter"
    assert_equal("Peter", @this_team.coach())
  end

  def test_add_player()
    @this_team.add_player("Morven")
    assert_equal(["Bob", "Fred", "Alice", "Morven"], @this_team.players())  # OR:
    assert_equal(4, @this_team.players.count())
  end

  def test_is_player?()
    assert_equal(true, @this_team.is_player?("Fred"))
  end

  def test_is_player?()
    assert_equal(false, @this_team.is_player?("Bill"))
  end

  def test_get_points()
    assert_equal(0, @this_team.points())
  end

  def test_get_points()
    assert_equal(1, @this_team.get_points("win"))
  end

  def test_win()
    @this_team.get_points("win")
    assert_equal(1, @this_team.points)
  end

  def test_lose()
    @this_team.get_points("lose")
    assert_equal(0, @this_team.points)
  end

end

# TESTS FOR LIBRARY CLASS

class TestLibrary < Minitest::Test

  def setup

    @books =
    [
      {
        title: "lord_of_the_rings",
        rental_details: {
          student_name: "Jeff",
          date: "01/12/16"
        }
      },
      {
        title: "the_wasp_factory",
        rental_details: {
          student_name: "Alice",
          date: "20/11/16"
        }
      }
    ]

    @this_library = Library.new(@books)

  end

  def test_get_books()
    this_library=Library.new([])
    assert_equal([], this_library.books())
  end

  def test_get_books()
    expected = [{
      title: "lord_of_the_rings",
      rental_details: {
        student_name: "Jeff",
        date: "01/12/16"
      }
    },
    {
      title: "the_wasp_factory",
      rental_details: {
        student_name: "Alice",
        date: "20/11/16"
      }
    }]
    assert_equal(expected, @this_library.books())
  end

#option 1
  def test_get_book()
    book = {
      title: "lord_of_the_rings",
      rental_details: {
        student_name: "Jeff",
        date: "01/12/16"
      }
    }
    book_info = @this_library.get_book("lord_of_the_rings")
    assert_equal(book, book_info)
  end

#test for not in library - extra test
  def test_get_book()
    assert_nil(@this_library.get_book("not_in_library"))
  end

  def test_get_book_rental_details()
    book_rental_details = @this_library.get_book_rental_details("lord_of_the_rings")
    # expected = @books[0][:rental_details]      # OR DO:
    expected = {
      student_name: "Jeff",
      date: "01/12/16"
    }
    assert_equal(expected, book_rental_details)
  end

#option 1
  def test_add_new_book()
    new_book = {
      title: "the_loney",
      rental_details: {
        student_name: "",
        date: ""
      }
    }
    @this_library.add_new_book(new_book)
    result = @this_library.get_book("the_loney")
    assert_equal("the_loney", result[:title])
    assert_equal("", result[:rental_details][:student_name])
    assert_equal("", result[:rental_details][:date])
    # assert_equal(3, @this_library.books.count)
  end

  def test_change_rental_details()
    @this_library.change_rental_details("lord_of_the_rings", "Sonja", "31/12/2018")
    rental_details = @this_library.get_book_rental_details("lord_of_the_rings")
    assert_equal("Sonja", rental_details[:student_name])
    assert_equal("31/12/2018", rental_details[:date])

    # assert_equal("Sonja", @this_library.get_student_name("lord_of_the_rings"))
    # assert_equal("31/12/2018", @this_library.get_date("lord_of_the_rings"))
  end

end
