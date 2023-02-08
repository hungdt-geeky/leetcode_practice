# Approach: Brute Force
# @param {Integer[]} nums
# @return {Boolean}
# def can_jump(nums)
#   n = nums.length
#
#   return true if n <= 1
#
#   queue = [n - 1]
#
#   until queue.empty?
#     goal = queue.pop
#     0.upto(goal - 1).each do |i|
#       queue << i if goal - i <= nums[i]
#     end
#
#     return true if queue.include?(0)
#   end
#
#   false
# end

# Approach: Dynamic Programming
# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  dp = Hash.new { 0 }
  dp[0] = nums[0]
  n = nums.length

  1.upto(n - 1).each do |i|
    if dp[i - 1] > 0
      dp[i] = [dp[i - 1] - 1, nums[i]].max
    else
      dp[i] = -1
    end
  end

  p dp

  dp[n - 1] != -1
end

p can_jump [2, 3, 1, 1, 5]
