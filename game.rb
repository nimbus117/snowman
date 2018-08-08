class Game
  attr_reader(:player, :guessed_chars)

  def initialize(player, word)
    @player = player
    @word = word
    @guessed_chars = []
  end

  def subtract_life()
    @player.lives -= 1
  end

  def guess(char)
    @guessed_chars.push(char)
    subtract_life() if !@word.test(char)
  end

  def is_won?()
    displayed_word = @word.display(@guessed_chars)
    return !displayed_word.include?('*')
  end

  def is_lost?()
    @player.lives == 0
  end
end
