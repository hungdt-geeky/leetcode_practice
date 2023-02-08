# @param {Integer[]} nums
# @return {Integer}
def jump(nums)
  n = nums.length
  step = 0
  cur_end, cur_far = 0, 0

  (0...n - 1).each do |i|
    cur_far = [cur_far, nums[i] + i].max

    if i == cur_end
      step += 1
      cur_end = cur_far
    end
  end

  step
end

jump [2, 3, 1, 1, 5]
