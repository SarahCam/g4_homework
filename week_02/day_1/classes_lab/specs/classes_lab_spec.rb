require 'minitest/autorun'
require 'minitest/rg'
require_relative '../classes_lab'

# For this part we want you to make a class that represents a CodeClan student.
#
# Create a Class called Student that takes in a name (String) and a cohort (integer)
# when an new instance is created.
# Create a couple of Getter methods, one that returns the name property and one that returns
# the cohort property of the student.
# Add in Setter methods to update the students name and what cohort they are in.
# Create a method that gets the student to talk (eg. Returns "I can talk!).
# Create a method that takes in a students favourite programming language and returns it as
# part of a string (eg. student1.say_favourite_language("Ruby") -> "I love Ruby").

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

# Now we would like you to make a class that represents a sports team.
#
# Make a class to represent a Team that has the properties Team name (String),
# Players (Array of strings) and a Coach (String).
# For each property in the class make a Getter method than can return them.
# Create a setter method to allow the coach's name to be updated.
# Refactor the class to use attr_reader or attr_accessor instead of your own getter and setter methods.
# Create a method that adds a new player to the player's array.
# Add a method that takes in a string of a player's name and checks to see if they are in the
# players array.
# Add a points property into your class that starts at 0.
# Create a method that takes in whether the team has won or lost and updates the points property
# for a win.

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

# Model a Library as a class.
#
# Create a class for a Library that has an array of books. Each book should be a hash with a title,
# which is a string, and rental details, which is another hash with a student name and due date.
# This should look something like:
#
#   {
#     title: "lord_of_the_rings",
#     rental_details: {
#      student_name: "Jeff",
#      date: "01/12/16"
#     }
#   }
# Create a getter for the books
# Create a method that takes in a book title and returns all of the information about that book.
# Create a method that takes in a book title and returns only the rental details for that book.
# Create a method that takes in a book title and adds it to our book list (Add a new hash for the
# book with the student name and date being left as empty strings)
# Create a method that changes the rental details of a book by taking in the title of the book,
# the student renting it and the date it's due to be returned.
