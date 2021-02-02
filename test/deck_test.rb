require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def test_it_exists
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_it_has_52_cards
    deck = Deck.new(cards)

    assert_equal 52, deck.length
  end
end
