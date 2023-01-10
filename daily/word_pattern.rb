# https://leetcode.com/problems/word-pattern/

# @param {String} pattern
# @param {String} s
# @return {Boolean}
def word_pattern(pattern, str)
  p1 = pattern.chars
  p2 = str.split ' '
  return false if p1.size != p2.size
  matching = {}

  p1.each_with_index do |c, idx|
    ptr = "pat_#{c}" # fix for case pattern = "abc" && str = "a b c"
    st = "word_#{p2[idx]}"
    if matching[ptr].nil? && matching[st].nil?
      matching[ptr] = idx
      matching[st] = idx
    elsif !matching[ptr].nil? && !matching[st].nil? && matching[ptr] == matching[st]
      next
    else
      return false
    end
  end
  true
end

p word_pattern("aba", "dog cat dog")