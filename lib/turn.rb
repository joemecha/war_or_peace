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
    if type == :basic
      @spoils_of_war.push(@player1.deck.cards[0], @player2.deck.cards[0])
      @player1.deck.cards.shift
      @player2.deck.cards.shift
    elsif type == :war
      @spoils_of_war.push(@player1.deck.cards[0], @player1.deck.cards[1], @player1.deck.cards[2])
      @spoils_of_war.push(@player2.deck.cards[0], @player2.deck.cards[1], @player2 .deck.cards[2])
      3.times do @player1.deck.cards.shift
      end
      3.times do @player2.deck.cards.shift
      end
    elsif type == :mutually_assured_destruction
      3.times do @player1.deck.cards.shift
      end
      3.times do @player2.deck.cards.shift
      end
    end
  end

  def award_spoils(winner)
    pile_cards
    if winner == @player1
      @spoils_of_war.each do |card|
        @player1.deck.cards << card
      end
      @spoils_of_war.clear
    elsif winner == @player2
      @spoils_of_war.each do |card|
        @player2.deck.cards << card
      end
      @spoils_of_war.clear
    elsif winner == "No Winner"
      @spoils_of_war.clear
    end
  end

end
