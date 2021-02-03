class Deck
  attr_reader :cards

  def initialize
    @cards = []
    @ranks = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14"]
    @values = %w(two three four five six seven eight nine ten jack queen king ace)
    @suits = [:club, :diamond, :heart, :spade]

    @ranks.each do |rank, value| # This does not work. All values are nil
      @suits.each do |suit|
        @cards << Card.new(suit, value, rank)
      end
    end
  end

  def rank_of_card_at(index)
    # stuff
  end

  def high_ranking_cards(cards)
    # returns an array of cards in deck rank 11 and above
  end

  def percent_high_ranking(cards)
    # this method will return the percentage of high ranking cards
  end

  def remove_card
    # removes top card of deck
  end

  def add_card
    # adds one card to the bottom (end) of the deck
  end
end
