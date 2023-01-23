# @param {Integer} n
# @param {Integer[][]} trust
# @return {Integer}
def find_judge(n, trust)
  town_people = Array.new(n + 1, 0)

  trust.each do |trusts, to_be_trusted|
    town_people[trusts] = -1
    town_people[to_be_trusted] += 1
  end

  town_people.find_index(n - 1) || -1
end

# def find_judge(n, trust)
#   trusting = [0] * (n + 1)
#   trusted = [0] * (n + 1)
#   trust.each do |from, to|
#     trusting[from] += 1
#     trusted[to] += 1
#   end
#
#   (1..n).detect { |i| trusting[i] == 0 && trusted[i] == n - 1 } || -1
# end

p find_judge(2, [[1, 2], [2, 1]])