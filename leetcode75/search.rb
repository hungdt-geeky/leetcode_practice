# https://leetcode.com/problems/binary-search/?envType=study-plan&id=level-1

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  left = 0
  right = nums.length - 1

  while left <= right
    mid = (left + right) / 2
    return mid if nums[mid] == target
    right = mid - 1 if nums[mid] > target
    left = mid + 1 if nums[mid] < target
  end

  -1
end

p search([2,5], 15)