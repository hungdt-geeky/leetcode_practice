# https://leetcode.com/problems/isomorphic-strings/?envType=study-plan&id=level-1

def is_isomorphic(s, t)
  return false if s.length != t.length

  mapping = {}

  (0..s.length-1).each do |i|
    if mapping.key?(s[i])
      return false if mapping[s[i]] != t[i]
    else
      return false if mapping.value?(t[i])
      mapping[s[i]] = t[i]
    end
  end

  true
end
