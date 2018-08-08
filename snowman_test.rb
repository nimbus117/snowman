#puts " O "
#puts "/|\\"
#puts "/ \\"


#puts "    _"
#puts "   (,)"
#puts "  ( : )"
#puts "  ( : )"
#puts ""


def display_snowman(lives_left)
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

6.times do |i|
  display_snowman(i+1)
end
