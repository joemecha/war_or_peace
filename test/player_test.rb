require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require 'pry'

class PlayerTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)

    @deck = Deck.new([@card1, @card2, @card3])
    @player = Player.new('Clarisa', @deck)
  end

  def test_player_exists
    assert_instance_of Player, @player
  end

  def test_player_has_a_name
    assert_equal 'Clarisa', @player.name
  end

  def test_player_has_a_deck_of_cards
    assert_equal @deck, @player.deck
  end

  def test_player_has_not_lost_if_cards_in_deck
    @player.deck.remove_card
    @player.deck.remove_card

    assert_equal false, @player.has_lost?
  end

  def test_player_has_lost_if_no_cards_in_deck
    @player.deck.remove_card
    @player.deck.remove_card
    @player.deck.remove_card

    assert_equal true, @player.has_lost?
  end


end
