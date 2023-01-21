# @param {Integer[]} nums
# @return {Integer}
def smallest_equal(nums)
  nums.each_with_index do |num, index|
    return index if index % 10 == num
  end

  -1
end
