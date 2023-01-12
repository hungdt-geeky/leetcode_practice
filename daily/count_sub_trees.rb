# https://leetcode.com/problems/number-of-nodes-in-the-sub-tree-with-the-same-label/

# @param {Integer} n
# @param {Integer[][]} edges
# @param {String} labels
# @return {Integer[]}
def count_sub_trees(n, edges, labels)
  result = []

  h = {}

  edges.each do |pair|
    node_a = pair[0]
    node_b = pair[1]
    h[node_a] = [] if h[node_a] == nil
    h[node_a] << node_b
    h[node_b] = [] if h[node_b] == nil
    h[node_b] << node_a
  end

  visited = {}

  visited[0] = true
  count(0, h, labels, visited, result)

  result
end

def count(node_i, h, labels, visited, result)
  counter_h = {}

  node_label = labels[node_i]
  counter_h[node_label] = 1

  if h[node_i]
    h[node_i].each do |n_i|
      next if visited[n_i]
      visited[n_i] = true
      new_h = count(n_i, h, labels, visited, result)
      new_h.each do |k, v|
        counter_h[k] = 0 if counter_h[k] == nil
        counter_h[k] += v
      end
    end
  end

  result[node_i] = counter_h[node_label]

  counter_h
end