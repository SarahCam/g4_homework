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
