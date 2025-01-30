def magnificent_sets(n, edges)
    adj = Array.new(n + 1) { [] }
    edges.each do |a, b|
        adj[a] << b
        adj[b] << a
    end

    visited = Array.new(n + 1, false)
    total = 0

    (1..n).each do |i|
        next if visited[i]

        # Find the component and check bipartition
        component = []
        queue = [i]
        visited[i] = true
        color = { i => 0 }
        is_bipartite = true
        while !queue.empty?
            u = queue.shift
            component << u
            adj[u].each do |v|
                if !visited[v]
                    visited[v] = true
                    color[v] = color[u] ^ 1
                    queue << v
                else
                    if color[v] == color[u]
                        is_bipartite = false
                    end
                end
            end
        end

        return -1 unless is_bipartite

        # Function to perform BFS and find the maximum distance from a starting node
        bfs = lambda do |start|
            visited_bfs = Hash.new(false)
            q = [[start, 0]]
            visited_bfs[start] = true
            max_dist = 0
            while !q.empty?
                node, dist = q.shift
                max_dist = [max_dist, dist].max
                adj[node].each do |neighbor|
                    unless visited_bfs[neighbor]
                        visited_bfs[neighbor] = true
                        q << [neighbor, dist + 1]
                    end
                end
            end
            max_dist
        end

        # Find the maximum distance from each node in the component
        max_groups = 0
        component.each do |node|
            max_groups = [max_groups, bfs.call(node)].max
        end
        total += max_groups + 1
    end

    total
end

