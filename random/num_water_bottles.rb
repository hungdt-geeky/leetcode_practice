# https://leetcode.com/problems/water-bottles/

# @param {Integer} num_bottles
# @param {Integer} num_exchange
# @return {Integer}
def num_water_bottles(num_bottles, num_exchange)
  result = 0
  full_bottles_size = num_bottles
  empty_bottles_size = 0

  while full_bottles_size > 0
    result += full_bottles_size
    empty_bottles_size += full_bottles_size
    full_bottles_size = empty_bottles_size / num_exchange
    empty_bottles_size = empty_bottles_size % num_exchange
  end

  result
end
