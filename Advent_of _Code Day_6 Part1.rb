file = File.read "bulbb.txt"
current_state = []
count = 0
words = ''
1000.times do |i|
  row = []
  1000.times do |j|
    row << 'off'
  end
  current_state << row
end
file.each_line do |character|
 words = character.split(' ')
 if words[1] == 'on'
  start = words[2].split(",").map{|n| n.to_i}
  ends = words[4].split(",").map{|n| n.to_i}
  for j in start[0]..ends[0]
    for k in start[1]..ends[1]
      current_state[j][k] = 'on'
    end 
  end
elsif words[1] == 'off'
  start = words[2].split(",").map{|n| n.to_i}
  ends =words[4].split(",").map{|n| n.to_i}
  for j in start[0]..ends[0]
    for k in start[1]..ends[1]
      current_state[j][k] = 'off'
    end
  end
elsif words[0] =='toggle' 
  start = words[1].split(",").map{|n| n.to_i}
  ends = words[3].split(",").map{|n| n.to_i}
  for i in start[0]..ends[0]
    for j in start[1]..ends[1]
      if current_state[i][j] == 'off'
        current_state[i][j] = 'on'
      elsif current_state[i][j] == 'on'
        current_state[i][j] = 'off'
      end
    end
  end
end
end
1000.times do |i|
  1000.times do |j|
    if current_state[i][j] == 'on'
      count = count + 1
    end
  end
end
puts count