# https://leetcode.com/problems/minimum-time-to-collect-all-apples-in-a-tree/

class Solver
    attr_reader :neighb, :has_apple, :visited

    def initialize(n, edges, has_apple)
        @has_apple, @visited, @neighb = has_apple, Array.new(n, false), Array.new(n) {|i| Array.new }
        edges.each {|p, c| 
            @neighb[p] << c
            @neighb[c] << p
        }
    end

    def solve(n = 0)
        return 0 if visited[n]
        @visited[n] = true
        cn = neighb[n].collect {|c| solve(c) }.sum
        cn + (n.positive? && (cn.positive? || has_apple[n]) ? 2 : 0)
    end
end

# @param {Integer} n
# @param {Integer[][]} edges
# @param {Boolean[]} has_apple
# @return {Integer}
def min_time(n, edges, has_apple)
    Solver.new(n, edges, has_apple).solve
end