class Game
  attr_reader :game_cards, :turn_counter

  def initialize
    @game_cards = []
    @turn_counter = 0
  end

  def generate_standard_deck
    # Generates a 52 card deck and stores in @game_cards
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    values = %w(two three four five six seven eight nine ten jack queen king ace)
    suits = [:club, :diamond, :heart, :spade]

    ranks_and_value_hash = Hash[ranks.zip(values)] # hash to make this work

    ranks_and_value_hash.each do |rank, value|
      suits.each do |suit|
        @game_cards << Card.new(suit, value, rank)
      end
    end
  end

  def shuffle_deck
    @game_cards.shuffle!         #Note: '!' modifies the array in place
  end

  def deal_cards
    # Shuffles deck, splits into two arrays, passes on to two new Decks
    shuffle_deck
    @cards1 = @game_cards[0..25]
    @cards2 = @game_cards[26..51]
    @deck1 = Deck.new(@cards1)
    @deck2 = Deck.new(@cards2)
  end

  def start
    generate_standard_deck
    deal_cards

    @player1 = Player.new("Space Ghost", @deck1)
    @player2 = Player.new("Zorak", @deck2)
    @turn = Turn.new(@player1, @player2)

    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are Space Ghost and Zorak."
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"

    # Get user input to run the game
    ok_go = gets.chomp
      if ok_go.downcase == "go"
      play_game                            # I thought I needed 'self.' here but didn't...
    else
      until ok_go == "go" || ok_go == "GO"
        puts "Please type 'go' or 'GO' to start the game."
        ok_go = gets.chomp
      end
    end
  end

  def play_game
    # p "#{@turn.player1.name} now has #{@turn.winner.deck.cards.length} cards" # Delete this checking the start is ok
    # p "#{@turn.player2.name} now has #{@turn.winner.deck.cards.length} cards" # Delete this line too

    until (@player1.has_lost? == true) || (@player2.has_lost? == true) # Changed from while (false and false) to until (true or true)
      @turn_counter += 1
      if @turn_counter == 1000001
        p "Dude, it's turn #{@turn_counter}! The game is a draw. Booooring!"
        break
      else
        if @turn.type == :basic
          winner = @turn.winner
          @turn.pile_cards
          @turn.award_spoils(winner)
          p "Turn #{@turn_counter}: #{@turn.winner.name} won 2 cards"  # UNRESOLVED 76:in `play_game': undefined method `name' for "No Winner":String (NoMethodError)
          p "#{@turn.winner.name} now has #{@turn.winner.deck.cards.length} cards" # Added to observe changes in deck size during game

        elsif @turn.type == :war
          @winner = @turn.winner
          @turn.pile_cards
          @turn.award_spoils(winner)
          p "Turn #{@turn_counter}: WAR - #{@turn.winner.name} won 6 cards"
          p "#{@turn.winner.name} now has #{@turn.winner.deck.cards.length} cards"

        elsif @turn.type == :mutually_assured_destruction
          winner = @turn.winner
          @turn.pile_cards
          @turn.award_spoils(winner)
          p "Turn #{@turn_counter}: *mutually assured desctruction* 6 cards removed from play"

        end
      end
    end
    end_game
  end

  def end_game
    if @turn.player1.has_lost?
      p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
    elsif @turn.player2.has_lost?
      p "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
    end
  end
end
