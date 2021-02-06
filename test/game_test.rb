require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
# require './war_or_peace_runner'
require 'pry'

class GameTest < Minitest::Test
  def setup
    @game = Game.new
  end

  def test_game_exists
    assert_instance_of Game, @game
  end

  def test_standard_deck_has_52_cards
    # binding.pry
    @game.standard_deck

    assert_equal @game.cards.length, 52
  end

  def test_shuffle_deck
    @game.standard_deck
    unshuffled = @game.cards[0..2]

    @game.shuffle_deck
    shuffled = @game.cards[0..2]

    refute_equal shuffled, unshuffled
  end

  def test_deal_cards
    @game.standard_deck
    @game.deal_cards


    assert_equal @game.deck1.length, 26 # Left out 'game.' in this test and was stuck for a long time 
    assert_equal @game.deck2.length, 26
    refute_equal @game.deck1, @game.deck2
  end

  def start_creates_two_players
    @game.start

    assert_equal @game.player1.name, "Muttley"
    assert_equal @game.player2.name, "Scooby"
    assert_equal @game.start.player1.deck, @game.deck1
    assert_equal @game.start.player2.deck, @game.deck2
  end

end
