# @param {String} jewels
# @param {String} stones
# @return {Integer}
def num_jewels_in_stones(jewels, stones)
  stone_hash = {}

  stones.each_char do |char|
    stone_hash[char] ||= 0
    stone_hash[char] += 1
  end

  result = 0

  jewels.each_char do |jewel|
    result += stone_hash[jewel].to_i
  end

  result
end
