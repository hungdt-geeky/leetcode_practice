# https://leetcode.com/problems/greatest-common-divisor-of-strings/

# Brute Force
# @param {String} str1
# @param {String} str2
# @return {String}
def gcd_of_strings_bf(str1, str2)
  n1, n2 = str1.length, str2.length

  define_method(:valid?) do |k|
    return false if n1 % k != 0 || n2 % k != 0
    q1, q2 = n1 / k, n2 / k
    base = str1[0..k - 1]
    str1 == base * q1 && str2 == base * q2
  end

  (n2.gcd(n1)).downto(1).each do |i|
    return str1[0..i - 1] if valid?(i)
  end

  ""
end

# Greatest Common Divisor
# @param {String} str1
# @param {String} str2
# @return {String}
def gcd_of_strings(str1, str2)
  return "" if str1 + str2 != str2 + str1

  max_length = str1.length.gcd(str2.length)

  str1[0..max_length - 1]
end
