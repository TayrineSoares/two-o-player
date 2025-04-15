class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
    @other_player = @player2
  end

  # PUBLIC METHODS 
  def start 
    # Display a welcome message
    puts "Welcome to the Math Game!"
    puts "Each player will take turns answering math questions."
    puts "Whoever answers incorrectly will lose a life. You start with 3 lives."
    puts "Let's begin!"

    # Loop until the game is over
    until game_over?
      # Ask the current player a question
      question = Question.new
      puts question.ask(@current_player.name)
      player_answer = gets.chomp

      # Check if the answer is correct and update lives if necessary
      if question.correct?(player_answer)
        puts "#{@current_player.name}: YES! You are correct."
      else
        puts "#{@current_player.name}: Seriously? No!"
        @current_player.lose_life
      end

      # Display the current score for both players
      display_score

      # Switch to the other player
      switch_player
    end

    # Announce the winner when the game is over
    announce_winner
  end

  # Switches between the current player and the other player
  def switch_player
    temp = @current_player  # Store the current player in a temporary variable
    @current_player = @other_player  # Assign the other player to current player
    @other_player = temp  # Assign the original current player (stored in temp) to the other player
  end

  # Checks if either player has lost all their lives
  def game_over?
    !@player1.alive? || !@player2.alive?
  end

  # Announces the winner when the game is over
  def announce_winner
    if @player1.alive?
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3!"
    else
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3!"
    end
    puts "----- GAME OVER -----"
  end

  # Displays the current score for both players
  def display_score
    @player1.score_display
    @player2.score_display
    puts "----- NEW TURN -----"
  end
end
