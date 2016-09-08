file = File.read "input.txt"
code_character_count = 0
encoded_character_count = 0
file.each_line do |line|
	strip_character = line.strip
	code_character_count += strip_character.length
	next if strip_character.empty?
	encoded_character_count +=  strip_character.inspect.length
end
puts  number_of_encodded_strings = encoded_character_count - code_character_count 