# https://leetcode.com/problems/detect-capital/

# @param {String} word
# @return {Boolean}
def detect_capital_use(word)
  upper_case_count = 0
  lower_case_count = 0
  word_length = word.chars.length
  first_char_flag = false

  (0..word_length - 1).each do |i|
    char = word.chars[i]
    if "a" <= char && char <= "z"
      lower_case_count += 1
    end

    if "A" <= char && char <= "Z"
      upper_case_count += 1

      if i == 0
        first_char_flag = true
      end
    end
  end

  (lower_case_count == word_length - 1 && first_char_flag) ||
    (upper_case_count == word_length) ||
    (lower_case_count == word_length)
end

p detect_capital_use("USA")