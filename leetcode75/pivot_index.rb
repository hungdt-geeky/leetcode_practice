# https://leetcode.com/problems/find-pivot-index/?envType=study-plan&id=level-1

# @param {Integer[]} nums
# @return {Integer}
def pivot_index(nums)
  sum = nums.sum

  nums.each.with_index.reduce(0) do |left_sum, (num, index)|
    return index if left_sum == sum - num - left_sum

    left_sum + num
  end

  -1
end
