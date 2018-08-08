require 'highline/import'
require_relative('game.rb')
require_relative('hidden_word.rb')
require_relative('player.rb')

# function to prompt for player guess
def player_guess()
  guess = ''
  while guess.length != 1
    print 'Enter a single character: '
    guess = gets.chomp
  end
  return guess
end

# function to display different snowman depending on lives left
def display_snowman(lives_left = 6)
  case lives_left
  when 6
    puts "    _"
    puts "   (,)"
    puts "  ( : )"
    puts "  ( : )"
    puts ""
  when 5
    puts "    _"
    puts "   (,)"
    puts "  ( : )"
    puts "    : )"
    puts ""
  when 4
    puts "    _"
    puts "   (,)"
    puts "  ( : )"
    puts "    :  "
    puts ""
  when 3
    puts "    _"
    puts "   (,)"
    puts "    : )"
    puts "    :  "
    puts ""
  when 2
    puts "    _"
    puts "   (,)"
    puts "    :  "
    puts "    :  "
    puts ""
  when 1
    puts "    _"
    puts "   (,)"
    puts ""
    puts ""
    puts ""
  end
end

# start game
system 'clear'
display_snowman

# get player name
print 'Enter player name: '
# create instance of Player
player = Player.new(gets.chomp)

# get hidden word
word_prompt = 'Ask someone to enter a word/phrase to guess: '
hidden_word = ask(word_prompt) { |q| q.echo='*' }
# create instance of HiddenWord
word = HiddenWord.new(hidden_word)

# create instance of Game
game = Game.new(player, word)


system 'clear'
display_snowman(player.lives)
until game.is_won? || game.is_lost?
  game.guess(player_guess())
  system 'clear'
  display_snowman(player.lives)
  puts word.display(game.guessed_chars)
end
