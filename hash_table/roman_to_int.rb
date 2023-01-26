# @param {String} s
# @return {Integer}
def roman_to_int(s)
  romans = {
    "I" => 1, "V" => 5, "X" => 10, "L" => 50,
    "C" => 100, "D" => 500, "M" => 1000
  }
  result = 0
  s.length.times do |i|
    (i + 1 < s.length && romans[s[i]] < romans[s[i + 1]]) ? result -= romans[s[i]] : result += romans[s[i]]
  end

  result
end
