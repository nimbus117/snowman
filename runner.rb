require 'highline/import'
require_relative('game.rb')
require_relative('hidden_word.rb')
require_relative('player.rb')

# function to display a different snowman depending on lives left
def display_snowman(lives_left = 6)
  title = "Snowman Game - by nimbus117\n\n"
  system 'clear'
  case lives_left
  when 6
    puts title
    puts '    _'
    puts '   (,)'
    puts '  ( : )'
    puts '  ( : )'
    puts ''
  when 5
    puts title
    puts '    _'
    puts '   (,)'
    puts '  ( : )'
    puts '    : )'
    puts ''
  when 4
    puts title
    puts '    _'
    puts '   (,)'
    puts '  ( : )'
    puts '    :'
    puts ''
  when 3
    puts title
    puts '    _'
    puts '   (,)'
    puts '    : )'
    puts '    :'
    puts ''
  when 2
    puts title
    puts '    _'
    puts '   (,)'
    puts '    :'
    puts '    :'
    puts ''
  when 1
    puts title
    puts '    _'
    puts '   (,)'
    puts ''
    puts ''
    puts ''
  else
    puts title
    puts ''
    puts ''
    puts ''
    puts ''
    puts ''
  end
end

# display welcome message
display_snowman
puts "\nWelcome to the Snowman game. "\
  "\nThe aim is to guess a word or phrase before the Snowman melts."\
  "\nYou need a friend to play this game. "\
  "\nPress enter once you've found one!"
gets

# get player_name and instantiate Player class
display_snowman
print "\nEnter your name: "
player_name = gets.chomp
player = Player.new(player_name)

# get hidden_word and instantiate HiddenWord class
display_snowman
word_prompt = "\nAsk your friend to enter a word/phrase to guess: "
hidden_word = ask(word_prompt) { |q| q.echo='*' }
word = HiddenWord.new(hidden_word)

# create a new instance of the Game class
game = Game.new(player, word)

# display ready message and prompt to continue
display_snowman(player.lives)
puts word.display(game.guessed_chars)
puts "Good luck #{player.name}! Press enter when you're ready to start."
gets

# start game loop
until game.is_won? || game.is_lost?
  display_snowman(player.lives)
  guessed_chars = game.guessed_chars
  puts word.display(guessed_chars)
  # prompt for player guess
  guess = ''
  while guess.length != 1
    print 'Enter a single character: '
    guess = gets.chomp
    while guessed_chars.include?(guess.downcase)
      puts "You've already guessed #{guess}"
      guess = ''
    end
  end
  game.guess(guess)
end

# display win/lose message
if game.is_won?
  display_snowman(player.lives)
  puts word.display(game.guessed_chars)
  puts "Congratulations #{player.name}, "\
    "you guessed the word before the Snowman melted!\n\n"
else
  display_snowman(player.lives)
  puts word.display(game.guessed_chars)
  puts "Commiserations #{player.name}, "\
    "you didn't guess the word before the Snowman melted!\n\n"
end
