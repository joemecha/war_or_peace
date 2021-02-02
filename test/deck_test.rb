require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def test_it_exists
    deck = Deck.new

    assert_instance_of Deck, deck
  end

  def test_it_has_52_cards
    deck = Deck.new

    assert_equal 52, deck.cards.length
  end
end
