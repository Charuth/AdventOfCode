file = File.read 'input.txt'

sum = 0
file.each_char do |c|
result =
        if c == '('
           1
        elsif c == ')'
          -1
        else
           0
  end
  sum += result 
end
puts sum





           
         
         
         
           
         



