require('minitest/autorun')
require('minitest/rg')
require_relative('../hidden_word.rb')
require_relative('../player.rb')
require_relative('../game.rb')

class GameTest < MiniTest::Test
  def setup
    @word = 'test word'
    hidden_word = HiddenWord.new(@word)
    @player = Player.new('Bob')
    @game = Game.new(@player, hidden_word)
  end

  def test_has_player
    assert_equal(@player, @game.player)
  end

  def test_can_subtract_life
    @game.subtract_life()
    assert_equal(5, @player.lives)
  end

  def test_can_guess__correct
    @game.guess('t')
    assert_equal(['t'], @game.guessed_chars)
    assert_equal(6, @player.lives)
  end

  def test_can_guess__incorrect
    @game.guess('x')
    assert_equal(['x'], @game.guessed_chars)
    assert_equal(5, @player.lives)
  end

  def test_is_won
    @word.each_char {|c| @game.guess(c)}
    assert_equal(true, @game.is_won?)
  end

  def test_is_lost
    'abcfgh'.each_char {|c| @game.guess(c)}
    assert_equal(true, @game.is_lost?)
  end

  def test_is_neither_lost_or_won
    'tes'.each_char {|c| @game.guess(c)}
    assert_equal(false, @game.is_lost?)
    assert_equal(false, @game.is_won?)
  end
end
