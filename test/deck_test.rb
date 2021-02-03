require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require 'pry'

class DeckTest < Minitest::Test
  def test_it_exists
    deck = Deck.new

    assert_instance_of Deck, deck
  end

  def test_it_has_52_cards
    deck = Deck.new

    assert_equal 52, deck.cards.length
  end

  def cards_have_values
    deck = Deck.new
    some_card_value = deck.cards.first.value

    refute_nil some_card_value
  end
end
