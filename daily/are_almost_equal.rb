# @param {String} s1
# @param {String} s2
# @return {Boolean}
def are_almost_equal(s1, s2)
  return true if s1 == s2
  return false if s1.length != s2.length
  
  diff = []
  s1.chars.each_with_index do |char, index|
      diff << index if char != s2[index]
  end

  if diff.length == 2
      i, j = diff
      return s1[i] == s2[j] && s1[j] == s2[i]
  end

  false
end

