# @param {Integer} num
# @return {String}
def int_to_roman(num)
  return if num.nil?

  result = ""
  roman_numerals = {
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
  }

  roman_numerals.each do |integer, roman|
    while num >= integer
      result += roman
      num -= integer
    end
  end

  result
end

p int_to_roman(1994)