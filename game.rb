class Game
  attr_reader(:player)

  def initialize(player, word)
    @player = player
    @word = word
  end
end
