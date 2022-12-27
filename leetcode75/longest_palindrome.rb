# https://leetcode.com/problems/longest-palindrome/?envType=study-plan&id=level-1

# @param {String} s
# @return {Integer}
def longest_palindrome(s)
    res = s.chars.tally.inject(0){|r, q| r += (q.last / 2)} * 2
    res < s.length ? res + 1 : res
end
