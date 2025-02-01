# @param {Integer[]} nums
# @return {Boolean}
def is_array_special(nums)
  return true if nums.size <= 1
  (0..nums.size-2).each do |i|
    return false if (nums[i] % 2) == (nums[i+1] % 2)
  end
  true
end

