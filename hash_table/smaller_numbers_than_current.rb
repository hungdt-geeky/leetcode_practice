# @param {Integer[]} nums
# @return {Integer[]}
def smaller_numbers_than_current(nums)
  sorted = nums.sort
  hash = {}

  sorted.each_with_index do |n, i|
    hash[n] ||= i
  end

  result = []

  nums.each do |num|
    result << hash[num]
  end

  p result
end

smaller_numbers_than_current [7,7,7,7]