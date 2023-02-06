# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
  return [] if s.size < p.size

  ans = []
  p_h = Hash.new(0)
  p.each_char { |char| p_h[char] += 1 }
  i, j = 0, 0

  while j < s.size
    if p_h[s[j]] != 0
      p_h[s[j]] -= 1
      ans << (j - p.size + 1) if j - i == p.size - 1
      j += 1
    elsif i == j
      i += 1
      j += 1
    else
      p_h[s[i]] += 1
      i += 1
    end
  end

  ans
end

p find_anagrams s = "abab", p = "abc"
