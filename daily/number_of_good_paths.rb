# https://leetcode.com/problems/number-of-good-paths/

def find(x)
  if @parents[x] != x
    @parents[x] = find(@parents[x])
  end
  @parents[x]
end

def union(x, y)
  group_x = find(x)
  group_y = find(y)
  @parents[group_y] = group_x
end

# @param {Integer[]} vals
# @param {Integer[][]} edges
# @return {Integer}
# idea: paths in a connected graph for nodes [a, b, c, d...] size=N are N*(N+1)/2
# need start and end nodes to be the same value, intermediate nodes to be less/equal
# we can calculate how many paths for each value: have a value => nodes map
# if we go from lowest value to highest, then lower value paths are covered (can't go from high to low)
# we don't know how many connected graphs are for one value (nodes can be all connected, separetely connected etc.)
# if we can find how the # of connected graphs for one value, then we can apply the fn (#*(#+1)/2) to find out the # of paths in each connected graph of the value, then sum up
# to find out how many connected graphs for one value, we can use union-find for each value node

def number_of_good_paths(vals, edges)
  neighbours = {} # key: index, value: [node, val]
  edges.each do |n1, n2|
    neighbours[n1] ? neighbours[n1] << [n2, vals[n2]] : neighbours[n1] = [[n2, vals[n2]]]
    neighbours[n2] ? neighbours[n2] << [n1, vals[n1]] : neighbours[n2] = [[n1, vals[n1]]]
  end

  nodes_with_same_value = [] # in val sorted order, [val, [node]]
  vals.each_with_index do |val, i|
    idx = nodes_with_same_value.bsearch_index { |x| x[0] >= val } || nodes_with_same_value.length # sort in desc
    if idx == nodes_with_same_value.length || nodes_with_same_value[idx][0] != val
      nodes_with_same_value.insert(idx, [val, [i]])
    else
      nodes_with_same_value[idx][1] << i
    end
  end

  @parents = Array.new(vals.length)
  @parents.map!.with_index { |_, i| i }

  good_paths = 0
  # find out how many groups (unconnected subgraph) for each value
  nodes_with_same_value.each do |val, nodes|
    nodes.each do |node|
      # find node's neighbours
      next unless neighbours.key?(node)
      # union neighbours to the same groups (same subgraphs)
      ns = neighbours[node]
      ns.each do |nei_idx, nei_val|
        next if nei_val > val
        union(node, nei_idx)
      end
    end

    # count how many nodes for each group for the value after union
    groups = {}
    nodes.each do |node|
      group = find(node)
      groups[group] ? groups[group] += 1 : groups[group] = 1
    end

    groups.each do |k, size|
      good_paths += size * (size + 1) / 2
    end
  end
  good_paths
end