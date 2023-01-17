# https://leetcode.com/problems/flip-string-to-monotone-increasing/

# @param {String} s
# @return {Integer}
def min_flips_mono_incr(s)
  ans = 0
  num = 0

  s.chars.each do |char|
    if char == "0"
      ans = [num, ans + 1].min
    else
      num += 1
    end
  end

  ans
end
