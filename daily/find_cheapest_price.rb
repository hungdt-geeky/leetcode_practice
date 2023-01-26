# @param {Integer} n
# @param {Integer[][]} flights
# @param {Integer} src
# @param {Integer} dst
# @param {Integer} k
# @return {Integer}
BN = 2 ** 32 - 1

def find_cheapest_price(n, flights, s, d, k)
  graph = graph(n, flights)
  dp = Array.new(n, BN)
  dp[s] = 0
  q = [s]
  while q.size > 0
    size = q.size
    nxt = dp.clone
    size.times do
      i = q.shift
      graph[i].each do |neb|
        j, cost = neb
        if nxt[j] > dp[i] + cost
          nxt[j] = dp[i] + cost
          q << j
        end

      end
    end
    dp = nxt
    k -= 1
    break if k < 0
  end
  dp[d] == BN ? -1 : dp[d]
end

def graph(n, flights)
  graph = {}
  (0...n).each { |i| graph[i] = Set.new }
  flights.each do |edge|
    i, j, cost = edge
    graph[i] << [j, cost]
  end
  graph
end