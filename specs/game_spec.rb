require('minitest/autorun')
require('minitest/rg')
require_relative('../hidden_word.rb')
require_relative('../player.rb')
require_relative('../game.rb')

class GameTest < MiniTest::Test
  def setup
    word = HiddenWord.new('test word')
    @player = Player.new('Bob')
    @game = Game.new(@player, word)
  end

  def test_has_player
    assert_equal(@player, @game.player)
  end

  def test_can_subtract_life
    @game.subtract_life()
    assert_equal(5, @player.lives)
  end
end
