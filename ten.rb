
strings = "112"
split_character = []
current_state = nil
count = 1
strings.each_char do |character|
  split_character << character.to_i
  current_state = split_character[0]
  split_character.each do |digit|
    if digit == current_state
      count += 1
    else
      count = 1
      current_state = digit 
    end
  end
end
p count