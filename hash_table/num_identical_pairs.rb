# @param {Integer[]} nums
# @return {Integer}
def num_identical_pairs(nums)
  hash = Hash.new(0)

  result = 0
  nums.each do |num|
    result += hash[num]

    hash[num] += 1
  end

  p hash

  result
end
