# @param {Integer[]} nums
# @param {Integer} n
# @return {Integer[]}
def shuffle(nums, n)
  aws = []
  0.upto(n - 1).each do |i|
    aws << nums[i]
    aws << nums[n + i]
  end

  p aws
end

nums = [2, 5, 1, 3, 4, 7]
n = 3
shuffle(nums, n)
