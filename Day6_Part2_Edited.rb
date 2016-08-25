filename = ARGV[0].strip
file = File.read(filename)

brightness = []

1000.times do |i|
	row = []
	1000.times {|j| row << 0 }
	brightness << row
end

file.each_line do |line|
  split_words = line.split(' ')
  position = 2 if split_words[0] == 'turn'
  position = 1 if split_words[0] == 'toggle'

  starting_point = split_words[position].split(",").map{|n| n.to_i}
  ending_point =split_words[position + 2].split(",").map{|n| n.to_i}

  for j in starting_point[0]..ending_point[0]
    for k in starting_point[1]..ending_point[1]
      if split_words[0] == 'turn'
        brightness[j][k] += 1 if split_words[1] == 'on'
        brightness[j][k] -= 1 if brightness[j][k] > 0 and split_words[1] == 'off'
      else
        brightness[j][k] += 2
      end
    end
  end
end

total_brightness = 0
1000.times do |i|
  1000.times do |j|
    total_brightness += brightness[i][j]
  end
end
puts total_brightness
