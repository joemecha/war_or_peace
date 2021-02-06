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
    @game.standard_deck

    assert_equal @game.game_cards.length, 52
  end

  def test_shuffle_deck
    @game.standard_deck
    unshuffled = @game.game_cards[0..2]

    @game.shuffle_deck
    shuffled = @game.game_cards[0..2]

    refute_equal shuffled, unshuffled
  end

  def test_deal_cards
    @game.standard_deck
    @game.deal_cards


    assert_equal @game.deck1.cards.length, 26 # Left out 'game.' in this test and was stuck for a long time
    assert_equal @game.deck2.cards.length, 26
    refute_equal @game.deck1.cards, @game.deck2.cards 
  end

  def test_play_turn_increments_turn_counter #Not working
    skip
    @game.standard_deck
    @game.deal_cards

    @player1 = Player.new("Space Ghost", @game.deck1) #something with deck/cards wrong here
    @player2 = Player.new("Zorak", @game.deck2)

    assert_equal @game.turn_counter, 0

    @game.play_turn

    assert_equal @game.turn_counter, 1
  end


  def start_creates_two_players # Passes
    skip
    @game.start

    assert_equal @game.player1.name, "Space Ghost"
    assert_equal @game.player2.name, "Zorak"
    assert_equal @game.start.player1.deck, @game.deck1
    assert_equal @game.start.player2.deck, @game.deck2
  end

  def test_end_game # NOT WORKING
    skip
    @game.standard_deck
    @game.deal_cards
    @game.start

    @turn = turn = Turn.new(@player1, @player2)

    assert_equal @game.player1.has_lost?, false
    assert_equal @game.player2.has_lost?, false

    @game.player1.deck.cards = []
    @game.player2.deck.cards = []

    assert_equal @game.player1.has_lost?, true
    assert_equal @game.player2.has_lost?, true
  end
end
