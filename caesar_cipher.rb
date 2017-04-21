def encode(string, shift_factor)
  encoded_message = ""

  string.each_char do |character|
    encoded_character_number = character.ord + shift_factor

    unless encoded_character_number > 122
      encoded_character = encoded_character_number.chr
    else
      encoded_character = (encoded_character_number - 26).chr #Wraps "z" back around to "a"
    end

    encoded_message += encoded_character
  end
  puts "Your message has been encoded: #{encoded_message}"
end


encode("a", 2)
puts "Should print 'c'"
encode("z", 5)
puts "Should print 'e'"
encode("hello", 10)
puts "Should print 'rovvy'"
encode("this is top secret", 3)
puts "Should print 'wklv#lv#wrs#whfuhw'"
