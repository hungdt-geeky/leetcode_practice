# @param {String} s
# @param {String} t
# @return {Boolean}
def backspace_compare(s, t)
  format_string(s) == format_string(t)
end

# def backspace_compare(s, t)
#   [s, t].map { |x| x.chars.each_with_object([]) { _1 == '#' ? _2.pop : _2.push(_1) } }.reduce(:==)
# end

def format_string(s)
  result = []

  s.chars.each do |char|
    if char != "#"
      result.push(char)
    else
      result.pop
    end
  end

  result.join("")
end

s = "ab#c"
t = "ad#c"

p backspace_compare(s, t)
