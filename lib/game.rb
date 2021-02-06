class Game
  attr_reader :cards, :deck1, :deck2

  def initialize
    @cards = []
    @deck1 = []
    @deck2 = []
  end

  def standard_deck
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    values = %w(two three four five six seven eight nine ten jack queen king ace)
    suits = [:club, :diamond, :heart, :spade]

    ranks_and_value_hash = Hash[ranks.zip(values)] # create hash to make this work

    ranks_and_value_hash.each do |rank, value|
      suits.each do |suit|
        @cards << Card.new(suit, value, rank)
      end
    end
  end

  def shuffle_deck
    @cards.shuffle! #Note: '!' modifies the array in place
  end

  def deal_cards
    shuffle_deck
    @deck1 = @cards[0..25]
    @deck2 = @cards[26..52]

  end

  def play_turn
    Turn.new(@player1, @player2)
    if # conditional for turn type and display

  end

  def start
    standard_deck
    deal_cards

    @player1 = Player.new("Space Ghost", @deck1)
    @player2 = Player.new("Zorak", @deck2)

    p "Welcome to War! (or Peace) This game will be played with 52 cards.
    The players today are Space Ghost and Zorak.
    Type 'GO' to start the game!
    ------------------------------------------------------------------"
    ok_go = gets.chomp
    ok_go = gets.chomp
    if ok_go == "go" || ok_go == "GO"
      ""
    else
      until ok_go == "go" || ok_go == "GO"
        puts "Please type 'go' or 'GO' to start the game."
        ok_go = gets.chomp
      end
    end
    #   #Code for turns and display until draw or winner
      turn_counter = 0
      while turn_counter < 1000000
        Turn.new(@player1, @player2) # put into a game method
        # display what's happening
        turn_counter += 1
      end
    end
  end
end




# ALTERNATIVE CODE TO BE DELETED
#rewrite [0..]
# @cards.each do |card|
#   if @cards.index(card).even?
#     @deck1 << card
#   elsif @cards.index(card).odd?
#     @deck2 << card
#   end
