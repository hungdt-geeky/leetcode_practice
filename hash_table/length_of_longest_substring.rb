# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  n = s.length
  ans = 0
  map = {}

  i = 0
  0.upto(n - 1).each do |j|
    i = [map[s[j]], i].max if map[s[j]]
    ans = [ans, j - i + 1].max
    map[s[j]] = j + 1
  end

  p map

  ans
end

p length_of_longest_substring "pwwkew"