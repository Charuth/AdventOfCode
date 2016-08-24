file = File.read "bulbb.txt"
initial_state = []
lit_lights = 0
words = ''
1000.times do |i|
  row = []
  1000.times do |j|
    row << 'off'
  end
  initial_state << row
end
file.each_line do |character|
 words = character.split(' ')
 if words[1] == 'on'
  starting_point = words[2].split(",").map{|n| n.to_i}
  ending_point = words[4].split(",").map{|n| n.to_i}
  for j in starting_point[0]..ending_point[0]
    for k in starting_point[1]..ending_point[1]
      initial_state[j][k] = 'on'
    end 
  end
elsif words[1] == 'off'
  starting_point = words[2].split(",").map{|n| n.to_i}
  ending_point =words[4].split(",").map{|n| n.to_i}
  for j in starting_point[0]..ending_point[0]
    for k in starting_point[1]..ending_point[1]
      initial_state[j][k] = 'off'
    end
  end
elsif words[0] =='toggle' 
  starting_point = words[1].split(",").map{|n| n.to_i}
  ending_point = words[3].split(",").map{|n| n.to_i}
  for i in starting_point[0]..ending_point[0]
    for j in starting_point[1]..ending_point[1]
      if initial_state[i][j] == 'off'
        initial_state[i][j] = 'on'
      elsif initial_state[i][j] == 'on'
        initial_state[i][j] = 'off'
      end
    end
  end
end
end
1000.times do |i|
  1000.times do |j|
    if initial_state[i][j] == 'on'
      lit_lights = lit_lights + 1
    end
  end
end
puts lit_lights