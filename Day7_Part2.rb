filename = ARGV[0].strip
file = File.read(filename)

def find_operand_value(wires, operand)
  return nil unless operand
  return nil unless operand.match(/\d+/) or wires[operand]
  wires[operand] || operand.to_i
end

wires = {}
1000.times do
  file.each_line do |line|
    operation, output = line.strip.split('->')
    output = output.strip
    words = operation.strip.split(' ')
    
    wires['b'] = 46065
    operand2,operator,operand1 = words.reverse
    operand1 = find_operand_value(wires, operand1)
    operand2 = find_operand_value(wires, operand2)

    next unless operand2
    next if words.count == 3 and (not operand1)

    wires[output] = case operator
    when 'RSHIFT' then (operand1 >> operand2)
    when 'LSHIFT' then (operand1 << operand2)
    when 'AND' then (operand1 & operand2) 
    when 'OR' then (operand1 | operand2)
    when 'NOT' then ~ operand2 % 65536
    else
      operand2
    end
  end
end
 puts wires['a']