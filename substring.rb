def substring(words, dictionary)
  words_array = words.downcase.split
  substring_count = Hash.new(0)

  words_array.each do |word|
    dictionary.each do |substring|
      substring_count[substring] += 1 if word[substring]
    end
  end

  substring_count
end

dictionary = %w[
  below down go going horn how howdy it i low own part partner sit
]
puts substring('below', dictionary)
puts substring("Howdy partner, sit down! How's it going?", dictionary)
