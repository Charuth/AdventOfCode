input_string = "1321131112"

50.times do 
  occurance_count = 0
  output = ''
  previous_character = input_string[0]

  input_string.each_char do |character|
    if character == previous_character 
      occurance_count += 1             
    else
      output << "#{occurance_count}#{previous_character}"
      previous_character = character
      occurance_count = 1
    end
  end

  output << "#{occurance_count}#{previous_character}" 
  input_string = output
  puts output.length
end
