# STUDENT CLASS

class Student
  attr_accessor :name, :cohort

  def initialize(input_name, input_cohort)
    @name = input_name
    @cohort = input_cohort
  end

  def talk()
    return "I can talk!"
  end

  def say_favourite_language(language)
    return "I love " + language
  end

end

# TEAM CLASS

class Team
  attr_accessor :name, :players, :coach, :points

  def initialize(input_name, input_players, input_coach, input_points)
    @name = input_name
    @players = input_players
    @coach = input_coach
    @points = input_points
  end

  def add_player(player)
    @players << player
  end

  def is_player?(player)
    return @players.include?(player)
  end

  def get_points(score)
    if score == "win"
      @points += 1
    end
    return @points
  end

end

# LIBRARY CLASS

class Library
  attr_accessor :books

  def initialize(input_books)
    @books = input_books
  end

  def get_book(title)
    for book in @books
      if book[:title] == title
        return book
      end
    end
    return nil
  end

  def get_book_rental_details(title)
    for book in @books
      if book[:title] == title
        return book[:rental_details]
      end
    end
    return nil
  end

  def add_new_book(book)
    @books << book
  end

  def change_rental_details(title, student, date)
    book = get_book(title)
    book[:rental_details][:student_name] = student
    book[:rental_details][:date] = date
  end

  def get_student_name(title)
    book = get_book(title)
    return book[:rental_details][:student_name]
  end

  def get_date(title)
    book = get_book(title)
    return book[:rental_details][:date]
  end


end
