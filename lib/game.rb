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
    @cards.shuffle!
  end

  def deal_cards
    shuffle_deck
    @deck1 = @cards[0..25]
    @deck2 = @cards[26..52]

  end

  def start

    @player1 = Player.new("Muttley", @deck1)
    @player2 = Player.new("Underdog", @desk2)
  end

end


#rewrite [0..]
# @cards.each do |card|
#   if @cards.index(card).even?
#     @deck1 << card
#   elsif @cards.index(card).odd?
#     @deck2 << card
#   end
