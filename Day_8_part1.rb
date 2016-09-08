file = File.read "input.txt"
code_character_count = 0
memory_character_count = 0
file.each_line do |line|
	strip_character = line.strip
	code_character_count += strip_character.length
	next if strip_character.empty?
	memory_character = strip_character.gsub(/(\\x..)|(\\\\)|(\\")/,'a')
	memory_character_count+= memory_character.length - 2
end
puts characters_in_memory = code_character_count - memory_character_count 