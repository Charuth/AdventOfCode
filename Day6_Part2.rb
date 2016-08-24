file = File.read "inputtt.txt"
brightness = []
total_brightness = 0
split_words = ''
1000.times do |i|
	row = []
	1000.times do |j|
		row << 0
	end
	brightness << row
end
file.each_line do |character|
 split_words = character.split(' ')
 if split_words[1] == 'on'
  starting_point = split_words[2].split(",").map{|n| n.to_i}
  ending_point = split_words[4].split(",").map{|n| n.to_i}
  for j in starting_point[0]..ending_point[0]
    for k in starting_point[1]..ending_point[1]
      brightness[j][k] = brightness[j][k] + 1
    end 
  end
elsif split_words[1] == 'off'
  starting_point = split_words[2].split(",").map{|n| n.to_i}
  ending_point =split_words[4].split(",").map{|n| n.to_i}
  for j in starting_point[0]..ending_point[0]
    for k in starting_point[1]..ending_point[1]
      if  brightness[j][k] > 0
        brightness[j][k] = brightness[j][k] - 1
      end
    end
  end
elsif split_words[0] == 'toggle'
  starting_point = split_words[1].split(",").map{|n| n.to_i}
  ending_point = split_words[3].split(",").map{|n| n.to_i}
  for j in starting_point[0]..ending_point[0]
    for k in starting_point[1]..ending_point[1]
      brightness[j][k] = brightness[j][k] + 2
    end
  end
end
end
1000.times do |i|
  1000.times do |j|
    total_brightness = total_brightness + brightness[i][j]
  end
end
puts total_brightness