class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    if @cards[index] == nil
      return 0
    else
      @cards[index].rank
    end 
  end

  def high_ranking_cards
    high_ranking_cards = []
    @cards.each do |card|
      if card.rank > 10
        high_ranking_cards << card
      end
    end
    high_ranking_cards
  end

  def percent_high_ranking
    high_rankers = []
    @cards.each do |card|
      if card.rank > 10
        high_rankers << card
      end
    end
    high_percent = (high_rankers.length.to_f / @cards.length * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end
end
