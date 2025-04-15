class Question
  # Give read-only access to the question numbers and the correct answer
  attr_reader :num1, :num2, :correct_answer

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @correct_answer = @num1 + @num2
  end

  #PUBLIC METHODS

  # Returns the question string for the current player
  def ask(player_name)
    "#{player_name}: What does #{@num1} plus #{@num2} equal?"
  end

  # Returns a boolean value
  def correct?(player_answer)
    player_answer.to_i == @correct_answer
  end
   
end

