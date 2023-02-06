# @param {String} s1
# @param {String} s2
# @return {Boolean}
# def check_inclusion(s1, s2)
#   s1_freq = Hash.new { |h, k| h[k] = 0 }
#   s2_freq = Hash.new { |h, k| h[k] = 0 }
#
#   s1.each_char do |char|
#     s1_freq[char] += 1
#   end
#
#   i = 0
#   while i < s1.size
#     s2_freq[s2[i]] += 1
#
#     i += 1
#   end
#
#   left = 0
#   right = s1.size - 1
#   while right < s2.size
#     if s2_freq == s1_freq
#       return true
#     end
#
#     right += 1
#     s2_freq[s2[right]] += 1
#
#     s2_freq[s2[left]] -= 1
#     if s2_freq[s2[left]] == 0
#       s2_freq.delete(s2[left])
#     end
#     left += 1
#   end
#
#   false
# end

# @param {String} s1
# @param {String} s2
# @return {Boolean}
def check_inclusion(s1, s2)
  return false if s1.size > s2.size

  s1_h = Hash.new(0)
  s1.each_char { |c| s1_h[c] += 1 }
  p s1_h
  i, j = 0, 0

  while j < s2.size
    if s1_h[s2[j]] != 0
      s1_h[s2[j]] -= 1
      return true if j - i == s1.size - 1
      j += 1
    elsif i == j
      i += 1
      j += 1
    else
      s1_h[s2[i]] += 1
      i += 1
    end
  end

  false
end

s1 = "ab"
s2 = "cao"
p check_inclusion s1, s2