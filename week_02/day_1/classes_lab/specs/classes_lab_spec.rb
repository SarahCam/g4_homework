require 'minitest/autorun'
require 'minitest/rg'
require_relative '../classes_lab'

# TESTS FOR STUDENT CLASS

class TestStudent < Minitest::Test

  def test_get_name()
    this_student = Student.new('Sarah', 4)
    assert_equal("Sarah", this_student.name())
  end

  def test_get_cohort()
    this_student = Student.new('Sarah', 4)
    assert_equal(4, this_student.cohort())
  end

  def test_set_name()
    this_student = Student.new('Sarah', 4)
    this_student.name = "Steve"
    assert_equal("Steve", this_student.name())
  end

  def test_set_cohort()
    this_student = Student.new('Sarah', 4)
    this_student.cohort = 3
    assert_equal(3, this_student.cohort())
  end

  def test_talk()
    this_student = Student.new('Sarah', 4)
    assert_equal("I can talk!", this_student.talk())
  end

  def test_say_favourite_language()
    this_student = Student.new('Sarah', 4)
    assert_equal("I love Ruby", this_student.say_favourite_language("Ruby"))
  end

end

# TESTS FOR TEAM CLASS

class TestTeam < Minitest::Test

  def test_get_name()
    this_team = Team.new("Pixies", ["Bob", "Fred", "Alice"], "Mildred", 0)
    assert_equal("Pixies", this_team.name())
  end

  def test_get_players()
    this_team = Team.new("Pixies", ["Bob", "Fred", "Alice"], "Mildred", 0)
    assert_equal(["Bob", "Fred", "Alice"], this_team.players())
  end

  def test_get_coach()
    this_team = Team.new("Pixies", ["Bob", "Fred", "Alice"], "Mildred", 0)
    assert_equal("Mildred", this_team.coach())
  end

  def test_set_coach()
    this_team = Team.new("Pixies", ["Bob", "Fred", "Alice"], "Mildred", 0)
    this_team.coach = "Peter"
    assert_equal("Peter", this_team.coach())
  end

  def test_add_player()
    this_team = Team.new("Pixies", ["Bob", "Fred", "Alice"], "Mildred", 0)
    this_team.add_player("Morven")
    assert_equal(["Bob", "Fred", "Alice", "Morven"], this_team.players())
  end

  def test_is_player?()
    this_team = Team.new("Pixies", ["Bob", "Fred", "Alice"], "Mildred", 0)
    assert_equal(true, this_team.is_player?("Fred"))
  end

  def test_is_player?()
    this_team = Team.new("Pixies", ["Bob", "Fred", "Alice"], "Mildred", 0)
    assert_equal(false, this_team.is_player?("Bill"))
  end

  def test_get_points()
    this_team = Team.new("Pixies", ["Bob", "Fred", "Alice"], "Mildred", 0)
    assert_equal(1, this_team.get_points("win"))
  end

end

# TESTS FOR LIBRARY CLASS

class TestLibrary < Minitest::Test

  def setup

    @test_books = [
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

  end

  def test_get_books()
    this_library=Library.new([])
    assert_equal([], this_library.books())
  end

  def test_get_books()
    this_library=Library.new(@test_books)
    assert_equal(@test_books, this_library.books())
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
    this_library = Library.new([book])
    book_info = this_library.get_book("lord_of_the_rings")
    assert_equal(book, book_info)
  end

#option 2
  def test_get_book()
    this_library = Library.new(@test_books)
    book_info = this_library.get_book("lord_of_the_rings")
    assert_equal(@test_books[0], book_info)
  end

#option 3
  def test_get_book()
    this_library = Library.new(@test_books)
    assert_equal(@test_books[1], this_library.get_book("the_wasp_factory"))
  end

#test for not in library - extra test
  def test_get_book()
    this_library = Library.new(@test_books)
    assert_nil(this_library.get_book("not_in_library"))
  end

  def test_get_book_rental_details()
    this_library = Library.new(@test_books)
    book_rental_details = this_library.get_book_rental_details("lord_of_the_rings")
    assert_equal(@test_books[0][:rental_details], book_rental_details)
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
    this_library = Library.new([])
    this_library.add_new_book(new_book)
    assert_equal(1, this_library.books.count)
  end

  def test_change_rental_details()
    book = {
      title: "the_loney",
      rental_details: {
        student_name: "Mark",
        date: "20/12/2018"
      }
    }
    this_library = Library.new([book])
    this_library.change_rental_details("the_loney", "Sonja", "31/12/2018")
    assert_equal("Sonja", this_library.get_student_name("the_loney"))
    assert_equal("31/12/2018", this_library.get_date("the_loney"))
  end

end
