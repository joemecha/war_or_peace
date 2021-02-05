class Game

  def initialize
    
  end

  def standard_deck
    @ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    @values = %w(two three four five six seven eight nine ten jack queen king ace)
    @suits = [:club, :diamond, :heart, :spade]

    @ranks_and_value_hash = Hash[@ranks.zip(@values)] # create hash to make this work

    @ranks_and_value_hash.each do |rank, value|
      @suits.each do |suit|
        @cards << Card.new(suit, value, rank)
      end
    end
  end

  def shuffle_deck
    standard_deck.shuffle
  end

  def deal_cards
    @cards.each do |card|
      if card.index.even?
        @turn.player1.deck.cards << card
      elsif card.index.odd?
        @turn.player2.deck.cards << card
      end
    end
  end

end
