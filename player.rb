# Represents one person in the game. Tracks their name and lives.
class Player 

  attr_reader :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  # PUBLIC METHODS

  # Reduces one life when the player answers incorrectly
  def lose_life
    @lives -= 1
  end

  # Checks if the player is still alive
  def alive?
    @lives > 0
  end

  # Displays the player's current score (name and remaining lives)
  def score_display
    puts "#{@name}: #{@lives}/3"
  end
end



