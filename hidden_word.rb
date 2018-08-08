class HiddenWord

  def initialize(word)
    @word = word
  end

  def display(guessed_chars)
    display_word = ''
    @word.each_char { |c|
      if c == ' '
        display_word << ' '
      elsif guessed_chars.include? c
        display_word << c
      else
        display_word << '*'
      end
    }
    return display_word
  end

  def test(char)
    @word.include? char
  end
end 
