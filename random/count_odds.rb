# @param {Integer} low
# @param {Integer} high
# @return {Integer}
def count_odds(low, high)
  aws = 0
  aws += 1 if high.odd?
  aws += 1 if low.odd?
  aws + (aws == 2 ? (high - low) / 2 - 1 : (high - low) / 2)
end
