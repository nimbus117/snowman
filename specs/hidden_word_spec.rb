require('minitest/autorun')
require('minitest/rg')
require_relative('../hidden_word.rb')

class PlayerTest < MiniTest::Test

  def setup
    @word = Word.new('test word')
    @guessed_letters = ['o','t','x']
  end

  def test_can_display_word__hidden
    assert_equal('**** ****', @word.display())
  end

  def test_can_display_word__matched
    assert_equal('t**t *o**', @word.display())
  end

  def can_test_letter__true
    assert_equal(true, @word.test_letter('t'))
  end

  def can_test_letter__false
    assert_equal(false, @word.test_letter('x'))
  end
end
