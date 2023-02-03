# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  return [] if digits.length == 0
  combinations = []
  letters = {
    "2" => %w[a b c],
    "3" => %w[d e f],
    "4" => %w[g h i],
    "5" => %w[j k l],
    "6" => %w[m n o],
    "7" => %w[p q r s],
    "8" => %w[t u v],
    "9" => %w[w x y z],
  }

  define_method(:backtrack) do |index, path|
    if path.length == digits.length
      combinations.append(path.join(""))
      return
    end

    possible_letters = letters[digits[index]]
    p path
    possible_letters.each do |letter|
      path.append(letter)
      backtrack(index + 1, path)
      path.pop
    end
  end

  backtrack(0, [])
  combinations
end

p letter_combinations "23"