# @param {Integer[]} scores
# @param {Integer[]} ages
# @return {Integer}
def best_team_score(scores, ages)
  # age_score_pair = ages.zip(scores).sort_by { |a, b| a[0] == b[0] ? a[1] - b[1] : a[0] - b[0] }
  # age_score_pair = ages.zip(scores).sort_by { |a, b| b[1] <=> a[1] }

  age_score_pair = ages.zip(scores).sort_by { |e| [e[0], e[1]] }
  p age_score_pair
  find_max_score age_score_pair
end

# @param {Integer[][]} age_score_pair
# @param {Integer[][]} dp
# @param {Integer} prev
# @param {Integer} index
# @return {Integer}
def find_max_score(age_score_pair)
  n = age_score_pair.length
  dp = Array.new(n)
  answer = 0

  (0..n - 1).each do |i|
    dp[i] = age_score_pair[i][1]
    answer = [answer, dp[i]].max
  end

  (1..(n - 1)).each do |i|
    (0..(i - 1)).reverse_each do |j|
      if age_score_pair[i][1] >= age_score_pair[j][1]
        dp[i] = [dp[i], age_score_pair[i][1] + dp[j]].max
      end
    end

    answer = [answer, dp[i]].max
  end

  p dp


  answer
end

# Input: scores = [1,2,3,5], ages = [8,9,10,1]
# Output: 6
# Explanation: It is best to choose the first 3 players.

# Input: scores = [4,5,6,5], ages = [2,1,2,1]
# Output: 16
# Explanation: It is best to choose the last 3 players. Notice that you are allowed to choose multiple people of the same age.

# p best_team_score [1, 2, 3, 5], [8, 9, 10, 1]
p best_team_score [4, 20, 5, 3, 2, 4, 30], [2, 1, 1, 2, 2, 2, 2]
