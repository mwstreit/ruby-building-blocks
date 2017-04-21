puts "Text, please!"
user_text = gets.chomp

words = user_text.split
frequencies = Hash.new 0

words.each do |word|
	frequencies[word] += 1
end

frequencies = frequencies.sort_by { |word, frequency| frequency }
frequencies.reverse!

frequencies.each do |word, frequency|
	puts "#{word}: #{frequency}"
end
