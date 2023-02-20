# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  start_pointer = 0
  end_pointer = nums.length - 1

  while start_pointer <= end_pointer
    mid_pointer = start_pointer + (end_pointer - start_pointer) / 2

    if target == nums[mid_pointer]
      return nums.index(target)
    elsif target > nums[mid_pointer]
      start_pointer = mid_pointer + 1
    else
      end_pointer = mid_pointer - 1
    end
  end

  start_pointer
end

p search_insert nums = [1,3,5,6], target = 7
# Example 1:
# Input: nums = [1,3,5,6], target = 5
# Output: 2
#
# Example 2:
# Input: nums = [1,3,5,6], target = 2
# Output: 1
#
# Example 3:
# Input: nums = [1,3,5,6], target = 7
# Output: 4