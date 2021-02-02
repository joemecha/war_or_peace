class Deck
  attr_accessor #stuff

  def initialize(cards)
    @cards = []
  end

  def rank_of_card_at(index)
    #stuff
  end

  def high_ranking_cards(cards)
    #returns an array of cards in deck rank 11 and above
  end

  def percent_high_ranking(cards)
    #this method will return the percentage of high ranking cards
  end

  def remove_card
    #removes top card of deck
  end

  def add_card
    #adds one card to the bottom (end) of the deck
  end
end
