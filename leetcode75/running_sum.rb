# https://leetcode.com/problems/running-sum-of-1d-array/?envType=study-plan&id=level-1

# @param {Integer[]} nums
# @return {Integer[]}
def running_sum(nums)
  running = []
  nums.each_with_index do |num, index|
    running << num + running[index - 1].to_i
  end

  p running
end
