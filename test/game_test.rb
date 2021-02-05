require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class GameTest < Minitest::Test
  def setup
    @game = Game.new
  end

  def test_game_exists
    @game = Game.new

    assert_instance_of Game, @game
  end

  def test_standard_deck_has_52_cards

    @game.standard_deck

    assert_equal @game.cards.length, 52
  end
end
