file = File.read "inputtt.txt"
bright = []
sum = 0
words = ''
1000.times do |i|
	row = []
	1000.times do |j|
		row << 0
	end
	bright << row
end
file.each_line do |character|
 words = character.split(' ')
 if words[1] == 'on'
  start = words[2].split(",").map{|n| n.to_i}
  ends = words[4].split(",").map{|n| n.to_i}
  for j in start[0]..ends[0]
    for k in start[1]..ends[1]
      bright[j][k] = bright[j][k] + 1
    end 
  end
elsif words[1] == 'off'
  start = words[2].split(",").map{|n| n.to_i}
  ends =words[4].split(",").map{|n| n.to_i}
  for j in start[0]..ends[0]
    for k in start[1]..ends[1]
      if  bright[j][k] > 0
        bright[j][k] = bright[j][k] - 1
      end
    end
  end
elsif words[0] == 'toggle'
  start = words[1].split(",").map{|n| n.to_i}
  ends = words[3].split(",").map{|n| n.to_i}
  for j in start[0]..ends[0]
    for k in start[1]..ends[1]
      bright[j][k] = bright[j][k] + 2
    end
  end
end
end
1000.times do |i|
  1000.times do |j|
    sum = sum + bright[i][j]
  end
end
puts sum