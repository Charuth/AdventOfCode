filename = ARGV[0].strip
file = File.read(filename)
array_possible_route_sum = []
locations = Hash.new { |h,k| h[k] = {} }
file.each_line do |line|
	source,destination,distance = line.match(/(\S+) to (\S+) = (\d+)/).captures
	locations[source][destination] = distance.to_i
	locations[destination][source] = distance.to_i
end
different_routes = locations.keys.permutation.to_a
different_routes.each do |path|
	counter = 0
  possible_route_sum = 0
  possible_route_length = path.length
  while possible_route_length > 0
    route = locations[path[counter]][path[counter + 1]]
    possible_route_length -= 1
    counter += 1
    possible_route_sum += route.to_i
  end
  array_possible_route_sum.push(possible_route_sum)
end

longest_route = array_possible_route_sum.max
shortest_route = array_possible_route_sum.min 
puts shortest_route
puts longest_route
