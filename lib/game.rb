class Game
  attr_reader :game_cards, :deck1, :deck2, :turn_counter

  def initialize
    @game_cards = []
    @deck1 = []
    @deck2 = []
    @turn_counter = 0
  end

  def standard_deck
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    values = %w(two three four five six seven eight nine ten jack queen king ace)
    suits = [:club, :diamond, :heart, :spade]

    ranks_and_value_hash = Hash[ranks.zip(values)] # create hash to make this work

    ranks_and_value_hash.each do |rank, value|
      suits.each do |suit|
        @game_cards << Card.new(suit, value, rank) # This needs to go to
      end
    end
  end

  def shuffle_deck
    @game_cards.shuffle! #Note: '!' modifies the array in place
  end

  def deal_cards
    shuffle_deck
    @cards1 = @game_cards[0..25]
    @cards2 = @game_cards[26..52]
    @deck1 = Deck.new(@cards1)
    @deck2 = Deck.new(@cards2)
  end

  def play_turn
    turn = Turn.new(@player1, @player2)
    @turn_counter += 1
    turn.pile_cards
    turn.award_spoils(turn.winner)
    if turn.type == :basic
      p "Turn #{@turn_counter}: #{@turn.winner.name} won 2 cards"
    elsif turn.type == :war
      p "Turn #{@turn_counter}: WAR - #{@turn.winner.name} won 6 cards"
    elsif turn.type == :mutually_assured_destruction
      p "Turn #{@turn_counter}: *mutually assured desctruction* 6 cards removed from play"
    end
  end

  def start
    # Generates a 52 card deck
    standard_deck
    # Shuffles cards and divides into 2 player decks
    deal_cards

    @player1 = Player.new("Space Ghost", @deck1)
    @player2 = Player.new("Zorak", @deck2)

    p "Welcome to War! (or Peace) This game will be played with 52 cards.
    The players today are Space Ghost and Zorak.
    Type 'GO' to start the game!
    ------------------------------------------------------------------"
    # Get user input to run the game
    ok_go = gets.chomp
    ok_go = gets.chomp
    if ok_go == "go" || ok_go == "GO"
      "" # What is the standard way to move on when input condition met?
         # neither 'break' nor 'next' worked
    else
      until ok_go == "go" || ok_go == "GO"
        puts "Please type 'go' or 'GO' to start the game."
        ok_go = gets.chomp
      end
    end
  end

  # Add method with completed conditional loop with play_turn method and end_game method here


  def end_game
    if @turn.player1.has_lost?
      p "*~*~*~* #{@player2} has won the game! *~*~*~*"
    else
      p "*~*~*~* #{@player1} has won the game! *~*~*~*"
    end
  end


    #
      #Code for turns and display until draw or winner
      # while turn_counter < 1000000
      #   @turn_counter += 1
      #   self.play_turn
      #
      #   # Display messages by turn type:
      #
      #   # end of game messages:
      #   p "*~*~*~* #{} has won the game! *~*~*~*"
      #   p "Turn #{@turn_counter}! The game is a draw. Too bad!"
      # end
    # end
end
