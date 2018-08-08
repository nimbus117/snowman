require('minitest/autorun')
require('minitest/rg')
require_relative('../player.rb')

class PlayerTest < MiniTest::Test

  def setup
    @player = Player.new('Bob')
  end

  def test_player_has_name
    assert_equal('Bob', @player.name)
  end

  def test_player_has_6_lives
    assert_equal(6, @player.lives)
  end

  def test_player_can_subtract_lives
    @player.lives = @player.lives - 1
    assert_equal(5, @player.lives)
  end
end
