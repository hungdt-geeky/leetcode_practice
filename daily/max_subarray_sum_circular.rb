# https://leetcode.com/problems/maximum-sum-circular-subarray/description/

# @param {Integer[]} nums
# @return {Integer}
def max_subarray_sum_circular(a)
  sum = 0
  min_sum = Float::INFINITY
  max_sum = -Float::INFINITY

  new_min_sum = 0
  new_max_sum = 0
  a.each do |num|
    new_min_sum = [new_min_sum + num, num].min
    min_sum = [min_sum, new_min_sum].min

    new_max_sum = [new_max_sum + num, num].max
    max_sum = [max_sum, new_max_sum].max

    sum += num
  end

  max_sum > 0 ? [sum - min_sum, max_sum].max : max_sum
end