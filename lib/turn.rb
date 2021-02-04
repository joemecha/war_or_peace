class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @types = [:basic, :war, :mutually_assured_destruction]
  end

  def type
    # Compare cards from players' decks to determine type of turn
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      @types[0]
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) &&
          @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
      @types[1]
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) &&
          @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      @types[2]
    end
  end

  def winner
    #Determine the winner of the turn
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      else
        @player2
      end
    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1
      else
        @player2
      end 
    elsif type == :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_cards
    #Cards sent from players' decks into spoils_of_war
  end

  def award_spoils
    #Cards in spoils_of_war added to winner's deck
  end
end
