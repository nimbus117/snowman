require('minitest/autorun')
require('minitest/rg')
require_relative('../hidden_word.rb')

class PlayerTest < MiniTest::Test

  def setup
    @word = HiddenWord.new('test word')
    @guessed_letters = ['o','t','x']
  end

  def test_can_display_word__hidden
    assert_equal('**** ****', @word.display([]))
  end

  def test_can_display_word__matched
    assert_equal('t**t *o**', @word.display(@guessed_letters))
  end

  def test_can_test_letter__true
    assert_equal(true, @word.test('t'))
  end

  def test_can_test_letter__false
    assert_equal(false, @word.test('x'))
  end
end
