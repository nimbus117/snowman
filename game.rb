class Game
  attr_reader(:player)

  def initialize(player, word)
    @player = player
    @word = word
  end

  def subtract_life()
    @player.lives -= 1
  end
end
