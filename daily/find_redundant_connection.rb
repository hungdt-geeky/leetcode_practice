# @param {Integer[][]} edges
# @return {Integer[]}
def find_redundant_connection(edges)
  parent = Array.new(edges.length + 1) { |i| i }
  
  # Find function with path compression
  def find(parents, x)
    if parents[x] != x
      parents[x] = find(parents, parents[x]) # Path compression
    end
    parents[x]
  end
  
  # Union function
  def union(parents, x, y)
    root_x = find(parents, x)
    root_y = find(parents, y)
    
    if root_x != root_y
      parents[root_y] = root_x
      true
    else
      false
    end
  end
  
  # Iterate through each edge
  edges.each do |edge|
    u, v = edge
    if !union(parent, u, v)
      # If we cannot union, it means u and v are already connected (cycle detected)
      # Return the current edge as it is the redundant connection
      return edge
    end
  end
  
  [] # In case no edge is found, but this should not happen per problem statement
end

