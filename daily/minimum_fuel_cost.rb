def dfs(node, parent, adj, seats)
  # The node itself has one representative.
  representatives = 1
  return representatives unless adj.key?(node)

  adj[node].each do |child|
    next if child == parent
    # Add count of representatives in each child subtree to the parent subtree.
    representatives += dfs(child, node, adj, seats)
  end

  # Count the fuel it takes to move to the parent node.
  # Root node does not have any parent so we ignore it.
  @fuel += (representatives.to_f / seats).ceil if node != 0
  representatives
end

def minimum_fuel_cost(roads, seats)
  adj = {}
  roads.each do |road|
    adj[road[0]] ||= []
    adj[road[0]] << road[1]
    adj[road[1]] ||= []
    adj[road[1]] << road[0]
  end

  @fuel = 0
  dfs(0, -1, adj, seats)
  @fuel
end
