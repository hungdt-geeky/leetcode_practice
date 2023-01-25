# @param {Integer[]} edges
# @param {Integer} node1
# @param {Integer} node2
# @return {Integer}
def closest_meeting_node(edges, node1, node2)

  distances_node1 = find_distances(edges, node1)
  distances_node2 = find_distances(edges, node2)

  current_index = -1
  current_minimum = distances_node1.size

  (0...edges.size).each do |i|
    next if distances_node2[i].nil? || distances_node1[i].nil?

    local_max = distances_node2[i] > distances_node1[i] ? distances_node2[i] : distances_node1[i]

    if local_max < current_minimum
      current_minimum = local_max
      current_index = i
    end
  end

  current_index
end

def find_distances(edges, start_node)
  distances = Array.new(edges.size)

  stack = [start_node]

  distance = 0
  visited = Set.new
  while stack.any?
    node = stack.pop
    next if visited.include?(node) # check loop

    visited << node
    distances[node] = distance

    next_node = edges[node]

    next if next_node == -1
    stack.push(next_node)

    distance += 1
  end

  distances
end