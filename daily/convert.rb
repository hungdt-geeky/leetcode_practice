# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  return "" if s.empty? || num_rows <= 0
  return s if num_rows == 1

  rows = Array.new(num_rows - 1, "")
  row = 0
  going_down = false
  s.chars.each do |c|
    rows[row] ||= ""
    rows[row] += c
    if row == 0 || row == num_rows - 1
      going_down = !going_down
    end
    row += going_down ? 1 : -1
  end

  rows.join
end

# p convert("PAYPALISHIRING", 3)
