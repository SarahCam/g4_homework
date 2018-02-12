require('pry')

class Game

  def initialize(hand1,hand2)
    @hand1 = hand1
    @hand2 = hand2
  end

  def result()
    if (@hand1 == "scissors" && @hand2 == "rock") ||
       (@hand1 == "rock" && @hand2 == "paper") ||
       (@hand1 == "paper" && @hand2 == "scissors")
      return @hand2
    elsif (@hand1 == @hand2)
      return "tie"
    else
      return @hand1
    end
  end

end
