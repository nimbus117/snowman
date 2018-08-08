require 'highline/import'
require_relative('game.rb')
require_relative('hidden_word.rb')
require_relative('player.rb')

# get player name
print 'Enter player name: '
# create instance of Player
player = Player.new(gets.chomp)

# get hidden word
word_prompt = "Ask someone to enter a word/phrase to guess: "
hidden_word = ask(word_prompt) { |q| q.echo="*" }
# create instance of HiddenWord
word = HiddenWord.new(hidden_word)

# create instance of Game
game = Game.new(player, word)


def player_guess()
  guess = ''
  while guess.length != 1
    print 'Enter a single character: '
    guess = gets.chomp
  end
  return guess
end



until game.is_won? || game.is_lost?
  game.guess(player_guess())
  puts word.display(game.guessed_chars)
end
