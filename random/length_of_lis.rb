# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums)
  n = nums.size
  return 1 if n == 1
  dp = Array.new(n) { 1 }

  (1.upto(n - 1)).each do |i|
    ((i - 1).downto(0)).each do |j|
      if nums[i] > nums[j]
        dp[i] = [dp[j] + 1, dp[i]].max
      end
    end
  end

  dp.max
end
