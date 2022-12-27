# https://leetcode.com/problems/is-subsequence/?envType=study-plan&id=level-1

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_subsequence(s, t)
  j = 0
  (0..t.length - 1).each do |i|
    if s[j] == t[i]
      j += 1
    end
  end

  j == s.length
end
